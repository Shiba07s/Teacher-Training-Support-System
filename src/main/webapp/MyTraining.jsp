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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
 
<!-- Add this in the head section of your HTML file -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
 
<!--      ########## Data-table ########## -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
 
<!-- DataTables Buttons CSS/JS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
 
<!-- Core theme CSS (includes Bootstrap) -->
<link href="css/styles.css" rel="stylesheet" />
 
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
 
 
 
 
<style>
table {
	border-collapse: collapse;
}
 
td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	font-size: 14px;
}
 
th {
	border: 1px solid white;
	text-align: left;
	padding: 5px;
}
 
#trainingTable th {
	border: 1px solid white;
	background-color: #008CBA;
	color: #fff;
	font-size: 15px;
}
 
.container {
	width: 100%;
	height: 100%;
	font-size: 9px;
/* 	margin-right: 20%; */
}
 
#tab2 {
	display: none;
}
 
.table {
	height: "50px";
	width: 100%;
}
 
/* Style for the table head */
#mytraining thead th {
	background-color: #008CBA; /* Blue background color */
	color: white; /* White text color */
}
 
/* Style for the table body */
#mytraining tbody td {
	/* Add your custom styles for the table body cells here */
	
}
 
.dataTables_filter {
	position: fixed;
	top: 9%;
	right: 10px;
	z-index: 1000;
}
</style>
 
<!-- Bootstrap and Popper.js scripts -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
 
</head>
 
<body>
	<div class="row">
		<div id="head" align="center">
			<h2>
				<b>My Trainings</b>
			</h2>
		</div>
	</div>
	
	<div class=" mt-2 tab-content" id="tab3"
		style="width: 170%; position: relative;">
 
		<div class="card mt-2"
			style="font-size: 14px; width: 98%; ">
 
			<div id="cdhead" class="card-header">
				<div class="row">
					<div id="appenders1" class="col-md-2"></div>
					<div id="appenders2" class="col-md-2"></div>
				</div>
			</div>
			<div class="card-body">
				<div id="myTrainings"></div>
				<div class="table-responsive ">
					<table class="table table-hover" id="mytraining">
						<thead>
							<tr>
								<th>slno</th>
								<th>Treasury Id</th>
								<th>Training Name</th>
								<th>Training Mode</th>
								<th>Training description</th>
								<th>Training start to end date</th>
								<th>Training Start Time</th>
								<th>Training End Time</th>
								<th>Venue Name</th>
								<th>Venue Address</th>
								<th>Venue Contact</th>
								<th>Trainer Name</th>
								<th>Map Location</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
			<div class="card-footer">
			<div class="row">
					<div id="appenders3" class="col-md-2"></div>
					<div id="appenders4"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			// Handle input events on the search bar
			$("#searchBar").on("input", function() {
				var searchText = $(this).val().toLowerCase();
				filterTableRows(searchText);
			});
		});
 
		// Function to filter table rows based on search text
		function filterTableRows(searchText) {
			$("#mytraining tbody tr").filter(
					function() {
						var trainingName = $(this).find("td:eq(2)").text()
								.toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(trainingName.indexOf(searchText) > -1);
					});
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
 
							$('#mytraining').on(
									'click',
									'.truncated-cell',
									function() {
										var $this = $(this);
										var title = $this.attr('title');
										$this.text(title);
										// Remove click event to prevent multiple clicks
										$this.removeClass('truncated-cell')
												.removeAttr('title');
									});
							// Call the function to fetch data and display it
							fetchDataAndDisplay();
 
							// Function to fetch data and display it
							function fetchDataAndDisplay() {
								// Retrieve treasuryId from session storage
								var treasuryId = sessionStorage
										.getItem('UserName');
 
								if (!treasuryId) {
									console
											.error("Treasury Id not found in session storage");
									// Handle the case where treasuryId is not present in session storage
									return;
								}
 
								$
										.ajax({
											type : "GET",
											url : "${pageContext.request.contextPath}/api/mytrainings?treasuryId="
													+ treasuryId,
											dataType : "json",
											success : function(data) {
												console.log(data);
												displayTrainingData(data);
 
												// Initialize DataTables
												// 		                $('#mytraining').DataTable({
												// 		                    "paging": true,
												// 		                    "pageLength": 10,
												// 		                    "ordering": true,
												// 		                    "searching": true
												// 		                });
											},
											error : function(xhr, status, error) {
												console
														.error("API request error: "
																+ error);
											}
										});
							}
 
							function displayTrainingData(data) {
								var trainings = data;
								trainings.reverse();
								var tableBody = $("#mytraining tbody");
 
								// Clear existing rows
								tableBody.empty();
 
								for (var i = 0; i < trainings.length; i++) {
									var training = trainings[i];
									var row = $("<tr></tr>");
									row.append("<td class='serial-column'>"
											+ (i + 1) + "</td>");
									row.append("<td>" + training.treasuryid
											+ "</td>");
									row.append("<td>" + training.tname
											+ "</td>");
									row.append("<td>" + training.tmode
											+ "</td>");
									row.append("<td>" + training.tdescription
											+ "</td>");
									row.append("<td>" + training.startdate
											+ " to " + training.enddate
											+ "</td>");
									row.append("<td>" + training.tstarttime
											+ "</td>");
									row.append("<td>" + training.tendtime
											+ "</td>");
 
									row.append("<td>" + training.vname
											+ "</td>");
									row.append("<td>" + training.vaddress
											+ "</td>");
									row.append("<td>" + training.vcontact
											+ "</td>");
									row.append("<td>" + training.trainername
											+ "</td>");
									row.append("<td>" + training.maplocation
											+ "</td>");
									row.append("<td>" + training.status
											+ "</td>");
									tableBody.append(row);
								}
								var dataTableMyTraining = $('#mytraining')
										.DataTable(
												{
													"columnDefs" : [ {
														"targets" : '_all', // Apply to all columns
														"render" : function(
																data, type,
																row, meta) {
															// Check if it's not the second column or the last column
															if (meta.col < (meta.settings.aoColumns.length)) {
																if (type === 'display'
																		&& data
																		&& data.length > 25) {
																	return '<span class="truncated-cell" title="' + data + '">'
																			+ data
																					.substr(
																							0,
																							25)
																			+ '...</span>';
																} else {
																	return data;
																}
															} else {
																return data; // Return full data for the second and last column
															}
														}
													} ],
 
													buttons : [
															{
																extend : 'pdfHtml5',
																orientation : 'landscape', // or 'portrait'
																pageSize : 'A4', // or 'A4', 'A3', etc.
																text : 'PDF', // Button text
																exportOptions : {
																	columns : ':visible'
																}
															// Include only visible columns in PDF
															},
															{
																extend : 'excel',
																text : 'Excel' // Button text
															} ],
													dom : 'lBfrtip'
 
												});
 
								$('.dt-buttons').addClass('btn-group').css({
									'font-size' : '14px',
									'margin-left' : '-40px',
									'margin-top' : '12px'
 
								});
								$('.dataTables_length').css({
									'width' : '140px',
									'margin-top' : '15px'
								}).appendTo('#appenders1');
								$('.dt-buttons').appendTo('#appenders2');
								$('.dataTables_filter').appendTo('#cdhead');
								$('.buttons-excel, .buttons-pdf').addClass(
										'btn btn-primary btn-blue').css(
										'width', '90px');
								$('.btn-blue').css('background-color',
										'#63f542');
							}
						});
	</script>
 
 
 
</body>
</html>