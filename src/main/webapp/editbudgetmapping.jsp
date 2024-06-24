<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Training Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 20px;
	display: flex;
	flex-direction: column; /* Align children in a column */
	align-items: center; /* Center align children horizontally */
}

h2 {
	width: 100%;
	text-align: center;
	color: #007bff;
}

/* Style for the container */
.training-details {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	max-width: 800px;
	/* Set a max-width for better readability on larger screens */
}

/* Style for each row */
.row {
	display: flex;
	flex-wrap: wrap;
	width: 100%;
	margin-bottom: 16px;
}

/* Style for each column */
.column {
	flex: 1;
	margin-bottom: 16px;
	padding: 0 8px; /* Add some horizontal spacing between columns */
}

input {
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 5px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

strong {
	font-weight: bold;
}

button {
	width: 50%;
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

/* .btn-danger { */
	
/* 	background-color: #dc3545; */
/* 	color: #fff; */
/* 	padding: 10px; */
/* 	border: none; */
/* 	border-radius: 4px; */
/* 	cursor: pointer; */
/* 	margin-left: -51%; */
/* } */

button:hover {
	background-color: #0056b3;
}

/* Media Queries for responsiveness */
@media only screen and (max-width: 425px) {
    .column {
        flex: 1 1 100%; /* One column on small screens */
        padding: 0 5px; /* Adjust horizontal padding */
    }

    button {
        width: 100%; /* Make buttons full width */
        margin-bottom: 10px; /* Increase spacing between buttons */
    }

    .btn-danger {
        margin-left: 0; /* Reset margin for danger button */
    }
}

@media only screen and (min-width: 426px) and (max-width: 554px) {
    .column {
        flex: 1 1 50%; /* Two columns on medium-small screens */
    }
}

@media only screen and (min-width: 555px) {
    .column {
        flex: 1 1 33.333%; /* Three columns on larger screens */
    }
}

/* /* Media Queries for responsiveness */ */
/* @media only screen and (min-width: 768px) { */
/* 	.column { */
/* 		flex: 1 1 50%; /* Two columns on medium screens */ */
/* 	} */

/* 	.btn-danger { */
/* 		margin-left: 0; /* Reset margin for button on medium screens */ */
/* 	} */
/* } */

/* @media only screen and (min-width: 992px) { */
/* 	.column { */
/* 		flex: 1 1 33.333%; /* Three columns on large screens */ */
/* 	} */
/* } */
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<h2>Edit Training Details</h2>

	<!-- Container for training details -->
<!-- 	<div id="trainingDetails" class="training-details"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="column" style="display: none;"> -->
<!-- 				<strong>SL:</strong> <input type="text" id="slField" disabled><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>Budgeted Year:</strong> <input type="text" -->
<!-- 					id="budgetedyearField" readonly><br> -->
<!-- 			</div> -->

<!-- 			<div class="column"> -->
<!-- 				<strong>Training Name:</strong> <input type="text" -->
<!-- 					id="trainingnameField" disabled><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>TCC Name:</strong> <input type="text" id="tcnameField" -->
<!-- 					disabled><br> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row"> -->

<!-- 			<div class="column"> -->
<!-- 				<strong>Estimated Budget:</strong> <input type="text" -->
<!-- 					id="estimatedbudgetField" disabled><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>Sanctioned Budget:</strong> <input type="text" -->
<!-- 					id="sanctionedbudgetField"><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>Trainee Role:</strong> <input type="text" -->
<!-- 					id="traineeroleField"><br> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row"> -->

<!-- 			<div class="column"> -->
<!-- 				<strong>No Of Days:</strong> <input type="text" id="frequencyField" -->
<!-- 					readonly><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>Unit:</strong> <input type="text" id="unitField" readonly><br> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>Amount:</strong> <input type="text" id="amountField"><br> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<div class="column"> -->
<!-- 				<strong>status:</strong> <input type="text" id="status" readonly><br> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row"  > -->
<!-- 			<div class="column"> -->
<!-- 				<button onclick="updateTrainingDetails()" class="">Update</button> -->
<!-- 			</div> -->
<!-- 			<div class="column"> -->
<!-- 				<button type="button" class="btn btn-danger btn-lg" -->
<!-- 					onclick="deleteBudget()">Cancel</button> -->
<!-- 			</div> -->
<!-- 			</div> -->

<!-- 		</div> -->

<div id="trainingDetails" class="training-details">
		<div class="row">
 			<div class="col-md-4" style="display: none;">
				<strong>SL:</strong> <input type="text" id="slField" disabled><br>
			</div>
				<div class="col-md-4">
				<strong>Budgeted Year:</strong> <input type="text" id="budgetedyearField" readonly><br>
			</div>
			<div class="col-md-4">
				<strong>Training Name:</strong> <input type="text" id="trainingnameField" disabled><br>
			</div>
			<div class="col-md-4">
				<strong>TCC Name:</strong> <input type="text" id="tcnameField" disabled><br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4" >
				<strong>Estimated Budget:</strong> <input type="text" id="estimatedbudgetField" disabled><br>
			</div>
			<div class="col-md-4">
				<strong>Status:</strong> <input type="text" id="status" readonly><br>
			</div>
			<div class="col-md-4" style="display: none;">
				<strong>Sanctioned Budget:</strong> <input type="text" id="sanctionedbudgetField"><br>
			</div>
			<div class="col-md-4">
				<strong>Trainee Role:</strong> <input type="text" id="traineeroleField"><br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<strong>No Of Days:</strong> <input type="text" id="frequencyField" readonly><br>
			</div>
			<div class="col-md-4">
				<strong>Unit:</strong> <input type="text" id="unitField" readonly><br>
			</div>
			<div class="col-md-4">
				<strong>Amount:</strong> <input type="text" id="amountField"><br>
			</div>
		</div>
		<div class="row">
			
		</div>
		<div class="row">
			<div class="col-md-4">
				<button onclick="updateTrainingDetails()" >Update</button>
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-danger" onclick="deleteBudget()">Cancel</button>
			</div>
		</div>
	</div>

		<script>
			function deleteBudget() {
				window.location.href = "${pageContext.request.contextPath}/viewBudgetScreen.jsp";

			}
			var slno;
			$(document)
					.ready(
							function() {
								// Function to extract the slno from the URL
								function getParameterByName(name, url) {
									if (!url)
										url = window.location.href;
									name = name.replace(/[\[\]]/g, "\\$&");
									var regex = new RegExp("[?&]" + name
											+ "(=([^&#]*)|&|#|$)"), results = regex
											.exec(url);
									if (!results)
										return null;
									if (!results[2])
										return '';
									return decodeURIComponent(results[2]
											.replace(/\+/g, " "));
								}

								// Get the slno from the URL
								slno = getParameterByName('slno');

								// Check if slno is present
								if (slno) {
									// Make an AJAX GET request
									$
											.ajax({
												type : "GET",
												url : "${pageContext.request.contextPath}/api/mapping/search/data?mid="
														+ slno, // Replace with your actual API endpoint
												dataType : "json",
												success : function(data) {
													// Populate the input fields with data
													$('#slField').val(
															data[0].sl);
													$('#budgetedyearField')
															.val(
																	data[0].budgetedyear);
													$('#trainingnameField')
															.val(
																	data[0].trainingname);
													$('#tcnameField').val(
															data[0].tcname);
													$('#estimatedbudgetField')
															.val(
																	data[0].estimatedbudget);
													$('#sanctionedbudgetField')
															.val(
																	data[0].sanctionedbudget);
													$('#traineeroleField')
															.val(
																	data[0].traineerole);
													$('#frequencyField').val(
															data[0].frequency);
													$('#unitField').val(
															data[0].unit);
													$('#amountField').val(
															data[0].amount);
													$('#status')
															.val(
																	data[0].recordstatus);

													// Handle the response data as needed
													console.log(data);
												},
												error : function(xhr, status,
														error) {
													console
															.error("API request error: "
																	+ error);
													// Handle the error here, e.g., display an error message to the user
												}
											});
								} else {
									console
											.error('slno parameter not found in the URL.');
									// Handle the case where slno parameter is not present
								}
							});

			// Function to update training details
			function updateTrainingDetails() {
				// Retrieve updated values from input fields
				var updatedData = {
					sl : $('#slField').val(),
					budgetedyear : $('#budgetedyearField').val(),
					trainingname : $('#trainingnameField').val(),
					tcname : $('#tcnameField').val(),
					estimatedbudget : $('#estimatedbudgetField').val(),
					sanctionedbudget : $('#sanctionedbudgetField').val(),
					traineerole : $('#traineeroleField').val(),
					frequency : $('#frequencyField').val(),
					unit : $('#unitField').val(),
					amount : $('#amountField').val(),
					recordstatus : $('#status').val()
				};

				// Check the value of recordstatus and update it accordingly
				if (updatedData.recordstatus.trim().toLowerCase() === 'To be approved') {
					updatedData.recordstatus = 'To be approved';
				} else if (updatedData.recordstatus.trim().toLowerCase() === 'approved') {
					updatedData.recordstatus = 'waiting for next approval';
				} else if (updatedData.recordstatus.trim().toLowerCase() === 'delivered') {
					updatedData.recordstatus = 'waiting for next approval';
				}

				// Make an AJAX POST request to update the data
				$
						.ajax({
							type : "PUT",
							url : "${pageContext.request.contextPath}/api/mapping/updatebyid/"
									+ slno, // Replace with your actual API endpoint
							contentType : "application/json",
							data : JSON.stringify(updatedData),
							success : function(response) {
								console.log("Update successful:", response);
								alert("Training details updated successfully!");
								window.location.href = "${pageContext.request.contextPath}/viewBudgetScreen.jsp";
							},
							error : function(xhr, status, error) {
								console.error("Update failed:", error);
								alert("Error updating training details. Please try again.");
							}
						});

			}
		</script>
</body>
</html>
