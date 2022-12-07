<?php
namespace Dao\Security;

if (version_compare(phpversion(), '7.4.0', '<')) {
        define('PASSWORD_ALGORITHM', 1);  //BCRYPT
} else {
    define('PASSWORD_ALGORITHM', '2y');  //BCRYPT
}
/*
usercod     bigint(10) AI PK
useremail   varchar(80)
username    varchar(80)
userpswd    varchar(128)
userfching  datetime
userpswdest char(3)
userpswdexp datetime
userest     char(3)
useractcod  varchar(128)
userpswdchg varchar(128)
usertipo    char(3)

 */

use Exception;

class Security extends \Dao\Table
{
    static public function getUsuarios($filter = "", $page = -1, $items = 0)
    {
        $sqlstr = "";
        if ($filter == "" && $page == -1 && $items == 0) {
            $sqlstr = "SELECT * FROM usuario;";
        } else {
            //TODO: Terminar consultas FACET
            if ($page = -1 and $items = 0) {
                $sqlstr = sprintf("SELECT * FROM usuarios %s;", $filter);
            } else {
                $offset = ($page -1 * $items);
                $sqlstr = sprintf(
                    "SELECT * FROM usuarios %s limit %d, %d;",
                    $filter,
                    $offset,
                    $items
                );
            }
        }
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function newUsuario($userType, $email, $userN, $password)
    {
        if (!\Utilities\Validators::IsValidEmail($email)) {
            throw new Exception("Correo no es válido");
        }
        if (!\Utilities\Validators::IsValidPassword($password)) {
            throw new Exception("Debe ser almenos 8 caracteres, 1 número, 1 mayúscula, 1 símbolo especial");
        }

        $newUser = self::_usuarioStruct();
        //Tratamiento de la Contraseña
        $hashedPassword = self::_hashPassword($password);
        

        unset($newUser["usercod"]);
        unset($newUser["userfching"]);
        unset($newUser["userpswdchg"]);

        $newUser["useremail"] = $email;
        $newUser["username"] = $userN;
        $newUser["userpswd"] = $hashedPassword;
        $newUser["userpswdest"] = Estados::ACTIVO;
        $newUser["userpswdexp"] = date('Y-m-d', time() + 7776000);  //(3*30*24*60*60) (m d h mi s)
        $newUser["userest"] = Estados::ACTIVO;
        //$newUser["useractcod"] = hash("sha256", $email.time());
        $newUser["emailverified"] = "ITSNV";
        $newUser["useractcod"] ="";
        $newUser["usertipo"] = $userType;

        $sqlIns = "INSERT INTO `usuario` (`useremail`, `username`, `userpswd`,
            `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`,
            `userpswdchg`, `usertipo`, `emailverified`) 
            VALUES
            ( :useremail, :username, :userpswd,
            now(), :userpswdest, :userpswdexp, :userest, :useractcod,
            now(), :usertipo, :emailverified);";

        return self::executeNonQuery($sqlIns, $newUser);
    }

    //funcion que inserte en userdetails solo el usercod y idworzone
    static public function newUserDetails($usercod, $idworkzone)
    {
        $sqlIns = "INSERT INTO `user_details` (`usercod`, `idworkzone`) 
            VALUES
            ( :usercod, :idworkzone);";

        return self::executeNonQuery($sqlIns, array("usercod" => $usercod, "idworkzone" => $idworkzone));
    }

    //funcion para actualizar tabla userdetails
    static public function updateUserDetails($iduserdetails, $firstname,
     $lastname, $address, $phonenumber, $imgprofile, $img_portada)
    {
      $params = array(
        "iduserdetails" => $iduserdetails,
        "firstname" => $firstname,
        "lastname" => $lastname,
        "address" => $address,
        "phonenumber" => $phonenumber,
        "imgprofile" => $imgprofile,
        "img_portada" => $img_portada
      );
        $sqlUpd = "UPDATE user_details SET
         firstname = :firstname,
          lastname = :lastname,
            address = :address,
            phonenumber = :phonenumber, 
            imgprofile = :imgprofile,
            img_portada = :img_portada
            WHERE iduserdetails = :iduserdetails;";
        return self::executeNonQuery($sqlUpd, $params);
    }
    
   
    static public function updatePin($useremail, $pin){
        $sqlupd="UPDATE usuario SET useractcod=:useractcod WHERE useremail=:useremail;";
        $params = array(
            "useremail" => $useremail,
            "useractcod" => $pin
        );
        return self::executeNonQuery($sqlupd, $params);
    }
    
