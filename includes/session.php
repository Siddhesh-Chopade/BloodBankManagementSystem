<?php
if(session_status()===PHP_SESSION_NONE) session_start();
function require_role($role=null){
 if(empty($_SESSION['user'])) { header('Location: /login.php'); exit; }
 if($role && ($_SESSION['user']['role']??null)!==$role) { http_response_code(403); exit('Access denied'); }
}
?>