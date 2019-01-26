/**
 * 
 */
$(document).ready(function(){
		  $('#cover').removeClass('activate');
		  $('#loader').removeClass('activate');
	$('#regForm').submit(function(){
		var test = document.getElementById("send").className;
		if(test.includes('disabled')){
			$('#cover').removeClass('activate');
			  $('#loader').removeClass('activate');
		}
		else{
		  $('#cover').addClass('activate');
		  $('#loader').addClass('activate');
		}
		});
	});

function voteopBox(id, action){
	var ac = action;
	var cover = 'cover';
	var voteopBox = 'voteopBox' + id
	if((ac.localeCompare('open')) == 0){
	  $('#'+cover).addClass('activate');
	  $('#'+ voteopBox).addClass('activate');
	}
	if((ac.localeCompare('close')) == 0){
	  $('#'+cover).removeClass('activate');
	  $('#'+ voteopBox).removeClass('activate');		
	}	
}

//Script for Register User
function doRegister() {
	var a = 2;
	var vuser = $(".user").val();
	var firstname = document.getElementById("firstname").value;
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var password1 = document.getElementById("password1").value;
	var password2 = document.getElementById("password2").value;
	alert(email);
	var element= 'reloadDiv'
	//Call RegisterProcess.java Serlvet
    $.ajax({
        url: 'register',
        type: 'POST',
        data: {
            user: vuser,
            firstname: firstname,
            name: name,
            email: email,
            password1: password1,
            password2: password2
        },
        success: function(data) {
           // alert('Update Success');
        	a = 3;
        	//Creates Snackbar Message
        	smessage(a);
        	//Closes overlay vote box

        	//Reloads Div for registration
        	$("#"+element).load(" #"+element+" > *");
            
        },
        failure: function(data) {
        	smessage(a);
           // alert('Update Failed');
        }
    });
}

//Script for Voting an opinion poll
function doOpVote(opid) {
	var a = 0;
	var vuser = $(".user").val();
	var vselection = $(".selection"+opid+":checked").val();
	var element = 'reloadButton' + opid;
	//Call VoteOp.java Serlvet
    $.ajax({
        url: 'voteop',
        type: 'POST',
        data: {
            id: opid,
            user: vuser,
            selection: vselection
        },
        success: function(data) {
           // alert('Update Success');
        	a = 1;
        	//Creates Snackbar Message
        	smessage(a);
        	//Closes overlay vote box
        	voteopBox(opid, 'close');
        	//Reloads Button for text
        	$("#"+element).load(" #"+element+" > *");
            
        },
        failure: function(data) {
        	smessage(a);
        	voteopBox(opid, close);
           // alert('Update Failed');
        }
    });
}

function doPVote(pid) {
	var a = 0;
	var vuser = $(".user").val();
	//var phoneNo = $("#phoneNumber").val();
	//var x = "40";
	$.ajax({
		url: 'votep',
		type: 'POST',
		data: {
			id: pid,
			user: vuser,
		},
		success: function(data) {
			// alert('Update Success');
			a = 1;
			$("#voteReload").load(" #voteReload > *");
			smessage(a);
			
		},
		failure: function(data) {
			smessage(a);
			// alert('Update Failed');
		}
	});
}

function smessage(ar) {
	if(ar==1){
	  document.getElementById('snackbar_message').innerHTML +=
	  "<div id='snackbar' class=''>Abstimmung erfolgreich!</div>";
	}
	if(ar==2){
		document.getElementById('snackbar_message').innerHTML +=
			  "<div id='snackbar' class=''>Abstimmung fehlgeschlagen!</div>";
	}
	else{
		document.getElementById('snackbar_message').innerHTML +=
			  "<div id='snackbar' class=''>"+ ar +"</div>";
	}

	  var element = 'snackbar';
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated slideInUp');
	  document.getElementById("snackbar").style.visibility = "visible";
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated slideInUp');
					$(function(){
						$('#'+element).addClass('animated slideOutDown delay-3s');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated slideOutDown delay-3s');
							$('#'+element).remove();	
						});
					});	
				});
			});
		});
	}

function remove_op(opid) {
	  var element = 'dynamic_divs' + opid;
	  
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated zoomOut delay-1s');
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated zoomOut delay-1s');
					$('#'+element).slideUp();	
				});
			});
		});
	

	}

/*==================================================================
[ login validation ]*/



