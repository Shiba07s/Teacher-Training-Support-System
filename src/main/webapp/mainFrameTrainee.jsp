<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your JSP Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Include Forge library -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/forge/1.0.7/forge.min.js"></script>
 
 
<style>
    ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
 
        li {
            position: relative;
        }
 
        ul ul {
            display: none;
            position: absolute;
            top: 0;
            left: 185px;
            width: 200px;
            z-index: 4;
            background: #ffff;
        }
 
        li:hover>ul {
            display: block;
        }
 
        /* Responsive menu styles */
        #navbar {
            transition: transform 0.3s ease-in-out;
        }
 
        #navbar.show-menu {
            transform: translateX(0);
        }
</style>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}
 
#banner {
	color: #101012;
	padding: 2px 14px;
	text-align: center;
	top: 0;
	width: 100%;
	z-index: 1000;
	position: fixed;
	box-sizing: border-box;
	background-image: linear-gradient(to right, #32355a, #8baeff);
}
 
#leftLogo {
	float: left;
}
 
#rightLogo {
	display: inline-block;
	margin-left: 10px;
	margin-top: 0;
	float: right;
	/*      background: #fff;  */
	padding: 11px 8px;
	width: 200px;
	margin-right: -122px;
}
 
#rightLogo {
	right: 10px;
}
 
#leftLogo img, #rightLogo img {
	width: 36%;
	height: 10%;
}
 
#navbar {
	padding: 15px;
	width: 235px;
	position: fixed;
	height: 100%;
	box-sizing: border-box;
	top: 100px;
	left: 0;
	padding-left: 0;
	padding-right: 0;
	padding-top: 0;
	background-image: linear-gradient(to bottom, #232546, #8baeff);
}
 
#navbar a {
	width: 100%;
	display: block;
	padding: 12px;
	box-sizing: border-box;
	text-decoration: none;
	font-size: 16px;
	color: #fff;
	border-bottom: 1px solid #d9d9d9;
	cursor: pointer;
}
 
#navbar a:hover {
	background-color: #ffffff;
	color: #5e73af;
}
 
#navbar ul ul li a {
	color: #5e73af;
}
 
#navbar ul ul li a:hover {
	background: #5e73af;
	color: #fff !important;
}
 
iframe {
	width: 100%;
	min-height: 100vh;
	border: none;
}
 
#logoutButton {
	float: right;
	background: #738fd5;
	border: none;
	color: #fff;
	font-weight: bold;
	padding: 12px 27px;
	font-size: 17px;
	margin-top: 17px;
	cursor: pointer;
	position: absolute;
	right: 0;
	top: 73%;
	width: 100%;
	background: #fbfbfb5c;
}
 
#logoutButton:hover {
	color: #738fd5;
	background-color: #fff !important;
	box-shadow: 0px 0px 5px -4px #000;
}
 
#logoutButton:hover {
	background-color: #bbb;
}
 
.middle-box {
	display: inline-block;
}
 
.middle-box h1 {
	font-size: 25px;
	color: #fff;
	font-weight: bold;
	margin: 0;
}
 
.middle-box h1 span {
	display: block;
	font-size: 18px;
	color: #fff;
	font-weight: 500;
}
 
div#leftLogo img {
	width: 180px;
	margin-top: 20px;
}
 
div#banner img {
	float: left;
}
 
.middle-box {
	display: inline-block;
	vertical-align: top;
	padding: 12px 22px;
	margin-top: 10px;
}
 
.main-content {
	float: left;
	width: 100%;
	padding: 20px;
	box-sizing: border-box;
	padding-left: 245px;
	padding-top: 100px;
}
 
div#content {
	padding: 5px 0 0 0;
}
 
button.card-link {
	margin-bottom: 29px;
}
 
.left-box {
	position: relative;
	height: 100vh;
}
 
span.menubtn {
	display: none;
}
 
