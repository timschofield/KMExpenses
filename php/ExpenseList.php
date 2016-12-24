<?php

include('includes/session.inc');

$SQL = "SELECT pcexpenses.codeexpense,
				pcexpenses.description,
				pctabs.defaulttag
			FROM pctabexpenses, pcexpenses, pctabs
			WHERE pctabexpenses.codeexpense = pcexpenses.codeexpense
				AND pctabexpenses.typetabcode = pctabs.typetabcode
				AND pctabs.tabcode = '" . $_POST['Tab'] . "'
			ORDER BY pcexpenses.codeexpense ASC";
$Result = DB_query($SQL);

$html = '<option value="">' . _('Not Yet Selected') . '</option>';
while ($MyRow = DB_fetch_array($Result)) {
	if (isset($_POST['SelectedExpense']) and $MyRow['codeexpense'] == $_POST['SelectedExpense']) {
		$html .= '<option selected="selected" value="' . $MyRow['codeexpense'] . '">' . $MyRow['codeexpense'] . ' - ' . $MyRow['description'] . '</option>';
	} else {
		$html .= '<option value="' . $MyRow['codeexpense'] . '">' . $MyRow['codeexpense'] . ' - ' . $MyRow['description'] . '</option>';
	}
	$DefaultTag = $MyRow['defaulttag'];
} //end while loop

echo $html;
?>