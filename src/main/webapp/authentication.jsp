<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sign In Page</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- Custom CSS -->
	<style>
		body {
			background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
 
		}
 
		.banner {
			background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
			display: flex;
			justify-content: space-around;
			align-items: center;
			width: 100%;
			font-size: 1.8rem;
		}
 
		.containerr {
			height: 3rem;
			background: linear-gradient(#e66465, #9198e5);
			display: flex;
			justify-content: flex-end;
			align-items: center;
		}
 
		.signin-container {
			max-width: 400px;
			margin: 0 auto;
			padding: 20px;
			background-color: #ffffff;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			margin-top: 50px;
		}
 
		.signin-heading {
			text-align: center;
			margin-bottom: 20px;
		}
 
		.form-group {
			margin-bottom: 20px;
		}
 
		.form-label {
			font-weight: bold;
		}
 
		.btn-login {
			background-color: #007bff;
			color: #fff;
		}
 
		.btn-login:hover {
			background-color: #0056b3;
		}
 
		.alert {
			margin-top: 20px;
		}
 
		.hidden {
			display: none;
		}
	</style>
	<!-- ... (Previous HTML code) ... -->
	<script>
		$(document).ready(function () {
			// Initially hide the specific fields
			$('#adminFields, #teacherFields').addClass('hidden');
 
			// Initialize login credentials object
			var loginCredentials = {
				loginAs: $('#loginAs').val().trim(),
				username: '',
				password: '',
				treasuryid: '',
				mobilenumberteacher: ''
			};
 
			$('#loginAs').change(function () {
				var selectedValue = $(this).val();
 
				// Hide both fields initially
				$('#adminFields, #teacherFields').addClass('hidden');
 
				// Update login credentials based on selected value
				loginCredentials.loginAs = selectedValue;
				if (loginCredentials.loginAs === 'admin') {
					$('#adminFields').removeClass('hidden');
					$('#teacherFields').addClass('hidden');
					loginCredentials.treasuryid = '';
					loginCredentials.mobilenumberteacher = '';
				} else if (loginCredentials.loginAs === 'teacher') {
					$('#teacherFields').removeClass('hidden');
					$('#adminFields').addClass('hidden');
					loginCredentials.username = '';
					loginCredentials.password = '';
				}
			});
 
			$('#loginForm').submit(function (event) {
				event.preventDefault();
 
				// Update login credentials with form values
				if (loginCredentials.loginAs === 'admin') {
					loginCredentials.username = $('#username').val().trim();
					loginCredentials.password = $('#passwordId').val().trim();
				} else if (loginCredentials.loginAs === 'teacher') {
					loginCredentials.treasuryid = $('#treasuryId').val().trim();
					loginCredentials.mobilenumberteacher = $('#mobileNumber').val().trim();
				}
 
				// Determine the API URL based on the role
				var apiUrl = '';
				if (loginCredentials.loginAs === 'admin') {
					apiUrl = '${pageContext.request.contextPath}/api/admin/login';
				} else if (loginCredentials.loginAs === 'teacher') {
					apiUrl = '${pageContext.request.contextPath}/api/teacher/login';
				}
 
				// AJAX Request
				$.ajax({
					url: apiUrl,
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify(loginCredentials),
					success: function (response) {
						console.log('Login successful');
						storeUsernameInSession(loginCredentials.username);
 
						// Determine the dashboard based on the role
						var dashboardUrl = '';
						if (loginCredentials.loginAs === 'admin') {
							dashboardUrl = '${pageContext.request.contextPath}/MainFrameAdmin.jsp';
						} else if (loginCredentials.loginAs === 'teacher') {
							dashboardUrl = '${pageContext.request.contextPath}/mainFrameTrainee.jsp';
						}
 
						showAlert('Login Successful', 'alert-success');
						// Redirect to the appropriate dashboard
						window.location.href = dashboardUrl;
					},
					error: function (xhr, status, error) {
						console.error('Login failed', error);
						showAlert('Login Failed. Please check your credentials. Error: ' + error, 'alert-danger');
					}
				});
			});
 
			function showAlert(message, alertClass) {
				var alertDiv = $('<div class="alert ' + alertClass + ' mt-3" role="alert">' + message + '</div>');
				$('#loginForm').prepend(alertDiv);
				setTimeout(function () {
					alertDiv.alert('close');
				}, 3000);
			}
		});
	</script>
 <script>
        $(document).ready(function () {
            // AJAX request to fetch data from /api/names
            $.ajax({
                url: '${pageContext.request.contextPath}/api/names',
                type: 'GET',
                success: function (data) {
                    var selectOptions = ''; // Variable to store options HTML
                    $.each(data, function (index, item) {
                        selectOptions += '<option value="' + item + '">' + item + '</option>'; // Creating options HTML
                    });
                    $('#loginAs').html(selectOptions); // Adding options to select element
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching names:', error);
                }
            });

            // Event listener for dropdown change
            $('#loginAs').change(function () {
                var selectedRole = $(this).val();
                // Change login form action based on selected role
                if (selectedRole === 'teacher') {
                    $('#loginForm').attr('action', '${pageContext.request.contextPath}/api/teacher/login');
                } else {
                    $('#loginForm').attr('action', '${pageContext.request.contextPath}/api/admin/login');
                }
            });

            // Event listener for login form submission
            $('#loginForm').submit(function (event) {
                event.preventDefault(); // Prevent default form submission

                // Perform AJAX login request
                $.ajax({
                    url: $(this).attr('action'), // Get action attribute value (API endpoint)
                    type: 'POST',
                    data: $(this).serialize(), // Serialize form data
                    success: function (response) {
                        // Redirect to another page upon successful login
                        window.location.href = '${pageContext.request.contextPath}/MainFrameAdmin.jsp'; // Redirect to dashboard page
                    },
                    error: function (xhr, status, error) {
                        console.error('Login error:', error);
                        // Handle login error (show error message, etc.)
                    }
                });
            });
        });
    </script><body>
	<div>
		<div>
			<div class="banner">
				<div>
					<img src="./assets/logo1Transparent.png" alt="Second logo">
				</div>
				<diV>
					<p>Teacher Training Support System <br>Government Of Andhra Pradesh</p>
				</diV>
				<div>
					<img src="./assets/logo2Tranparenet.png" alt="First Logo">
				</div>
			</div>
		</div>
		<div class="containerr">
			<!--<div class="container2">
                <p><a href="authentication.html">Login</a></p>
            </div> -->
		</div>
		<div class="container">
			<div class="signin-container">
				<h2 class="signin-heading">Login</h2>
				<form action="" method="post" id="loginForm">
					<div class="form-group">
						<label for="loginAs" class="form-label">Login As</label>
						<select class="form-select" id="loginAs" name="loginAs">
							<option value="admin">----Select Role----</option>
<!-- 							<option value="admin">Admin</option> -->
<!-- 							<option value="teacher">School/Anganwadi Teachers</option> -->
						</select>
					</div>
 
				<!-- Admin Fields -->
					<div id="adminFields" class="form-group hidden">
						<label for="username" class="form-label">Username</label>
						<input type="text" class="form-control" id="username" name="username" />
						<label for="password" class="form-label">Password</label>
						<input type="password" class="form-control" id="passwordId" name="password" />
						<button type="submit" class="btn btn-primary btn-login btn-block onclick="setTreasuryIdSession()">Log In</button>
					</div>
 
					<!-- Teacher Fields -->
					<div id="teacherFields" class="form-group hidden">
						<label for="treasuryId" class="form-label">Treasury Id</label>
						<input type="text" class="form-control" id="treasuryId" name="treasuryId" />
						<label for="mobileNumber" class="form-label">Mobile Number</label>
						<input type="text" class="form-control" id="mobileNumber" name="mobileNumber" />
						<button type="submit" class="btn btn-primary btn-login btn-block" onclick= "setTreasuryIdSession()" >Log In</button>
					</div>
 
				<!--  	<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="rememberMe" />
						<label class="form-check-label" for="rememberMe">Remember me</label>
					</div> -->
		
				</form>
			</div>
		</div>
		<script>
			function setTreasuryIdSession() {
				var treasuryId = document.getElementById('treasuryId').value;
				var userpassword = document.getElementById('mobileNumber').value;
 
				if (typeof (Storage) !== "undefined") {
					sessionStorage.setItem("treasuryId", treasuryId);
					sessionStorage.setItem("userpassword", userpassword);
 
				} else {
					alert("Sorry, your browser does not support session storage.");
				}
			}
			
			   function storeUsernameInSession(username) {
				   
					var password = document.getElementById('passwordId').value;
 
		            if (typeof (Storage) !== "undefined") {
		                sessionStorage.setItem("username", username);
						sessionStorage.setItem("password", password);
						
		                console.log(username);
		                console.log(password);
		            } else {
		                alert("Sorry, your browser does not support session storage.");
		            }
		        }
		</script>
 
 
 
		<!-- Bootstrap JS (optional, only needed if you use Bootstrap JavaScript components) -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
 
</html>