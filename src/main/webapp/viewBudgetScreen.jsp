<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TTSS</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Add this script tag after including Toastr CSS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>

<style>
.serial-column {
	font-weight: bold;
}

.table thead th {
	background-color: #008CBA;
	color: #fff;
	font-weight: bold;
	border-color: #007bff;
}

.table tbody td {
	border-color: #007bff;
}

.table tbody tr:hover {
	background-color: #f1f1f1;
}
.form-select{
   font-size: 16px;
}
 .form-select option {
        font-size: 16px; /* Adjust the font size as needed */
    }
#trainingName {
	font-size: 1.5rem;
	color: #007bff;
	margin-bottom: 20px;
	text-transform: uppercase;
}

.fixed-buttons {
	position: fixed;
	bottom: 20px;
	right: 40%;
	display: flex;
	gap: 10px;
	font-size: 20px;
}

/* Optional styles for the buttons */
.fixed-buttons button {
	padding: 10px 20px;
}

.button-width-100 {
	width: 85px;
	font-size: 14px; /* Customize the width as needed */
}

.custom-font-size table.dataTable, .custom-font-size table.dataTable th,
	.custom-font-size table.dataTable td {
	font-size: 14px;
}

.custom-font-size {
	font-size: 14px !important;
}
</style>

<!--      ########## Data-table ########## -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<body>

	<a href="${pageContext.request.contextPath}/budgetmapping2.jsp"
		class="btn btn-success mt-2 custom-font-size"
		style="margin-bottom: 10px">Create New Budget For Training +</a>




	<div class="container">


		<!-- 		<div class="row custom-font-size"> -->
		<!-- 			<div class="col-md-5 custom-font-size"> -->
		<!-- 				<label for="trainingDropdown">Training Name :</label> <select -->
		<!-- 					id="trainingDropdown" style="width:200px; padding: 5px;overflow: hidden; /* Hide overflow content */white-space: nowrap; /* Prevent wrapping */text-overflow: ellipsis; /* Show ellipsis for overflow */ " onchange="fun()"></select> -->
		<!-- 			</div> -->
		<!-- 			<div class="col-md-5 custom-font-size"> -->
		<!-- 				<div class="field"> -->
		<!-- 					<label for="venueDropdown">Venue Name:</label> <select -->
		<!-- 						id="venueDropdown" style="width:200px; padding: 5px;overflow: hidden; /* Hide overflow content */white-space: nowrap; /* Prevent wrapping */text-overflow: ellipsis;" onchange="searchVenue()"> -->
		<!-- 					</select> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<div class="row custom-font-size">
			<div class="col-md-5">
				<label for="trainingDropdown" class="custom-font-size">Training
					Name:</label> <select id="trainingDropdown" class="form-select"
					style="max-width: 100%; " onchange="fun()">
					<!-- Your options here -->
				</select>
			</div>
			<div class="col-md-5">
				<label for="venueDropdown" class="custom-font-size">Venue
					Name:</label> <select id="venueDropdown" class="form-select"
					style="max-width: 100%;" onchange="searchVenue()">
					<!-- Your options here -->
				</select>
			</div>
		</div>


	</div>





	<div class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<!--             <h3 class="text-center" id="trainingName"></h3> -->
			<div
				class="table-responsive-xl table-responsive-md table-responsive-lg table-responsive-sm table-responsive-xxl custom-font-size">
				<table class="table table-bordered " id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead>
						<tr>
							<th>Sl no</th>
							<th style="display: none;">Id</th>
							<th>Budgeted Year</th>
							<th style="display: none;">Training Id</th>
							<th style="display: none;">Venue Id</th>
							<th>Component</th>
							<th>Estimated Amount</th>
							<th>Actual Amount</th>
							<th style="display: none;">Additonal Amount</th>
							<th>Approved Amount</th>
							<th>Trainee Role</th>
							<th>Frequency</th>
							<th>Unit</th>
							<th>Per Unit Amount</th>
							<th>recordstatus</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<!--                 <div class="fixed-buttons"> -->
				<!--                     <button class="btn btn-success" id="approveButton" style="font-size: 14px;" onclick="approveTraining();">Approved</button> -->
				<!--                     <button class="btn btn-danger" id="rejectButton" style="font-size: 14px;" onclick="rejectTraining();">Rejected</button> -->
				<!--                 </div> -->
			</div>
		</div>
	</div>

	<script>
    $(document).ready(function() {
        // Fetch training names from the API endpoint
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/mapping/distinct/trainings",
            success: function(data) {
                const trainingDropdown = $("#trainingDropdown");
                trainingDropdown.empty(); // Clear previous content
                $("#venueDropdown").empty();
                trainingDropdown.append('<option value="" disabled selected>Select a Training</option>');
               	$("#venueDropdown").append('<option value="" disabled selected>Select a Venue</option>');

 
                data.forEach(training => {
                    const parts = training.split(',');
                    const refPlannerId = parts[0].trim();
                    const tname = parts[1].trim();
 
                    const trainingOption = $("<option></option>")
                        .attr("value", refPlannerId)
                        .text(tname);
                    
                    trainingDropdown.append(trainingOption);
                });
            },
            error: function(error) {
                console.error('Error fetching training data:', error);
            }
        });
        
    })
    
    function fun(){
    	
        const selectedTrainingId = document.getElementById('trainingDropdown').value;
 
       	const venueDropdown = document.getElementById('venueDropdown');
       	$("#venueDropdown").empty();
       	$("#venueDropdown").append('<option value="" disabled selected>Select a Venue</option>');
       	
       	var tableBody = $("#trainingTable tbody");
        tableBody.empty();

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/mapping/distinct/venue?trainingid=" + selectedTrainingId,
            success: function(data) {
            	
            	
            	
                data.forEach(venue => {
                    const venueOption = document.createElement('option');
                    venueOption.value = venue.split(',')[0]; // assuming the first part is ref_planner_id
                    venueOption.textContent = venue.split(',')[1]; // assuming the second part is tname
                    venueDropdown.appendChild(venueOption);
                });
                             
          },
            error: function(error) {
                console.error('Error fetching training details:', error);
                alert('Error fetching training details. Please try again.');
            }
        });
        
    
    }
    
    function searchVenue(){
        const venue = document.getElementById('venueDropdown').value;
        console.log(venue);
        
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/api/search/venueId?vid=" + venue,
            success: function(data) {
            	fetchDataAndDisplay(); 
            },
            error: function(error) {
                console.error('Error fetching training details:', error);
                alert('Error fetching training details. Please try again.');
            }
        });
          	
    }
    
        var trainingMappingBudgetArray = [];
        
        var actualAmount;
        var resultText;// Define the variable
 
        //fetchDataAndDisplay();
 
        function fetchDataAndDisplay() {
        	 const selectedTrainingId = document.getElementById('trainingDropdown').value;
             const selectedVenueId = document.getElementById('venueDropdown').value;
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/api/mapping/budget1?trainingid="+selectedTrainingId+"&venueid="+selectedVenueId,
                dataType: "json",
                success: function(data) {
                    if (data.length > 0) {
                        displayTrainingData(data);
                    } else {
                    	var tableBody = $("#trainingTable tbody");
                        tableBody.empty();
                        toastr.error("No data available");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to fetch training data");
                }
            });
        }
 
        function displayTrainingData(data) {
            var trainings = data;
            trainings.reverse();
            var tableBody = $("#trainingTable tbody");
            tableBody.empty();
 
            var totalAdditionalBudget = 0;
            var totalSanctionedBudget = 0;
            var totalEstimatedBudget = 0;
 
            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var additionalAmount = training.estimatedbudget - training.sanctionedbudget;
 
                totalAdditionalBudget += additionalAmount;
                totalSanctionedBudget += training.sanctionedbudget;
                totalEstimatedBudget += training.estimatedbudget;
 
                // Display training name in the table heading
                if (i === 0) {
                    $("#trainingName").text(training.trainingname);
                }
 
                var row = $("<tr></tr>");
                row.append("<td class='serial-column'>" + (i + 1) + "</td>");
                row.append("<td class='sl' style='display: none;'>" + training.sl + "</td>");
                row.append("<td>" + training.budgetedyear + "</td>");
                row.append("<td style='display: none;'>" + training.trainingid + "</td>");
                row.append("<td style='display: none;'>" + training.venueid + "</td>");
                row.append("<td>" + training.tcname + "</td>");
                row.append("<td class='estimated-budget'>" + training.estimatedbudget + "</td>");
                row.append("<td class='sanctioned-budget'>" + training.sanctionedbudget + "</td>");
                row.append("<td style='display: none;'>" + training.additionalbudget + "</td>");
                row.append("<td>" + training.approvedbudget + "</td>");
                row.append("<td>" + training.traineerole + "</td>");
                row.append("<td>" + training.frequency + "</td>");
                row.append("<td>" + training.unit + "</td>");
                row.append("<td>" + training.amount + "</td>");
                row.append("<td>" + training.recordstatus + "</td>");
                row.append("<td><button class='btn btn-success btn-sm edit-button button-width-100' onclick='editTraining("
                    + training.sl  // Passing the index as the parameter
                    + ")'>Edit</button> </td>");
                tableBody.append(row);
            }
 
            // Calculate total estimated budget
            var totalEstimatedBudgetForRow = 0;
            $('.estimated-budget').each(function () {
                totalEstimatedBudgetForRow += parseInt($(this).text(), 10);
            });
            var totalSanctionedBudgetForRow = 0;
            $('.sanctioned-budget').each(function () {
                totalSanctionedBudgetForRow += parseInt($(this).text(), 10);
            });
            var totalAdditionalBudgetForRow = 0;
            $('.additional-budget').each(function () {
                totalAdditionalBudgetForRow += parseInt($(this).text(), 10);
            });
 
            // Display total row