    static public function updateEmailVerified($useremail, $emailverified){
        $sqlstr = "UPDATE usuario SET emailverified = :emailverified WHERE useremail = :useremail;";
        return self::executeNonQuery($sqlstr, array("useremail" => $useremail, "emailverified" => $emailverified));
    }

    static public function insertWorkZones($iddepto, $idmunicipality,$status){
        $sqlstr = "INSERT INTO work_zones (iddepto, idmunicipality, status) VALUES (:iddepto, :idmunicipality, :status);";
        return self::executeNonQuery($sqlstr, array("iddepto" => $iddepto, "idmunicipality" => $idmunicipality, "status" => $status));
       
    }
    static public function getDepartments()
    {
        $sqlstr = "SELECT * FROM departments;";
        return self::obtenerRegistros($sqlstr, array());
    }
   
    static public function getZones()
    {
        $sqlstr = "SELECT * FROM work_zones;";
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function getMunicipios()
    {
        $sqlstr = "SELECT * FROM municipalities;";
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function getUsuarioByEmail($email)
    {
        $sqlstr = "SELECT * from `usuario` where `useremail` = :useremail ;";
        $params = array("useremail"=>$email);

        return self::obtenerUnRegistro($sqlstr, $params);
    }

//get last iduserdetails
    static public function getLastIdUserDetails()
    {
        $sqlstr = "SELECT MAX(iduserdetails) iduserdetails FROM user_details;";
        $userid=self::obtenerUnRegistro($sqlstr, array());
        return $userid["iduserdetails"];
    }
    static public function getLastUsercod()
    {
        $sqlstr = "SELECT MAX(usercod) usercod from `usuario`;";
        $usercod= self::obtenerUnRegistro($sqlstr, array());
        return $usercod["usercod"];
    }

    static public function getWorkzoneByDeptoAndMunicipality($iddepto, $idmunicipality)
    {
        $sqlstr = "SELECT * from work_zones where iddepto = :iddepto and idmunicipality = :idmunicipality;";
        $params = array("iddepto"=>$iddepto, "idmunicipality"=>$idmunicipality);

        return self::obtenerUnRegistro($sqlstr, $params);
    }

    static private function _saltPassword($password)
    {
        return hash_hmac(
            "sha256",
            $password,
            \Utilities\Context::getContextByKey("PWD_HASH")
        );
    }

    static public function _hashPassword($password)
    {
        return password_hash(self::_saltPassword($password), PASSWORD_ALGORITHM);
    }

    static public function verifyPassword($raw_password, $hash_password)
    {
        return password_verify(
            self::_saltPassword($raw_password),
            $hash_password
        );
    }


    static private function _usuarioStruct()
    {
        return array(
            "usercod"      => "",
            "useremail"    => "",
            "username"     => "",
            "userpswd"     => "",
            "userfching"   => "",
            "userpswdest"  => "",
            "userpswdexp"  => "",
            "userest"      => "",
            "useractcod"   => "",
            "userpswdchg"  => "",
            "usertipo"     => "",
        );
    }

    static public function getFeature($fncod)
    {
        $sqlstr = "SELECT * from funciones where fncod=:fncod;";
        $featuresList = self::obtenerRegistros($sqlstr, array("fncod"=>$fncod));
        return count($featuresList) > 0;
    }

    static public function addNewFeature($fncod, $fndsc, $fnest, $fntyp )
    {
        $sqlins = "INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`)
            VALUES (:fncod , :fndsc , :fnest , :fntyp );";

        return self::executeNonQuery(
            $sqlins,
            array(
                "fncod" => $fncod,
                "fndsc" => $fndsc,
                "fnest" => $fnest,
                "fntyp" => $fntyp
            )
        );
    }

    static public function getFeatureByUsuario($userCod, $fncod)
    {
        $sqlstr = "select * from
        funciones_roles a inner join roles_usuarios b on a.rolescod = b.rolescod
        where a.fnrolest = 'ACT' and b.roleuserest='ACT' and b.usercod=:usercod
        and a.fncod=:fncod limit 1;";
        $resultados = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod"=> $userCod,
                "fncod" => $fncod
            )
        );
        return count($resultados) > 0;
    }

