function SelectTabView(SID, UserName, CompanyName) {
	var html = header('Select Petty Cash Tab', SID);
	html += TopMenuView(SID);
	html += '<form name="SelectTabForm" id="SelectTabForm">';
	html += '<table>';
	html += '<label>Select Tab:</label>';
	html += '<select name="Tab"></select><br />';
	html += '</table>';
	html += '<button type="submit" name="submit" value="" onclick="return SelectExpenseView(Tab, \''+SID+'\',\''+UserName+'\',\''+CompanyName+'\')">Select Tab</button>';
	TabList(SID, UserName, CompanyName);
	document.getElementsByTagName("BODY")[0].innerHTML=html;
	return false;
}

function SelectExpenseView(Tab, SID, UserName, CompanyName) {
	var html = header('Claim Expense', SID);
	html += TopMenuView(SID);
	html += '<form name="ExpenseClaim" id="ExpenseClaim" enctype="multipart/form-data">';
	html += '<input type="hidden" name="SID" value="'+SID+'" />';
	html += '<input type="hidden" name="UserID" value="'+UserName+'" />';
	html += '<input type="hidden" name="CompanyNameField" value="'+CompanyName+'" />';
	html += '<input type="hidden" name="SelectedTabs" value="'+Tab.value+'" />';
	html += '<input type="hidden" name="DefaultDateFormat" value="'+localStorage.getItem("DefaultDateFormat")+'" />';
	html += '<table>';
	html += '<label>Date of Expense:</label>';
	html += '<input type="date" autofocus="autofocus" required="required" name="Date" placeholder="Date of expense" value="'+Today()+'" maxlength="20" /><br />';
	html += '<label>Code Of Expense:</label>';
	html += '<select name="SelectedExpense"></select>';
	html += '<label>Tag:</label>';
	html += '<select name="Tag"></select>';
	html += '<label>Gross Amount Claimed:</label>';
	html += '<input type="text" required="required" name="Amount" placeholder="Gross Amount" value="0.00" maxlength="20" /><br />';
	html += '<span name="Taxes"></span>';
	html += '<label>Notes:</label>';
	html += '<input type="text" name="Notes" placeholder="Notes" value="" maxlength="49" size="50" /><br />';
	html += '<label>Receipt:</label>';
	html += '<input type="file" name="Receipt" placeholder="Receipt" /><br />';
	html += '</table>';
	html += '<button type="submit" name="submit" value="" onclick="return ClaimExpense(ExpenseClaim, \''+SID+'\', \''+UserName+'\',\''+CompanyName+'\')">Claim Expense</button>';
	html += '</form>';
	ExpenseCodeList(SID, UserName, CompanyName, Tab);
	TagList(SID, UserName, CompanyName, Tab);
	TaxesList(SID, UserName, CompanyName, Tab);
	document.getElementsByTagName("BODY")[0].innerHTML=html;
	return false;
}

function TabList(SID, UserName, CompanyName) {
	var Target=TargetRoot+"/php/TabList.php";
	PostData="CompanyNameField="+CompanyName+"&SID="+SID+"&UserID="+UserName;
	tab_xmlhttp=new XMLHttpRequest();
	tab_xmlhttp.onreadystatechange=function() {
		if (tab_xmlhttp.readyState==4 && tab_xmlhttp.status==200) {
			document.getElementsByName("Tab")[0].innerHTML = tab_xmlhttp.responseText;
		}
	}
	tab_xmlhttp.open("POST",Target,true);
	tab_xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	tab_xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	tab_xmlhttp.setRequestHeader("Pragma","no-cache");
	tab_xmlhttp.send(PostData);
	return false;
}

function ExpenseCodeList(SID, UserName, CompanyName, Tab) {
	var Target=TargetRoot+"/php/ExpenseList.php";
	PostData="CompanyNameField="+CompanyName+"&SID="+SID+"&UserID="+UserName+"&Tab="+Tab.value;
	expense_xmlhttp=new XMLHttpRequest();
	expense_xmlhttp.onreadystatechange=function() {
		if (expense_xmlhttp.readyState==4 && expense_xmlhttp.status==200) {
			document.getElementsByName("SelectedExpense")[0].innerHTML = expense_xmlhttp.responseText;
		}
	}
	expense_xmlhttp.open("POST",Target,true);
	expense_xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	expense_xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	expense_xmlhttp.setRequestHeader("Pragma","no-cache");
	expense_xmlhttp.send(PostData);
	return false;
}

function TagList(SID, UserName, CompanyName, Tab) {
	var Target=TargetRoot+"/php/TagList.php";
	PostData="CompanyNameField="+CompanyName+"&SID="+SID+"&UserID="+UserName+"&Tab="+Tab.value;
	tag_xmlhttp=new XMLHttpRequest();
	tag_xmlhttp.onreadystatechange=function() {
		if (tag_xmlhttp.readyState==4 && tag_xmlhttp.status==200) {
			document.getElementsByName("Tag")[0].innerHTML = tag_xmlhttp.responseText;
		}
	}
	tag_xmlhttp.open("POST",Target,true);
	tag_xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	tag_xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	tag_xmlhttp.setRequestHeader("Pragma","no-cache");
	tag_xmlhttp.send(PostData);
	return false;
}

function TaxesList(SID, UserName, CompanyName, Tab) {
	var Target=TargetRoot+"/php/TaxesList.php";
	PostData="CompanyNameField="+CompanyName+"&SID="+SID+"&UserID="+UserName+"&Tab="+Tab.value;
	tax_xmlhttp=new XMLHttpRequest();
	tax_xmlhttp.onreadystatechange=function() {
		if (tax_xmlhttp.readyState==4 && tax_xmlhttp.status==200) {
			document.getElementsByName("Taxes")[0].innerHTML = tax_xmlhttp.responseText;
		}
	}
	tax_xmlhttp.open("POST",Target,true);
	tax_xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	tax_xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	tax_xmlhttp.setRequestHeader("Pragma","no-cache");
	tax_xmlhttp.send(PostData);
	return false;
}

function ClaimExpense(FormName, SID, UserName, CompanyName) {
	var Target=TargetRoot+"/php/ProcessExpenseClaim.php";
	var form = document.getElementById("ExpenseClaim");
	var formData = new FormData(FormName);
	submit_xmlhttp=new XMLHttpRequest();
	submit_xmlhttp.onreadystatechange=function() {
		if (submit_xmlhttp.readyState==4 && submit_xmlhttp.status==200) {
			document.getElementById("mask").style["display"] = "none";
			var response = JSON.parse(submit_xmlhttp.responseText);
			if (response['ErrorCode'] == '0') {
//				alert('Success', 'The client has been successfully updated.', 'success');
				alert('The expense has been claimed. It should be authorised in due course.');
				SelectTabView(SID, UserName, CompanyName);
			} else {
//				alert('Error', 'There was an error updating the clients details. Please report quoting error number '+submit_xmlhttp.responseText, 'error');
				alert('There was an error uploading the expense claim. Please report quoting error number '+response['ErrorCode']);
			}
		}
	}
	document.getElementById("mask").style["display"] = "inline";
	submit_xmlhttp.open("POST",Target,true);
//	submit_xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	submit_xmlhttp.setRequestHeader("Cache-Control","no-store, no-cache, must-revalidate");
	submit_xmlhttp.setRequestHeader("Pragma","no-cache");
	submit_xmlhttp.send(formData);
	return false;
}

function TopMenuView(SID) {
	return '<div id="TopMenu" onclick="LoginView(\'\', \'\')">Sign off</div>';
}
