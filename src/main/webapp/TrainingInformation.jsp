<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>TTSS</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
    <!-- Add this script tag after including Toastr CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <!-- Core theme CSS (includes Bootstrap)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Add this in the head section of your HTML file -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  
    <style>
        /* Remove date format from input */
            body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
 
        .maindiv {
            padding: 17px;
        }
 
        .content {
            background-color: #fff;
            border: 1px solid black;
            overflow-x: auto;
            font-size: 14px;
            width: 100%;
            /* Add horizontal scroll if needed */
        }
 
 
        .formheading {
            display: flex;
            justify-content: center;
            background-image: white;
            color: #008CBA;
            padding: 10px; /* Add padding to the form heading */
        }
 
        .table-container {
            overflow-x: auto;
            /* Add horizontal scroll if needed */
        }
 
        table {
            width: 100%;
            border-collapse: collapse;
        }
 
        td,
        th {
            border: 1px solid white;
            text-align: center;
            padding: 5px;
        }
        #trainingTable th {
	background-color: #008CBA;
	color: #fff;
		font-size: 15px;
	
}
 
        tr:nth-child(even) {
            background-color: #dddddd;
        }
 
        @media (max-width: 768px) {
            /* Adjust styles for smaller screens */
 
            .formheading {
                font-size: 18px; /* Adjust font size */
            }
 
            .table-container {
                overflow-x: auto;
            }
 
            table {
                font-size: 14px; /* Adjust font size */
            }
 
            td,
            th {
                padding: 6px; /* Adjust padding */
            }
        }
 
		
.custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td {
    font-size: 14px;
}
.custom-font-size {
    font-size: 14px !important;
}
            
    </style>
</head>
 
<body>
   
        <!-- Page content wrapper-->
        
	<!-- <h1>Training Information</h1>
 
	<table id="trainingTable">
		<thead>
			<tr>
				<th>Training Name</th>
				<th>Training Mode</th>
				<th>Resource Type</th>
				<th>State</th>
				<th>Number of Days</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table> -->
 
<div class="maindiv">
        <div class="content">
            <div class="formheading">
                <h1 class="h2">Previous Training Details</h1>
            </div>
            <div class="table-container">
                <table id="trainingTable">
		<thead>
			<tr>
				<th>Sl No</th>
				<th>Training Name</th>
				<th>Training Mode</th>
				<th>Resource Type</th>
				<th>State</th>
				<th>Number of Days</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
 
			<!-- Add more rows as needed -->
		</tbody>
	</table>
	</div>
	</div>
	</div>
	<script>
		$(window).on('load', function () {
			// Function to check if an element exists
			function elementExists(selector) {
				return $(selector).length > 0;
			}
 
			// Get treasuryId from URL
			var urlParams = new URLSearchParams(window.location.search);
			var treasuryId = urlParams.get('treasuryId');
 
			// Check if the table body element exists
			if (elementExists('#trainingTable tbody')) {
				// Check if treasuryId is not null or empty
				if (treasuryId) {
					// Make an AJAX request to the API endpoint
					$.ajax({
						url: '${pageContext.request.contextPath}/api/training/previous?treasuryId=' + treasuryId,
						//url: '/api/training/previous?treasuryId=' + treasuryId,
						type: 'GET',
						dataType: 'json',
						success: function (data) {
							// Populate the table with the received data
							var tableBody = $('#trainingTable tbody');
							tableBody.empty();
 
							for (var i = 0; i < data.length; i++) {
								var training = data[i];
								var row = $('<tr></tr>');
 
								// Populate the row with data from the 'training' object
						        row.append("<td class='serial-column'>" + (i + 1) + "</td>");
 
								row.append('<td>' + training.trainingname + '</td>');
								row.append('<td>' + training.trainingmode + '</td>');
								row.append('<td>' + training.resourcetype + '</td>');
								row.append('<td>' + training.state + '</td>');
								row.append('<td>' + training.numberofdays + '</td>');
								row.append('<td>' + training.status + '</td>');
 
								// Add the row to the table
								tableBody.append(row);
							}
						},
						error: function (error) {
							// Handle the error (e.g., display an error message)
							console.error('Error:', error);
						}
					});
				} else {
					console.error('TreasuryId is null or empty.');
				}
			} else {
				console.error('Table body element does not exist.');
			}
		});
	</script>
 
</body>
 
</html>
 
       
 
                <!-- Bootstrap core JS-->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- Core theme JS-->
                <script src="js/scripts.js"></script>
</body>
 
</html>