<?php
/*	$Id: CurrenciesArray.php 2 2013-05-23 18:10:36Z chacon $*/
/*	Currency codes based on the three-letter alphabetic code from
	ISO 4217:2008 Codes for the representation of currencies and funds.
	This program is under the GNU General Public License version 3.	*/

$CurrencyName = array();
$CurrencyCode = array();

// BEGIN: AlphabeticCode and CurrencyName data.
$CurrencyName['AL'] = _('Albanian lek');
$CurrencyName['DE'] = _('European Union euro');
$CurrencyName['LU'] = _('European Union euro');
$CurrencyName['GB'] = _('United Kingdom pound sterling');
// END: AlphabeticCode and CurrencyName data.

// BEGIN: AlphabeticCode and CurrencyName data.
$CurrencyCode['AL'] = _('ALL');
$CurrencyCode['DE'] = _('EUR');
$CurrencyCode['LU'] = _('EUR');
$CurrencyCode['GB'] = _('GBP');
// END: AlphabeticCode and CurrencyName data.

asort($CurrencyName);
?>