<?php

include('includes/session.inc');

$SQL = "SELECT defaulttag FROM pctabs WHERE tabcode='" . $_POST['Tab'] . "'";
$Result = DB_query($SQL);
$MyRow = DB_fetch_array($Result);
$DefaultTag = $MyRow['defaulttag'];

$SQL = "SELECT tagref,
				tagdescription
			FROM tags
			ORDER BY tagref";
$Result = DB_query($SQL);
if (!isset($_POST['Tag'])) {
	$_POST['Tag'] = $DefaultTag;
}
echo '<option value="0">0 - ', _('None'), '</option>';
while ($MyRow = DB_fetch_array($Result)) {
	if ($_POST['Tag'] == $MyRow['tagref']) {
		echo '<option selected="selected" value="', $MyRow['tagref'], '">', $MyRow['tagref'], ' - ', $MyRow['tagdescription'], '</option>';
	} else {
		echo '<option value="', $MyRow['tagref'], '">', $MyRow['tagref'], ' - ', $MyRow['tagdescription'], '</option>';
	}
}

echo $html;
?>