/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicitly call 'app.receivedEvent(...);'
    onDeviceReady: function() {
       app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
    }
};

var TargetRoot = window.location.href.toString().substring(0, window.location.href.toString().lastIndexOf("/"));
app.initialize();

function header(title, SID) {
	document.getElementsByTagName("BODY")[0].className = "main";
	var html = '<div id="header">KMexpenses - '+title+'</div>';
	html += '<div id="dialog"></div>';
	html += '<div id="mask"></div><img id="WaitIcon" style="width:125px;" src="img/waitingIcon.gif" />';
	return html;
}

function ToggleTopMenu() {
	if (document.getElementById("TopMenu").style["display"] == 'none') {
		document.getElementById('TopMenu').style["top"] = (document.getElementById('header').clientHeight-5)+"px";
		document.getElementById("TopMenu").style["display"] = 'inline';
	} else {
		document.getElementById("TopMenu").style["display"] = 'none';
	}
}

function Today() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
		dd='0'+dd
	}

	if(mm<10) {
		mm='0'+mm
	}

	today = dd+'/'+mm+'/'+yyyy;
	return today;
}

/*
window.alert=function(title, message, type) {
	document.getElementById("mask").style["display"] = "inline";
	html = '<div id="dialog_header_'+type+'">' + title + '</div><div id="dialog_main"><img style="float:left;width:64px" src="img/get_'+type+'.png" />' + message;
	html = html + '</div><div id="dialog_buttons"><input type="submit" id="okButton_'+type+'" value="OK" onClick="hideAlert()" /></div>';
	document.getElementById("dialog").innerHTML = html;
	document.getElementById("dialog").style["display"] = "inline-block";
	return false;
}

function hideAlert() {
	document.getElementById("dialog").innerHTML = "";
	document.getElementById("mask").style["display"] = "none";
	document.getElementById("dialog").style["display"] = "none";
	return true
}
*/