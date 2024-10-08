<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Component Resource Limit</title>

<!-- Favicon-->
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

.buttons {
	text-align: center;
	clear: both;
	margin-top: 15px;
	border: none;
	cursor: pointer;
}

button {
	width: 120px;
	padding: 10px;
	border: none;
	cursor: pointer;
	background-color: #4caf50;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="container" align="center">
		<h1>Edit Trainee Limit</h1>
		<form id="myForm" class="text-left" onsubmit="return submitForm()">
			<div class="row">
				<div class="col-md-6">
					<label for="Expense">Expense Type:</label> <input type="text"
						id="Expense" required>
				</div>
				<div class="col-md-6">
					<label for="budgeted_year">Budgeted Year</label> <input type="text"
						id="budgeted_year" placeholder="Enter Budgeted year" required
						readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="Trainee">Trainee Role:</label> <input type="text"
						id="Trainee"
						oninput="this.value = this.value.replace(/[^A-Za-z]/g, '');"
						required>
				</div>
				<div class="col-md-6">
					<label for="Approved">Approved Rate:</label> <input type="text"
						id="Approved" pattern="\d*"
						oninput="this.value = this.value.replace(/[^0-9]/g, '');" required>
				</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label for="unit">Unit:</label> <select id="unit" required></select>
					</div>


					<input type="hidden" id="sl" name="sl">

				</div>

			<div class="row" style="display: flex; justify-content: center;">
					<button type="submit" class="btn btn-primary" id="updateButton" style="margin-right: 5px;">Update</button>
					<!--                     &nbsp; -->
					<button type="button" class="btn btn-danger" onclick="closeForm()"
						id="exitButton">Close</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		$(document)
				.ready(
						function() {

							// Get field values from URL parameters
							editCLimit();
							// Handle change event of the #resources dropdown

							window.submitForm = function() {
								var isConfirmed = confirm("Are you sure you want to edit this training?");
								if (isConfirmed) {
									updateComponentData();
								}
								return false;
							}
						});

		function updateComponentData() {
			var sl = getUrlParameter('sl');
			var formData = {
				sl : $("#sl").val(),
				expenseType : $("#Expense").val(),
				traineeRole : $("#Trainee").val(),
				budgetedYear : $("#budgeted_year").val(),
				approvedRate : $("#Approved").val(),
				unit : $("#unit").val()
			};
			$
					.ajax({
						type : "PUT",
						url : "${pageContext.request.contextPath}/api/updateTraineesLimit/"
								+ sl,
						contentType : "application/json",
						data : JSON.stringify(formData),
						success : function(response) {
							console.log(response);
							toastr.success("Data updated successfully");
							setTimeout(
									function() {
										window.location.href = "${pageContext.request.contextPath}/TraineeLimit.jsp";
									}, 1000);
						},
						error : function(xhr, status, error) {
							console.error("API request error: " + error);
							toastr.error("Failed to update data");
						}
					});
			return false;
		}

		function closeForm() {
			window.location.href = "${pageContext.request.contextPath}/TraineeLimit.jsp";
		}

		function editCLimit() {
			var sl = getUrlParameter('sl');
			if (sl) {
				$
						.ajax({
							type : "GET",
							url : "${pageContext.request.contextPath}/api/getbyTraineesLimitid/"
									+ sl,
							dataType : "json",
							success : function(data) {

								const unit = $('#unit');
								//                         res.empty();
								unit.empty();

								//                         // Assuming data is an array of items
								//                         $.each(data, function(index, item) {
								//                             res.append('<option value="' + item.vendorName + '" data-byear="' + item.budgetedYear + '">' + item.resources + '</option>');
								//                         });
								unit
										.append('<option value="' + data.unit + '">'
												+ data.unit + '</option>'); // Adjust this according to your data structure

								if (data.unit === "Per Day") {
									unit
											.append('<option value="lumpsum">LumpSum</option>'); // Adjust this according to your data structure

								} else {
									unit
											.append('<option value="Per Day">Per Day</option>'); // Adjust this according to your data structure

								}

								$('#Expense').val(data.expenseType); // Assuming sl is a property of the first item
								$('#Trainee').val(data.traineeRole); // Assuming sl is a property of the first item
								$('#sl').val(data.sl); // Assuming sl is a property of the first item
								$('#budgeted_year').val(data.budgetedYear); // Assuming budgetedYear is a property of the first item
								$('#Approved').val(data.approvedRate); // Adjust this according to your data structure
								$('#myForm').show();

							},
							error : function(xhr, status, error) {
								console.error('Error fetching venue data:',
										xhr.responseText);
								alert('Error fetching venue data. Please check the console for details.');
							}
						});
			} else {
				alert('ID not provided in the URL.');
			}
		}

		function getUrlParameter(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
			var results = regex.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}
	</script>
</body>
</html>
