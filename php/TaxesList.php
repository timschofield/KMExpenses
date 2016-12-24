<?php

include('includes/session.inc');

$SQL = "SELECT confvalue FROM config WHERE confname='DefaultTaxCategory'";
$Result = DB_query($SQL);
$MyRow = DB_fetch_array($Result);
$DefaultTaxCategory= $MyRow['confvalue'];


$SQL = "SELECT taxgrouptaxes.calculationorder,
				taxauthorities.description,
				taxgrouptaxes.taxauthid,
				taxauthorities.purchtaxglaccount,
				taxgrouptaxes.taxontax,
				taxauthrates.taxrate
			FROM taxauthrates
			INNER JOIN taxgrouptaxes
				ON taxauthrates.taxauthority=taxgrouptaxes.taxauthid
			INNER JOIN taxauthorities
				ON taxauthrates.taxauthority=taxauthorities.taxid
			INNER JOIN taxgroups
				ON taxgroups.taxgroupid=taxgrouptaxes.taxgroupid
			INNER JOIN pctabs
				ON pctabs.taxgroupid=taxgroups.taxgroupid
			WHERE taxauthrates.taxcatid = " . $DefaultTaxCategory . "
				AND pctabs.tabcode='" . $_POST['Tab'] . "'
			ORDER BY taxgrouptaxes.calculationorder";
$TaxResult = DB_query($SQL);

$i = 0;
while ($MyTaxRow = DB_fetch_array($TaxResult)) {
	echo '<input type="hidden" name="index', $i, '" value="', $i, '" />';
	echo '<input type="hidden" name="CalculationOrder', $i, '" value="', $MyTaxRow['calculationorder'], '" />';
	echo '<input type="hidden" name="Description', $i, '" value="', $MyTaxRow['description'], '" />';
	echo '<input type="hidden" name="TaxAuthority', $i, '" value="', $MyTaxRow['taxauthid'], '" />';
	echo '<input type="hidden" name="TaxGLAccount', $i, '" value="', $MyTaxRow['purchtaxglaccount'], '" />';
	echo '<input type="hidden" name="TaxOnTax', $i, '" value="', $MyTaxRow['taxontax'], '" />';
	echo '<input type="hidden" name="TaxRate', $i, '" value="', $MyTaxRow['taxrate'], '" />';
	echo '<tr>
			<td><label>', $MyTaxRow['description'], ' - ', ($MyTaxRow['taxrate'] * 100), '%</label></td>
			<td><input type="text" class="number" size="12" name="TaxAmount', $i, '" value="0" /></td>
		</tr>';
	++$i;
}

?>