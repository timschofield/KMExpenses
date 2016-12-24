<?php

$Directory = 'companies/';
$DirHandle = dir($Directory);
$DefaultCompany = '';
$html = '';
while (false !== ($CompanyEntry = $DirHandle->read())) {
	if (is_dir($Directory . $CompanyEntry) and $CompanyEntry != '..' and $CompanyEntry != '' and $CompanyEntry != '.' and $CompanyEntry != 'default') {
		if (file_exists($Directory . $CompanyEntry . '/Companies.php')) {
			include($Directory . $CompanyEntry . '/Companies.php');
		} else {
			$CompanyName[$CompanyEntry] = $CompanyEntry;
		}
		if ($CompanyEntry == $DefaultCompany) {
			$html .= '<option selected="selected" value="' . $CompanyEntry . '">' . $CompanyName[$CompanyEntry] . '</option>';
		} else {
			$html .= '<option value="' . $CompanyEntry . '">' . $CompanyName[$CompanyEntry] . '</option>';
		}
	}
}

$DirHandle->close();

echo $html;
?>