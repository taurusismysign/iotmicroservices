jQuery(document).ready(function() {   
	
	$('#btn_ajax_user_email_mode').on('click', function(){	
		fastuser_login();	
	});
	
	
	$('#btn_sub_ajax_signupmode_in').on('click', function(){	
		existing_user_login();	
	});
	
	$('#btn_nsubmit_signupmode_hasaccount').on('click', function(){	
		reset_quickform_signup();
		$('#div_user_emailonly').hide();
		$('#div_signupmode_user_login').show();
		$('#signupmode_emaile').focus();		
	});
	
	$('#btn_nsubmit_ajax_signupmode').on('click', function(){	
		reset_quickform_signup();
		$('#div_user_emailonly').show();
		$('#div_signupmode_user_login').hide();
		$('#fastuser_email').focus();
	});
	
	$('.signupmode_skip_option').on('click', function(){	
		HandleSkipOption();	
	});
	
	reset_quickform_signup();
	$('#div_usermode_mag_subscribe').hide();
	$('#div_signupmode_user_login').hide();
	$('#div_user_emailonly').hide();
	$('.skipsignupmode').hide();
	
	StartQuickSignup();
});

function reset_quickform_signup(){
	$('#signmode_status_area').hide();
	$('#signmode_status_area').html("");
}

function existing_user_login() {
  var email = $('#signupmode_emaile').val();
  var password = $('#signupmode_passworde').val();
  var data = {remote: true, commit: "Sign in", utf8: "✓",
              user: {password: password, email: email}};
  
  $.ajax({url: '/users/sign_in.json',
  		  type: 'POST',
  		  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  		  data: data,
		  success: function(response) {
		  		HandleQuickPostSuccessMode(response);
		    }
  });
  return false;
}


function fastuser_login(){

  reset_quickform_signup();
  
  var email = $('#fastuser_email').val();
  var data = {remote: true, commit: "Sign up", utf8: "✓",
              user: {email: email}};
  
  $.ajax({ url: '/users/fastsignup.json',
  type: 'POST',
  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  data: data,
  success: function(response) {
    	HandleQuickPostSuccessMode(response);
   },
  error: function(response){
  	HandleQuickPostErrorMode(response);
  }
  });
  return false;
}

function HandleQuickPostErrorMode(response)
{
	var errorText = "";
	
	if (response.responseJSON.email[0])
	{
		switch(response.responseJSON.email[0])
		{
			case "has already been taken":
				errorText = "You are already a user. Please sign in.";
				break;
			case "can't be blank":
				errorText = "Please provide an email to proceed.";
				break;
		}	
	}
	
	if(errorText.length == 0){
		errorText = "Unable to proceed. Please try again.";
	}
	
	$('#signmode_status_area').show();
	$('#signmode_status_area').html(errorText);
	ntrackevent("_quicksignuperror",{ _identifier: GetMagazineIdentifier(), _error_text: errorText});   
}

function HandleQuickPostSuccessMode(response)
{
	if (response && response.user_string.length > 0)
    {
    	ntrackevent("_quicksignupok",{ _identifier: GetMagazineIdentifier(), _user_string: response.user_string});
        $("#form_signup_mode").modal("hide");
        //SubscribeFromJs(GetMagazineIdentifier(),'fastsignup');
        window.location.href = window.location.href + '?ac=subscribe';
        return false;
    }
}

function StartQuickSignup()
{	
	if ($.cookie('coo_quicksignup_mode') == 0)
	{
		return false;
	}
	
	switch (ser_quicksignup_val)
	{
		case 1:
			$('#div_user_emailonly').show();
			$('.skipsignupmode').show();
			break;
		case 2:
			$('#div_usermode_mag_subscribe').show();
			$('.skipsignupmode').show();
			break;
		case 3:
			$('#div_user_emailonly').show();
			break;
		case 4:
			$('#div_usermode_mag_subscribe').show();
			break;
		default:
			$('#form_signup_mode').modal('hide');
	}
	
	$('#form_signup_mode').modal({"keyboard" : false, "backdrop":"static"});
}

function HandleSkipOption()
{
	$.cookie('coo_quicksignup_mode', 0);
	$('#form_signup_mode').modal('hide');
	ntrackevent("_quicksignupskip",{ _identifier: GetMagazineIdentifier()});
}