<?php
// Production entry point: serve the standalone portal or replace with your PHP router.
header('Content-Type: text/html; charset=utf-8');
readfile(__DIR__ . '/index.html');
?>