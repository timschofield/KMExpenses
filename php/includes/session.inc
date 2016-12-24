<?php

include('config.php');

if (isset($SessionSavePath)) {
	session_save_path($SessionSavePath);
} //isset($SessionSavePath)

session_write_close(); //in case a previous session is not closed
if (isset($_POST['SID'])) {
	session_id($_POST['SID']);
} else {
	session_id(sha1($_POST['uuid'].date('U')));
}
session_start();
$_SESSION['CompanyDefaultsLoaded']=true;
if (isset($_POST['UserNameEntryField'])) {
	$_SESSION['DatabaseName'] = $_POST['UserNameEntryField'];
}

include('includes/ConnectDB.inc');
include('includes/DateFunctions.inc');

/* only do security checks if AllowAnyone is not true */
if (!isset($AllowAnyone) or !isset($_SESSION['CompanyDefaultsLoaded'])) {
	/* only do security checks if AllowAnyone is not true */

	include 'includes/UserLogin.php';
	/* Login checking and setup */

	if (isset($_POST['UserNameEntryField']) and isset($_POST['Password'])) {
		$rc = userLogin($_POST['UserNameEntryField'], $_POST['Password'], $SysAdminEmail);
	} //isset($_POST['UserNameEntryField']) and isset($_POST['Password'])
	elseif (empty($_SESSION['DatabaseName'])) {
		$rc = UL_SHOWLOGIN;
	} //empty($_SESSION['DatabaseName'])
	else {
		$rc = UL_OK;
	}
}

if (isset($_SESSION['LastActivity']) and (time() - $_SESSION['LastActivity']) > $SessionLifeTime) {
	if (basename($_SERVER['SCRIPT_NAME']) != 'Logout.php') {
		header('Location: Logout.php');
	}
} else {
	$_SESSION['LastActivity'] = time();
}

if (!isset($_SESSION['CompanyDefaultsLoaded'])) {
	include($PathPrefix . 'includes/GetConfig.php');
	if (!isset($_SESSION['DBUpdateNumber'])) {
		$_SESSION['DBUpdateNumber'] = 0;
	}
}

if (isset($_POST['Theme']) and ($_SESSION['UsersRealName'] == $_POST['RealName'])) {
	$_SESSION['Theme'] = $_POST['Theme'];
}

function CryptPass($Password) {
	if (PHP_VERSION_ID < 50500) {
		$Salt = base64_encode(mcrypt_create_iv(22, MCRYPT_DEV_URANDOM));
		$Salt = str_replace('+', '.', $Salt);
		$Hash = crypt($Password, '$2y$10$' . $Salt . '$');
	} else {
		$Hash = password_hash($Password, PASSWORD_DEFAULT);
	}
	return $Hash;
}

function VerifyPass($Password, $Hash) {
	if(PHP_VERSION_ID < 50500) {
		return (crypt($Password, $Hash) == $Hash);
	} else {
		return password_verify($Password, $Hash);
	}
}

?>