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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
<link href="css/styles.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>



<!-- DataTables CSS/JS -->
<!--     <link rel="stylesheet" type="text/css" -->
<!--         href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script type="text/javascript"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

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
.custom-font-size table.dataTable, .custom-font-size table.dataTable th,
	.custom-font-size table.dataTable td {
	font-size: 14px;
}

.custom-font-size {
	font-size: 14px !important;
}

.serial-column {
	font-weight: bold;
}

.table thead th {
	background-color: #008CBA;
	color: #fff;
	font-weight: bold;
	border-color: #007bff;
	font-size: 15px;
}

.table tbody td {
	border-color: #007bff;
	font-size: 14px;
}

.table tbody tr:hover {
	background-color: #f1f1f1;
}

.dataTables_filter {
	position: fixed;
	top: 20px;
	right: 10px;
	z-index: 1000;
}
</style>

</head>
<body>
	<div id="mydiv" class="card mt-2" style="width: 100%;">
		<div class="card-body">
			<div class="table-responsive custom-font-size">
				<table class="table table-bordered table-striped" id="trainingTable"
					style="font-size: 14px;">
					<!-- Table headers go here -->
					<thead>
						<tr>
							<th>Sl no</th>
							<th>Training Ref Id</th>
							<th>Venue</th>
							<th>Resource Type</th>
							<th>Training Mode</th>
							<th class="module-column">Module</th>
							<th>Training Month</th>
							<th>Training Year</th>
							<th>Training Name</th>
							<th>Description</th>
							<th>Grade</th>
							<th>Agency</th>
							<th>Venue Address</th>
							<th>Map Location</th>
							<th>Coordinator Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th style='display: none;'>State</th>
							<th>District</th>
							<th>Mandal</th>
							<th>Application Start Date</th>
							<th>Application End Date</th>
							<th>Training Start Date</th>
							<th>Training End Date</th>
							<th>Training Start Time</th>
							<th>Training End Time</th>
							<th>Scheduled Budget</th>
							<th style='display: none;'>Account Holder Name</th>
							<th style='display: none;'>Bank Name</th>
							<th style='display: none;'>IFSC Code</th>
							<th >Action</th>
						</tr> 
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			// Execute the function on page load
			// Execute the function on page load
        $('#trainingTable').on('click', '.truncated-cell', function() {
		    var $this = $(this);
		    var title = $this.attr('title');
		    $this.text(title);
		    // Remove click event to prevent multiple clicks
		    $this.removeClass('truncated-cell').removeAttr('title');
		});
			fetchDataAndDisplay();
			$(window).on('scroll', function() {
				var scrollTop = $(this).scrollTop();
				var $filter = $('.dataTables_filter');
				console.log(scrollTop);
				if (scrollTop > 0) {
					$filter.css({
						'position' : 'sticky',
						'top' : '4px',
						'z-index' : '1000',
						'right' : '0px'
					});
				} else {
					$filter.css({
						'position' : 'fixed',
						'top' : '20px',
						'z-index' : '1000',
						'right' : '11px'
					});
				}
			});
		});
 
		function fetchDataAndDisplay() {
 
			$
					.ajax({
 
						type : "GET",
						url : "${pageContext.request.contextPath}/api/get/schedule",
						dataType : "json",
 
						success : function(data) {
 
							displayTrainingData(data);
 
						},
 
						error : function(xhr, status, error) {
 
							console.error("API request error: " + error);
 
							toastr.error("Failed to fetch training data");
 
						}
 
					});
 
		}
 
