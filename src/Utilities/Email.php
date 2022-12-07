<?php
namespace Utilities;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class Email{
    //Envia un correo elecrónico
    public static function sendEmail($to, $subject, $body, $from = null, $fromName = null, $attachments = null)
    {
        
        $mail = new PHPMailer(true);
        $mail->isSMTP();
        $mail->SMTPDebug = 0;
        $mail->Host = \Utilities\Context::getContextByKey("SMTP_HOST");
        $mail->Port = \Utilities\Context::getContextByKey("SMTP_PORT");
        $mail->SMTPSecure = \Utilities\Context::getContextByKey("SMTP_SECURE");
        $mail->SMTPAuth = true;
        $mail->Username = \Utilities\Context::getContextByKey("SMTP_USER");
        $mail->Password = \Utilities\Context::getContextByKey("SMTP_PSWD");
        $mail->setFrom($from, $fromName);
        $mail->addAddress($to);
        if ($attachments) {
            foreach ($attachments as $attachment) {
                $mail->addAttachment($attachment);
            }
        }
        $mail->Subject = $subject;
        $mail->msgHTML($body);
        $mail->AltBody = 'Este es un mensaje de texto plano para clientes de correo electrónico que no admiten HTML';
        if (!$mail->send()) {
            throw new \Exception("Mailer Error: " . $mail->ErrorInfo);
        }
    }
}
?>