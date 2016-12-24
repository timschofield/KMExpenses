<?php

/* Session started in session.inc for password checking and authorisation level check
config.php is in turn included in session.inc $PageSecurity now comes from session.inc (and gets read in by GetConfig.php*/

include('includes/session.inc');

$SQL = "SELECT taxcategories.taxcatid,taxrate FROM taxauthrates INNER JOIN taxcategories ON taxauthrates.taxcatid=taxcategories.taxcatid";

$Result = DB_query($SQL);

$i = 0;
while ($MyRow = DB_fetch_array($Result)) {
	$Response[$i]['ID'] = $MyRow['taxcatid'];
	$Response[$i]['Rate'] = $MyRow['taxrate'];
	++$i;
}

echo json_encode($Response);
exit;

?>