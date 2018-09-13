<?php
session_start();
require "assets/include/function.php";
logoutCustomer($_SESSION["account"]["pseudo"], true);
?>