function displayTrainingData(data) {
			
			// Check if DataTable is initialized on the table
			if ($.fn.DataTable.isDataTable('#trainingTable')) {
			    // Destroy the DataTable
			    $('#trainingTable').DataTable().destroy();
			}
 
			var trainings = data;
 
			trainings.reverse();
 
			var tableBody = $("#trainingTable tbody");
 
			// Clear existing rows
 
			tableBody.empty();
 
			for (var i = 0; i < trainings.length; i++) {
 
				var training = trainings[i];
 
				var row = $("<tr></tr>");
				row.append("<td class='serial-column'>" + (i + 1) + "</td>");
 
				row.append("<td>" + (training.ref_planner_id ? training.ref_planner_id : '') + "</td>");
				row.append("<td>" + (training.venue_id ? training.venue_id : '') + "</td>");
				row.append("<td>" + (training.resourcetype ? training.resourcetype : '') + "</td>");
				row.append("<td>" + (training.tmode ? training.tmode : '') + "</td>");
				row.append("<td class='module-column'>" + (training.tmodule ? training.tmodule : '') + "</td>");
				row.append("<td>" + (training.tmonth ? training.tmonth : '') + "</td>");
				row.append("<td>" + (training.tyear ? training.tyear : '') + "</td>");
				row.append("<td>" + (training.tname ? training.tname : '') + "</td>");
				row.append("<td>" + (training.tdescription ? training.tdescription : '') + "</td>");
				row.append("<td>" + (training.tgrade ? training.tgrade : '') + "</td>");
				row.append("<td>" + (training.tagency ? training.tagency : '') + "</td>");
				row.append("<td>" + (training.vaddress ? training.vaddress : '') + "</td>");
				row.append("<td>" + (training.maplocation ? training.maplocation : '') + "</td>");
				row.append("<td>" + (training.coordinatorname ? training.coordinatorname : '') + "</td>");
				row.append("<td>" + (training.coordinator_email ? training.coordinator_email : '') + "</td>");
				row.append("<td>" + (training.coordinator_mobile ? training.coordinator_mobile : '') + "</td>");
				row.append("<td style='display: none;'>" + (training.tstate ? training.tstate : '') + "</td>");
				row.append("<td>" + (training.tdistrict ? training.tdistrict : '') + "</td>");
				row.append("<td>" + (training.tmandal ? training.tmandal : '') + "</td>");
				row.append("<td>" + (training.apply_start_dt ? training.apply_start_dt : '') + "</td>");
				row.append("<td>" + (training.apply_end_dt ? training.apply_end_dt : '') + "</td>");
				row.append("<td>" + (training.training_start_dt ? training.training_start_dt : '') + "</td>");
				row.append("<td>" + (training.training_end_dt ? training.training_end_dt : '') + "</td>");
				row.append("<td>" + (training.tstarttime ? training.tstarttime : '') + "</td>");
				row.append("<td>" + (training.tendtime ? training.tendtime : '') + "</td>");
				row.append("<td>" + (training.schedulebudget ? training.schedulebudget : '') + "</td>");
 
				row.append("<td style='display: none;'>" + training.accountholdername + "</td>");
				row.append("<td style='display: none;'>" + training.bankname + "</td>");
				row.append("<td style='display: none;'>" + training.ifsccode + "</td>");
 
				row.append("<td><div class='col'><button class='btn btn-primary btn-lg btn-block' onclick='editTraining(\""
					    + training.ref_planner_id + "\", \""
					    + training.venue_id + "\")'>Edit</button></div>&nbsp;<div class='col'><button class='btn btn-danger btn-lg btn-block' onclick='deleteTraining(this, \""
					    + training.ref_planner_id + "\", \""
					    + training.venue_id + "\")'>Delete</button></div></td>");
 
 
				tableBody.append(row);
 
			}
			var dataTable = $('#trainingTable').DataTable({
				"columnDefs": [{
                    "targets": '_all', // Apply to all columns
                    "render": function(data, type, row, meta) {
                        // Check if it's not the second column or the last column
                        if (meta.col < (meta.settings.aoColumns.length - 1)) {
                            if (type === 'display' && data && data.length > 25) {
                                return '<span class="truncated-cell" title="' + data + '">' + data.substr(0, 25) + '...</span>';
                            } else {
                                return data;
                            }
                        } else {
                            return data; // Return full data for the second and last column
                        }
                    }
                }],
				dom : 'lBfrtip',
				buttons : [ {
					extend : 'pdfHtml5',
					orientation : 'landscape', // or 'portrait'
					pageSize : 'A3', // or 'A4', 'A3', etc.
					customize: function(doc) {
			            doc.defaultStyle.fontSize = 9; // Reduce font size
			            // Exclude the last column from the PDF
			             var rows = doc.content[1].table.body;
				            $('#trainingTable').DataTable().rows().every(function(rowIdx, tableLoop, rowLoop) {
				                var rowData = this.data();
				                $(rowData).each(function(colIdx) {
				                	var cellData = rowData[colIdx];
				                	rows[rowIdx + 1][colIdx].text = cellData;
				                });
				            });
			            var rowCount = doc.content[1].table.body.length;
			            for (var i = 0; i < rowCount; i++) {
			                var rowData = doc.content[1].table.body[i];
			                //rowData.splice(1, 1); // Remove the second column
			                rowData.splice(-1, 1); // Remove the last column
			            }
			        }
				}, {
	                extend: 'excelHtml5',
	                exportOptions: {
	                    format: {
	                        body: function(data, row, column, node) {
	                            if (column > 0 && column < row.length - 1 && data.length > 25) {
	                                return row[column];
	                            }
	                            return data;
	                        }
	                    }
	                },
	                customize: function(xlsx) {
	                	var sheet = xlsx.xl.worksheets['sheet1.xml'];
 
	                	// Loop through all columns
	                	$('row', sheet).each(function(index) {
	                		for (var i = 0; i < 4; i++) {
	                            $(this).find('c:last').remove();
	                        }
	                		
	                	    $(this).find('c').each(function() {
	                	        // Get the original text
	                	        var originalText = $(this).find('is t').text();
 
	                	        // Set the cell value to its original text
	                	        // Check if the original text matches the specified pattern
	                	        if (originalText.includes('<span')) {
	                	            // Extract the text inside the title attribute
	                	            var titleText = $(originalText).attr('title');
	                	            // Set the extracted text to the desired element
	                	            $(this).find('is t').text(titleText);
	                	        } else {
	                	            $(this).find('is t').text(originalText);
	                	        }
	                	        // Remove "t" attribute to prevent Excel from treating the cell as a number
	                	        $(this).removeAttr('t');
	                	        
//	                             $(this).attr('r', 'C' + (index + 1));
 
	                	    });
	                	    
 
	                	});
 
	                }
	            } ]
 
			});
			$('.dt-buttons').addClass('btn-group').css({'font-size':'14px','margin-left':'20px','position':'sticky','margin-top':'0px'});
			$('.dataTables_filter').addClass('btn-group').css('font-size',
					'14px');
			$('.buttons-excel, .buttons-pdf').addClass(
					'btn btn-primary btn-blue').css('width', '100px');
			$('.btn-blue').css('background-color', '#63f542');
 
		}
	 
 
		function fun() {
 
			document.getElementById("top").reset();
 
			document.getElementById("middle").reset();
 
		}
 
		function alertbox() {
 
			alert('training scheduled successfully')
 
		}
 
		function deleteTraining(button, tid, vid) {
			var isConfirmed = confirm("Are you sure you want to delete this training?");
 
			// Proceed with deletion only if the user confirms
			if (isConfirmed) {
				var row = $(button).closest('tr');
				// Make an AJAX request to the delete endpoint
 
				$
						.ajax({
							type : "Delete",
							url : "${pageContext.request.contextPath}/api/deleteScheduledTraining",
									data: {
										 ref_planner_id: tid,
										 venue_id: vid
									    },
							success : function(response) {
								var table = $('#trainingTable').DataTable();
								table.row(row).remove().draw(false);
								toastr.success("venue deleted successfully");
								// Reload or update the data after deletion
								fetchDataAndDisplay();
							},
							error : function(xhr, status, error) {
								toastr
										.error("Failed to delete Venue: "
												+ error);
							}
						});
			} else
				return;
		}
	</script>
 
 
 
</body>
</html>
