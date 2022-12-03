<?php

namespace Dao\Security;

final class UsuarioTipo extends \Utilities\Enum
{
    const PUBLICO  = "PBL";
    const ADMINITRADAOR = "ADM";
    const AUDITOR = "AUD";
    const CLIENTE = "CLI";
    const PROVEEDOR = "PRV";
}
?>