(function($) {
	"use strict";

	/*==================================================================
	[ Validate ]*/
	var input = $('.validate-input .input100');

	$('.validate-form').on('submit', function() {
		var check = true;

		for (var i = 0; i < input.length; i++) {
			if (validate(input[i]) == false) {
				showValidate(input[i]);
				check = false;
			}
		}

		return check;
	});

	$('.validate-form .input100').each(function() {
		$(this).focus(function() {
			hideValidate(this);
		});
	});

	function validate(input) {
		if ($(input).attr('type') == 'email'
				|| $(input).attr('name') == 'email') {
			if ($(input)
					.val()
					.trim()
					.match(
							/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
				return false;
			}
		} else {
			if ($(input).val().trim() == '') {
				return false;
			}
		}
	}

	function showValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).addClass('alert-validate');
	}

	function hideValidate(input) {
		var thisAlert = $(input).parent();

		$(thisAlert).removeClass('alert-validate');
	}

})(jQuery);

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	
//Add and Delete fields for opform.jsp
function field(adddelete){
var ad = adddelete;

	if(ad.localeCompare('+') == 0){
		//Creates new answerfield
		 if (feld <= 10) {
		  var inhalt = "Antwortm&ouml;glichkeit " + feld;
		  document.getElementById('dynamic_input').innerHTML +=
		  " <div class='form-row'><div class='col-md-4 form-group'><input class='form-control' type='text' name='n_" + feld + "' placeholder='" + inhalt + "'required></div></div>";
		  feld++;
		 }
		
	}
	if(ad.localeCompare('-') == 0){
		//removes last added answerfield
		 if (feld > feldm) {
		 feld--;
		  document.getElementById('dynamic_input').innerHTML = "";
		  for (var zaehler = feldm; zaehler < feld; zaehler++) {
		    var inhalt = "Antwortm&ouml;glichkeit " + zaehler;
		    document.getElementById('dynamic_input').innerHTML +=
		     "<div class='form-row'><div class='col-md-4 form-group'><input class='form-control' type='text' name='n_" + zaehler + "' placeholder='" +
		      inhalt + "'required></div></div>";
		  }
		 }
		
	}
}

//Approve and Reject of Projects
function message(ar) {
	if(ar==1){
	  document.getElementById('successMsg').innerHTML +=
	  "<div id='snackbar' class=''>Projekt wurde genehmigt!</div>";
	}
	else{
		document.getElementById('successMsg').innerHTML +=
			  "<div id='snackbar' class=''>Projekt wurde abgelehnt!</div>";
	}
	  var element = 'snackbar';
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated slideInUp');
	  document.getElementById("snackbar").style.visibility = "visible";
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated slideInUp');
					$(function(){
						$('#'+element).addClass('animated slideOutDown delay-3s');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated slideOutDown delay-3s');
							$('#'+element).remove();	
						});
					});	
				});
			});
		});
	}
	
function approveBox(id, role){
	document.getElementById('commentBox').innerHTML +=
		"<div id='overlay' class='overlay'>"+
		  "<div id='msgBox'><h3>Projekt Freigeben</h3><br><br>"+
		"<p>Begr&uuml;ndung: </p><br>"+
		"<textarea id='comment' name='comment' cols='35' rows='4' autofocus></textarea> <br><br>"+
		"<input type='button' value='Ablehnen' onClick='doApprove("+id+","+role+")'> <br><br>"+
		"<input type='button' value='Abbrechen' onClick='doClose();'></div>"+
		"</div>";
		
}
function rejectBox(id, role){
	document.getElementById('commentBox').innerHTML +=
		"<div id='overlay' class='overlay'>"+
		"<div id='msgBox'><h3>Projekt ablehnen</h3><br><br>"+
		"<p>Begr&uuml;ndung: </p><br>"+
		"<textarea id='comment' name='comment' cols='35' rows='4' autofocus></textarea> <br><br>"+
		"<input type='button' value='Ablehnen' onClick='doReject("+id+","+role+")'> <br><br>"+
		"<input type='button' value='Abbrechen' onClick='doClose();'></div>"+
		"</div>";
	
}


function remove_project(id) {
	  
	
	  var element = 'dynamic_divs' + id;
	  
	  $(function(){
			$(function(){
				$('#'+element).addClass('animated zoomOut delay-1s');
				$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
					$('#'+element).removeClass('animated zoomOut delay-1s');
					$('#'+element).slideUp();	
				});
			});
		});
	

	}

function doApprove(id, role) {
	var a = 1;
	var comment = "";
		if(role == 3){
			comment = ($.trim($("#comment").val()));			
		}
		else{
			comment = "";
		}
    //var phoneNo = $("#phoneNumber").val();
    //var x = "40";
    $.ajax({
        url: 'ApproveProject',
        type: 'POST',
        data: {
            pId: id,
            role: role,
            acceptreject: "approve",
            comment: comment
        },
        success: function(data) {
        //    alert('Update Success');
        	message(a);
        	doClose();
            remove_project(id);
        },
        failure: function(data) {
            alert('Update Failed');
        }
    });
    

}function doReject(id, role){
	var a = 2;
	var element = 'msgBox';
	var element1 = 'overlay';
	var comment = ($.trim($("#comment").val()));
	if(comment != ""){
	$.ajax({
        url: 'ApproveProject',
        type: 'POST',
        data: {
            pId: id,
            role: role,
            acceptreject: "reject",
            comment: comment
        },
        success: function(data) {
        //    alert('Update Success');
        $(function(){
						$('#'+element).addClass('animated fadeOut faster');
						$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
							$('#'+element).removeClass('animated fadeOut faster');
							$('#'+element).remove();
							$('#'+element1).remove();
						});
					});
        	message(a);
        	doClose();
            remove_project(id);
        },
        failure: function(data) {
            alert('Update Failed');
        }
    });
	}
	else{
		$(function(){
			$('#'+element).addClass('animated shake');
			$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
				$('#'+element).removeClass('animated shake');	
			});
		});
	}
}

function doClose(){
	var element = 'msgBox';
	var element1 = 'overlay';
	$(function(){
		$('#'+element).addClass('animated fadeOut faster');
		$('#'+element).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
			$('#'+element).removeClass('animated fadeOut faster');
			$('#'+element).remove();	
			$('#'+element1).remove();
		});
	});
}
//End Approve and Reject of Projects
