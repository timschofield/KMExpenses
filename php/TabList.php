<?php

include('includes/session.inc');

$SQL = "SELECT tabcode
		FROM pctabs
		WHERE usercode='" . $_POST['UserID'] . "'";

$Result = DB_query($SQL);
$html = '<option value="">' . _('Not Yet Selected') . '</option>';
while ($MyRow = DB_fetch_array($Result)) {
	if (isset($_POST['SelectTabs']) and $MyRow['tabcode'] == $_POST['SelectTabs']) {
		$html .= '<option selected="selected" value="' . $MyRow['tabcode'] . '">' . $MyRow['tabcode'] . '</option>';
	} else {
		$html .= '<option value="' . $MyRow['tabcode'] . '">' . $MyRow['tabcode'] . '</option>';
	}
} //end while loop


echo $html;
?>