@media screen and (max-width: 801px) {
	#navbar {
		transform: translate(-100%, 0);
		transition: 500ms all ease-in-out 0s;
	}
	
	.main-content {
		padding-left: 20px;
	}
	span.menubtn {
		position: absolute;
		display: inline-block;
		height: 30px;
		width: 30px;
		background: #fff;
		border-radius: 55px;
		line-height: 30px;
		color: #393e67;
		left: 17px;
		top: 38px;
	}
	#banner {
		padding-left: 63px;
	}
	.middle-box {
		width: 40%;
		margin-top: 21px;
	}
	.middle-box h1 {
		font-size: 17px;
	}
	.middle-box h1 span {
		font-size: 13px;
	}
	.main-content-active #navbar {
		transform: translate(0%, 0);
		transition: 500ms all ease-in-out 0s;
	}
	#logoutButton {
		margin-top: 0;
	}
}
 
@media screen and (max-width: 641px) {
	.middle-box {
		width: 100%;
		margin-top: 10px;
		padding: 6px 0;
		border-top: 1px solid #fff;
	}
	#banner {
		padding-left: 0;
	}
	#rightLogo {
		right: 10px;
		position: absolute;
		top: 0;
		padding: 5px 0px;
		width: 175px;
	}
	#leftLogo {
		float: left;
		position: relative;
		left: 52px;
	}
	#leftLogo {
		float: left;
		position: relative;
		left: 52px;
	}
	div#rightLogo img {
		width: 50px;
	}
	span.menubtn {
		position: absolute;
		display: inline-block;
		height: 30px;
		width: 30px;
		background: #fff;
		border-radius: 55px;
		line-height: 30px;
		color: #393e67;
		left: 13px;
		top: 15px;
	}
	div#leftLogo img {
		width: 160px;
		margin-top: 0;
	}
	.main-content {
		padding-top: 125px;
	}
	#navbar {
		padding-top: 20px;
	}
	.mb-2.col-2 {
		width: 100px;
	}
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jsencrypt/2.3.1/jsencrypt.min.js"
	integrity="sha512-zDvrqenA0eFJZCxBsryzUZcvihvNlEXbteMv62yRxdhR4s7K1aaz+LjsRyfk6M+YJLyAJEuuquIAI8I8GgLC8A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
 
	<div class="header" id="banner">
		<span class="menubtn"><i class="fa fa-bars" aria-hidden="true"></i></span>
		<div id="leftLogo">
			<img src="./assets/Samagra_Shiksha.png" alt="Left Logo">
		</div>
		<div class="middle-box">
			<h1>
				Teacher Training Support System <span>Govt Of Andhra Pradesh</span>
			</h1>
		</div>
		<div id="rightLogo">
			<img src="./assets/logo2Tranparenet.png" alt="Right Logo">
		</div>
 
	</div>
	<div class="main-content">
		<div id="navbar">
			<div class="left-box">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/ApplyTraining.jsp"
						target="mainFrame">Apply Trainings</a></li>
					<li><a
						href="${pageContext.request.contextPath}/MyTraining.jsp"
						target="mainFrame">My Trainings</a></li>
 
 
					<li><a onclick="encryptWithRSA(publicKey, keys)"> Go To
							Training Delivery </a></li>
				</ul>
			</div>
			<button id="logoutButton" onclick="logout()">
				<i class="fa fa-lock" aria-hidden="true"></i> Logout
			</button>
 
		</div>
		<div id="content">
			<div id="iframeContainer">
				<iframe src="${pageContext.request.contextPath}/ApplyTraining.jsp"
					name="mainFrame" id="mainFrame" style="width: 100%; height: 400px;"></iframe>
			</div>
		</div>
	</div>
 
 
	<script>
		$(document).ready(function() {
			
// 			var storedUsername = sessionStorage.getItem('treasuryId');
// 			  if(storedUsername===null){
			  	
// 			  	window.location.href = "${pageContext.request.contextPath}/authentication.jsp";
			   
// 			  }
			  
			$('#navbar a').click(function() {
				// Remove active class from all links
				$('#navbar a').removeClass('active');
 
				// Add active class to clicked link
				$(this).addClass('active');
			});
		});
 
		function logout() {
			// Perform session logout logic
	<%-- Assuming session is available in your JSP environment --%>
		
	<%session.invalidate();%>
		// Clear browser history and redirect
			window.location.href = "${pageContext.request.contextPath}/index.jsp";
			window.location
					.replace("${pageContext.request.contextPath}/index.jsp"); // For some browsers
 
			// Additional history manipulation
			if (window.history && window.history.pushState) {
				// Use replaceState to clear the existing history
				window.history.replaceState(null, null,
						"${pageContext.request.contextPath}/index.jsp");
 
				// Add a dummy entry to the history to replace current entry
				window.history.pushState(null, null,
						"${pageContext.request.contextPath}/index.jsp");
 
				// Prevent users from navigating back to the previous state
				window.onpopstate = function(event) {
					window.history.go(1);
				};
			}
		}
		var SSS = sessionStorage.getItem("UserName");
		var DD = sessionStorage.getItem("UserPassword");
 
		console.log(SSS + " " + DD);
	</script>
 
	<script>
	var storedUsername = sessionStorage.getItem('UserName');
    var storedPassword = sessionStorage.getItem('UserPassword');
 
		console.log('Username retrieved from session storage:', storedUsername);
		console.log('Password retrieved from session storage:', storedPassword);
 
		var keys = "username=" + storedUsername + "&password=" + storedPassword;
 
		var publicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2M8cxQWdcubHqzShPN7htyrezyQ+eeuWC1Ltkd5cHxxGX2uYt9lv83pHE6LjOfOL9n3/bIu0TzjX6Lq+fTwN0BkXFWarAJ49Mr8FAfTkadMAsAY9XLEgAXKvZ87Uq5JtjhFT7SJh7ZPJuifUszl4C/CxZrSyJ9LRBaWNhdvxKNhEY66QXHNhBSFxZ8vjSY+VMV5ISKlQY4BIxAJVDTVTwoqszzV3zdgmtG3HDD1fxqkJzm5DQI/1oKci6jtBBm8bP7/K08z2t1U0xDtoF3ZI4BFWmMmGbY/PeiDhoToY3c+ym067NFsm8BTGVF6hY5tpWd0GNr8CFbe0fdl9Z3C5cQIDAQAB';
 
		function encryptWithRSA(publicKey, plaintext) {
			var encrypt = new JSEncrypt();
			encrypt.setPublicKey(publicKey);
 
			var encrypted = encrypt.encrypt(plaintext);
 
			console.log('Encrypted Data:', encrypted);
			var base = "https://stl.lnpreprod.in/account/static?key="+ encrypted;
					
/* 			var base = "http://nenoobadikipotaa.ap.gov.in/account/static?key="
					+ encrypted; */
			console.log(base);
			//fun();
			// return encrypted;
			var win = window.open(base, '_blank');
	        win.focus();		}
 
		//encryptWithRSA(publicKey, keys);
		//  var encrypted;
	</script>
	<script type="text/javascript">
	function fun(){
		 var privateKeyVariable = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDYzxzFBZ1y5serNKE83uG3Kt7PJD5565YLUu2R3lwfHEZfa5i32W/zekcTouM584v2ff9si7RPONfour59PA3QGRcVZqsAnj0yvwUB9ORp0wCwBj1csSABcq9nztSrkm2OEVPtImHtk8m6J9SzOXgL8LFmtLIn0tEFpY2F2/Eo2ERjrpBcc2EFIXFny+NJj5UxXkhIqVBjgEjEAlUNNVPCiqzPNXfN2Ca0bccMPV/GqQnObkNAj/WgpyLqO0EGbxs/v8rTzPa3VTTEO2gXdkjgEVaYyYZtj896IOGhOhjdz7KbTrs0WybwFMZUXqFjm2lZ3QY2vwIVt7R92X1ncLlxAgMBAAECggEAM3FBBEaGy0KS0b6VG1pO+CUF5ORWppsNaPZuRBQci40r7WwcOlMvSvgScUhO3es5pGzU9C5ZxApawG++zvw20s+BOKS5olXpc2b7izFOGQXlvd5dJOcqDu3lTJ44u9Tsha762OM1lSdhz/evci8KmtqrXRE2zFgrHEnhwIclO2lVPHYZdQkcA4685SgVlWmJW/BG4KclpxWy72F3TySh8EatXLM8TfDQaQzp7Oq0Gb4ftM1FfzqaD94EFY0ofiwoBtg6md/v6atB8bhDtd/zjTWzz8myLP/41DrU3tRTCoEhFwIRK24onF6x+8h1RWofQMQ22r8DoKSFYDuFupbKIQKBgQD1YE9OXo/9RBay6Ozbid2cMCUuLdGgYDtJGRYI+sEDdqFSatuvbRmc2veDFEHW5oTyRrkHOHALKI1ya2r3UEnqa6zELn2yfKlQVQen43PiSPNn5VXa5Y8eDIlZAcEuOJ04yKrr6VLTrQu+TvEw979cb/ni6J/btQTF+HY7988bXQKBgQDiMivDRg2EiZUGq9UCMU32rPim+udjY9ovsGHU74VRkNDL1RzR8KVHRnVT14HSwRaJE6kUckbQL7pFQyoCu+WKmew3HHXLIjiXeFom5a8TCa3Na9AYE7Sakvf0uYez17xgd63ZaN/kMZAe/uafYD8ll/FvHjdpBpPysLQfY4GJJQKBgQDsUMXwNxg7lbC6u6MpyDwa6S9VqyEBcMyIGNXk7gKnoD+7zVgoOk15iFTp8795BWeyobQfJRabWIHpWVSaPMQDNZIdGp1KIc86o7mM0nzPyOxK+k7WU1GjYfWBODRhnHqmrnQWYg63+CegMA0P2Pp+PwWNp/YVNeAT/bd5B695rQKBgQCd/EjQtQcQAUBTToUSaPl5R0rM5gXjR4THNjy+iyTk2W7cT1c30wq9g5rDGoyUdUSWLWM04rRPCGbjpYucKTyj1+pCe+BSJu677NWawWXMuD/qcFkB2BGWvPvus/7yP8ZU4oJMjZGDQpLU81iFDKZOTZfV8pblBjEjmwPTwJ5i+QKBgCBz8aeRBsS2Wsv0Rd9d/YdFlb5mJ4QQFM6YWtAL7LW7YX3I5gGcZM2Gn82HN2sw6+gE69eKRUTJ63Dm3y5S1is+35ZZCV99zrFL1Isk2oofPt7FZscfMTC8YAffY4bUSB/H0Z2QPp1kJ2N5YG5mFDU3wltx7sRRmOeaLlRMbgTA";
		    var encryptedData = "UiMdPgJgxXzipNgFfSF1mZJKG9i5ZoOAZgNLD8PRn7yeb1k7vXZJEma5U6pgyB71n8Xl30bydE3ov/zR5esZghd2rdQB/a4RXPVN7O7g3oQjiHDP+WJLAOnR8ijkXYKrtmDoX6HAOWPfwbf+jEaxnOFybItcXIm2NPizTMu7mVh9bYfzs2NiAc+3zCVxZzQJ/XlZi+pzJ9B8vYnpelFNzKfEmpqj/QDRIFt1mGy2iaQnq6uwohnLMcf34sK6ob6FBVNtqw6BfRVbW1lcEKv1ifcGEHMz7r2frJMPkKEDrODVhuX2b3L/gvO2yuI/rr/okH9L2G6Xf4x02D87j7e0TA==";  
		    // Decrypt with private key
		    var decrypt = new JSEncrypt();
		    decrypt.setPrivateKey(privateKeyVariable);
 
		    var decrypted = decrypt.decrypt(encryptedData);
		    console.log('Decrypted Data:', decrypted);
	}
	  
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
	    $('.menubtn, #navbar a').click(function() {
	        $('#navbar').toggleClass('show-menu');
	    });
	});
</script>
 
</body>
</html>