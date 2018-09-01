<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(document).ready(function() {
	var checkLoginStatus = function(response) {
    	console.log(response);
        // statusChangeCallback(response);
        
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            $("#authBtn").val("logout");
            fbLoginAction();
          } else {
        	  $("#authBtn").val("login");
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
              'into this app.';
          }
    };
	
	window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '1128205587330014',
	      cookie     : true,  // enable cookies to allow the server to access 
	                          // the session
	      xfbml      : true,  // parse social plugins on this page
	      version    : 'v3.1' // use graph api version 2.8
	    });

	    // Now that we've initialized the JavaScript SDK, we call 
	    // FB.getLoginStatus().  This function gets the state of the
	    // person visiting this page and can return one of three states to
	    // the callback you provide.  They can be:
	    //
	    // 1. Logged into your app ('connected')
	    // 2. Logged into Facebook, but not your app ('not_authorized')
	    // 3. Not logged into Facebook and can't tell if they are logged into
	    //    your app or not.
	    //
	    // These three cases are handled in the callback function.
	    
	    checkLoginState = function() {
	    	FB.getLoginStatus(checkLoginStatus);
	    }

	  };

	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	  
	  
	 function fbLoginAction() {
		 FB.login(function(response) {
				var fbname;
				var accessToken = response.authResponse.accessToken;
				FB.api('/me?fields=id,name,email', function(resp) {
					console.log(resp);
					var fb_data = jQuery.parseJSON(JSON.stringify(response));
					console.log("id:" +fb_data.id);
					console.log("name:" +fb_data.name);
					/* console.log("age:" +fb_data.age_range);
					console.log("gender:" +fb_data.gender); */
					console.log("email:" +fb_data.email);
				});
		});
	 }

})
	
  
</script>
</head>
<body>


<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

<input type="button" id="authBtn" value="checking..." onclick="
	if(this.value === 'login') {
		// now logout
	} else {
		// now login
		FB.logout(function(response) {
			console.log(response);
		});
	}
"/>

</body>
</html>