//             var totalRow = $("<tr></tr>");
//             totalRow.append("<td></td>"); // Empty cell for serial-column
//             totalRow.append("<td>Total</td>");
//             totalRow.append("<td></td>"); // Empty cells for non-numeric columns
//             totalRow.append("<td></td>");
//             totalRow.append("<td></td>");
//             totalRow.append("<td id='totalEstimatedBudgetForRow'>" + totalEstimatedBudgetForRow.toLocaleString() + "</td>"); // Display formatted total estimated budget for rows
//             totalRow.append("<td id='totalSanctionedBudgetForRow'>" + totalSanctionedBudgetForRow.toLocaleString() + "</td>"); // Display formatted total sanctioned budget
//             tableBody.append(totalRow);
        }
 
        function editTraining(slno) {
            // Construct the URL with the slno parameter
            var editUrl = '${pageContext.request.contextPath}/editbudgetmapping.jsp?slno=' + encodeURIComponent(slno);
 
            // Redirect to the edit page
            window.location.href = editUrl;
        }
        function approveTraining() {
            var approvedDataArray = [];
            var totalActualAmount=0;
 
            // Iterate through each row in the table
            $("#trainingTable tbody tr").each(function () {
                // Extract the estimated and actual amounts from the current row
                var estimatedAmount = parseInt($(this).find(".estimated-budget").text(), 10);
                var actualAmount = parseInt($(this).find(".sanctioned-budget").text(), 10);
                var slId = parseInt($(this).find(".sl").text(), 10);
 
                // Calculate the difference between estimated and actual amounts
                var difference = actualAmount - estimatedAmount;
 
                // Display the result with the appropriate symbol
                var resultText = (difference >= 0) ? '+' + difference : difference;
                console.log(resultText);
 
                // Add actual amount to the total
                totalActualAmount += actualAmount;
 
                // Add actual amount and result text to the array
                approvedDataArray.push({
                	approvedbudget: actualAmount,
                    additionalbudget: resultText,
                    sl: slId,
                    recordstatus:'delivered'
                });
            });
 
            // Get the trainingId and venueId from the first row
            var trainingId = $("#trainingTable tbody tr:first-child td:eq(3)").text();
            var venueId = $("#trainingTable tbody tr:first-child td:eq(4)").text();
 
            // Prepare the data object
            var data = approvedDataArray;
 
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/api/mapping/approve/" + trainingId + "/" + venueId,
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function () {
                    toastr.success("Training approved successfully!");
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to approve training");
                }
            });
        }
 
    </script>
</body>
</html>