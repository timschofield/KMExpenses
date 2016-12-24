<?php
$PageSecurity = 0;

include('includes/session.inc');

$SQL = "SELECT confvalue FROM config WHERE confname='DefaultDateFormat';";
$Result = DB_query($SQL);
$MyRow = DB_fetch_array($Result);

$Response['Code'] = $rc;
$Response['SID'] = session_id();
$Response['DefaultDateFormat'] = $MyRow['confvalue'];

echo json_encode($Response);

exit;

?>