<?php

include('includes/session.inc');

//initialise no input errors assumed initially before we test
$InputError = 0;

/* actions to take once the user has clicked the submit button
ie the page has called itself with some user input */
$_SESSION['DefaultDateFormat'] = $_POST['DefaultDateFormat'];
//first off validate inputs sensible

if ($_POST['SelectedExpense'] == '') {
	$Response['ErrorCode'] = 100;
	$Response['ErrorMessage'] = _('You have not selected an expense to claim on this tab');
	echo json_encode($Response);
	exit;
} elseif ($_POST['Amount'] == 0) {
	$Response['ErrorCode'] = 101;
	$Response['ErrorMessage'] = _('The Amount must be greater than 0');
	echo json_encode($Response);
	exit;
}
/*
if (!is_date($_POST['Date'])) {
	$Response['ErrorCode'] = 102;
	$Response['ErrorMessage'] = _('The date input is not a right format');
	echo json_encode($Response);
	exit;
}
*/
// First check the type is not being duplicated
// Add new record on submit

$SQL = "INSERT INTO pcashdetails (counterindex,
									tabcode,
									tag,
									date,
									codeexpense,
									amount,
									authorized,
									posted,
									notes)
							VALUES (NULL,
									'" . $_POST['SelectedTabs'] . "',
									'" . $_POST['Tag'] . "',
									'" . FormatDateForSQL($_POST['Date']) . "',
									'" . $_POST['SelectedExpense'] . "',
									'" . -filter_number_format($_POST['Amount']) . "',
									0,
									0,
									'" . $_POST['Notes'] . "'
									)";

$Msg = _('The Expense Claim on Tab') . ' ' . $_POST['SelectedTabs'] . ' ' . _('has been created');
$Result = DB_query($SQL);
$SelectedIndex = DB_Last_Insert_ID('pcashdetails', 'counterindex');

foreach ($_POST as $Index => $Value) {
	if (substr($Index, 0, 5) == 'index') {
		$Index = $Value;
		$SQL = "INSERT INTO pcashdetailtaxes (counterindex,
													pccashdetail,
													calculationorder,
													description,
													taxauthid,
													purchtaxglaccount,
													taxontax,
													taxrate,
													amount
											) VALUES (
													NULL,
													'" . $SelectedIndex . "',
													'" . $_POST['CalculationOrder' . $Index] . "',
													'" . $_POST['Description' . $Index] . "',
													'" . $_POST['TaxAuthority' . $Index] . "',
													'" . $_POST['TaxGLAccount' . $Index] . "',
													'" . $_POST['TaxOnTax' . $Index] . "',
													'" . $_POST['TaxRate' . $Index] . "',
													'" . $_POST['TaxAmount' . $Index] . "'
											)";
		$Result = DB_query($SQL);
	}
}
if (isset($_FILES['Receipt']) and $_FILES['Receipt']['name'] != '') {

	$UploadTheFile = 'Yes'; //Assume all is well to start off with
	if ($_FILES['Receipt']['error'] !== 0) {
	}

	//But check for the worst
	if ($_FILES['Receipt']['error'] === UPLOAD_ERR_INI_SIZE) { //File Size Check
		$Response['ErrorMessage'] = _('The file size is over the maximum allowed. The maximum size allowed in KB is') . ' ' . $_SESSION['MaxImageSize'];
		$UploadTheFile = 'No';
	} elseif ($_FILES['Receipt']['type'] != 'image/jpeg' and $_FILES['Receipt']['type'] != 'image/png') { //File Type Check
		$Response['ErrorMessage'] = _('Only jpg or png files can be uploaded');
		$UploadTheFile = 'No';
	} elseif ($_FILES['Receipt']['error'] == 6) { //upload temp directory check
		$Response['ErrorMessage'] = _('No tmp directory set. You must have a tmp directory set in your PHP for upload of files.');
		$UploadTheFile = 'No';
	}

	if ($UploadTheFile == 'Yes') {
		$Name = $_FILES['Receipt']['name'];
		$Type = $_FILES['Receipt']['type'];
		$Size = $_FILES['Receipt']['size'];
		$fp = fopen($_FILES['Receipt']['tmp_name'], 'r');
		$Content = fread($fp, $Size);
		$Content = addslashes($Content);
		fclose($fp);
		$SQL = "INSERT INTO pcreceipts VALUES('" . $SelectedIndex . "',
												'" . $Name . "',
												'" . $Type . "',
												" . $Size . ",
												'" . $Content . "'
												)";
		$Result = DB_query($SQL);

	}
}
prnMsg($Msg, 'success');

$Response['ErrorCode'] = 0;
echo json_encode($Response);
exit;

?>