    static public function existWorkzone($iddepto,$idmunicipality)
    {
        $sqlstr = "SELECT * from work_zones where iddepto=:iddepto and idmunicipality=:idmunicipality;";
        $workzonesList = self::obtenerRegistros($sqlstr, array("iddepto"=>$iddepto,"idmunicipality"=>$idmunicipality));
        return (count($workzonesList) > 0) ? $workzonesList[0]["idworkzone"] : "0";
    } 
    static public function getRol($rolescod)
    {
        $sqlstr = "SELECT * from roles where rolescod=:rolescod;";
        $featuresList = self::obtenerRegistros($sqlstr, array("rolescod" => $rolescod));
        return count($featuresList) > 0;
    }

    static public function addNewRol($rolescod, $rolesdsc, $rolesest)
    {
        $sqlins = "INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`)
        VALUES (:rolescod, :rolesdsc, :rolesest);";

        return self::executeNonQuery(
            $sqlins,
            array(
                "rolescod" => $rolescod,
                "rolesdsc" => $rolesdsc,
                "rolesest" => $rolesest
            )
        );
    }

    static public function isUsuarioInRol($userCod, $rolescod)
    {
        $sqlstr = "select * from roles a inner join
        roles_usuarios b on a.rolescod = b.rolescod where a.rolesest = 'ACT'
        and b.usercod=:usercod and a.rolescod=:rolescod limit 1;";
        $resultados = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod" => $userCod,
                "rolescod" => $rolescod
            )
        );
        return count($resultados) > 0;
    }

    static public function getRolesByUsuario($userCod)
    {
        $sqlstr = "select * from roles a inner join
        roles_usuarios b on a.rolescod = b.rolescod where a.rolesest = 'ACT'
        and b.usercod=:usercod;";
        $resultados = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod" => $userCod
            )
        );
        return $resultados;
    }

    static public function removeRolFromUser($userCod, $rolescod)
    {
        $sqldel = "UPDATE roles_usuarios set roleuserest='INA' 
        where rolescod=:rolescod and usercod=:usercod;";
        return self::executeNonQuery(
            $sqldel,
            array("rolescod"=>$rolescod, "usercod"=>$userCod)
        );
    }

    static public function removeFeatureFromRol($fncod, $rolescod)
    {
        $sqldel = "UPDATE funciones_roles set roleuserest='INA'
        where fncod=:fncod and rolescod=:rolescod;";
        return self::executeNonQuery(
            $sqldel,
            array("fncod" => $fncod, "rolescod" => $rolescod)
        );
    }
    static public function getUnAssignedFeatures($rolescod)
    {
        
    }
    static public function getUnAssignedRoles($userCod)
    {

    }
    private function __construct()
    {
    }
    private function __clone()
    {
    }
    //Actualiza el token del usuario creando uno nuevo con una nueva fecha de expiración de 1 hora
    static public function updateToken($user){
        $sqlstr = "UPDATE usuario SET token=:token, tokenexp=:tokenexp, tokenest='ACT' WHERE usercod=:usercod;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $user["usercod"],
                "token" => $user["token"],
                "tokenexp" => $user["tokenexp"]
            )
        );
    }

    //Obtiene el usuario por el token
    static public function getByToken($token){
        $sqlstr = "SELECT tokenexp, token, useremail FROM usuario WHERE token=:token AND tokenest='ACT';";
        $usuarios = self::obtenerRegistros($sqlstr, array("token" => $token));
        return count($usuarios) > 0 ? $usuarios[0] : false;
    }

    //Actualiza la contraseña del usuario (La contraseña ya debe estar encriptada) y desactiva el token
    static public function updatePassword($user){
        $sqlstr = "UPDATE usuario SET userpswd=:userpswd, tokenest=:tokenest   WHERE usercod=:usercod;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $user["usercod"],
                "userpswd" => $user["password"],
                "tokenest" => $user["tokenest"]
            )
        );
    }
}


?>
