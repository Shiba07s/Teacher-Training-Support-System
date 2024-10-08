<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
	display: flex;
	justify-content: center;
}

form {
	max-width: 600px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.form-column {
	float: left;
	width: 45%;
	margin-right: 5%;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #333;
}

input, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.invalid-feedback {
	color: red;
	font-size: 12px;
	margin-top: 5px;
}

.buttons {
	text-align: center;
	clear: both;
	margin-top: 15px;
	border: none;
	cursor: pointer;
}

.hidden {
	display: none;
}

button {
	width: 120px;
	padding: 10px;
	border: none;
	cursor: pointer background-color: #4caf50;
}

button:hover {
	background-color: #45a049;
}
</style>
<meta charset="ISO-8859-1">
<title>Edit Head</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		// Get field values from URL parameters
		editHead();

		window.submitForm = function() {
			var isConfirmed = confirm("Are you sure you want to edit this training?");
			 
			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
			updateHead();
			}
			return false;
		}

	});
	// Function to get URL parameters by name
	function getUrlParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
		var results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	function editHead() {
		var code = getUrlParameter('sl');
		if (code) {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/api/head/getbyid/" + code, // Replace with your actual endpoint
						dataType : "json",
						success : function(data) {
							console.log(data);
							// Populate form fields with the retrieved data
							$('#sl').val(data.sl);
							$('#tccode').val(data.tccode);
							$('#tcnames').val(data.tcnames);
							// Display the form for editing
							$('#myForm').show();
						},
						error : function(xhr, status, error) {
							console.error('Error fetching data:',
									xhr.responseText);
							alert('Error fetching data. Please check the console for details.');
						}
					});
		} else {
			alert('ID not provided in the URL.');
		}
	}

	function closeForm() {
		window.location.href = "${pageContext.request.contextPath}/HeadMaster.jsp";
	}
	function updateHead() {
		if (validateForm()) {
			var modifiedid = $("#sl").val();
			var modifiedData = {
					tccode : $("#tccode").val(),
					tcnames : $("#tcnames").val()
			};

			// Perform AJAX request to update the data
			$.ajax({
				type : "PUT",
				url : "${pageContext.request.contextPath}/api/head/update/" + modifiedid,
				contentType : "application/json",
				data : JSON.stringify(modifiedData),
				success : function(response) {
					console.log("Data updated successfully");
					alert("Data updated successfully");
					window.location.href = "${pageContext.request.contextPath}/HeadMaster.jsp";
				},
				error : function(xhr, status, error) {
					console.error("Failed to update Component: " + error);
					alert("Failed to update Component: " + error);
				}
			});
		} else {
			return;
		}
	}
	function validateForm() {
		var requiredFields = [ "tcnames", "tccode"];

		// Check each required field
		for (var i = 0; i < requiredFields.length; i++) {
			var field = requiredFields[i];
			var value = $("#" + field).val();

			if (value === null || value === "") {
				alert("Please fill in all required fields.");
				return false; // Exit the function if any field is empty
			}
		}

		// Return true if all required fields are filled
		return true;
	}
</script>

</head>
<body>
	<div class="container" align="center">
		<h1 class="text-center">Edit Head</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group" style="display: none">
						<label for="sl">Id:</label> <input type="text" id="sl"
							class="form-control" readonly>
					</div>
					<div class="form-group" style="display: none">
						<label for="tccode">TC Code</label> <input type="text"
							id="tccode" class="form-control" placeholder="Enter Code"
							required>
					</div>
					

				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="tcnames">TC Name:</label> <input type="text"
							id="tcnames" class="form-control"
							placeholder="Enter Name" required >
					</div>
				</div>
			</div>
			<div class="row" style="display: flex;justify-content: flex-start;">
					<button type="submit" class="btn btn-primary" style="margin-left: 15px;">Update</button>
					<button type="button" class="btn btn-danger" style="margin-left: 5px; onclick="closeForm()">Cancel</button>
				</div>
		</form>
	</div>

</body>
</html>