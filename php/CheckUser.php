<?php

include('config.php');

$SQL="SHOW DATABASES";

$db = mysqli_connect($Host, $DBUser, $DBPassword) or die ('Error connecting to mysql: ' . mysqli_error($db).'\r\n');
$Result = mysqli_query($db, $SQL);
$Answer = 0;
while ($MyRow = mysqli_fetch_row($Result)) {
	if ($_POST['User'] == $MyRow[0]) {
		$Answer = 1;
	}
}
echo $Answer;
?>