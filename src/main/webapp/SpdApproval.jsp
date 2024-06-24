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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


<!-- Add this script tag after including Toastr CSS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>

<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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




	<style>
		/* Remove date format from input */
.row1 {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    margin-top: calc(-1* var(--bs-gutter-y));
    margin-right: calc(-0.5* var(--bs-gutter-x));
    margin-left: calc(-0.5* var(--bs-gutter-x));
}

.custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td {
    font-size: 14px;
}
.custom-font-size {
    font-size: 14px !important;
}
.custom-select {
        width: 150px; /* Set a fixed width for the dropdown */
        border: 1px solid #aaa;
	border-radius: 3px;
	padding: 5px;
	background-color: transparent;
    }
		input[type=date]:required:invalid::-webkit-datetime-edit {

			color: transparent;

			font-size: 15px;

		}



		input[type=date]:focus::-webkit-datetime-edit {

			color: black !important;

			font-size: 15px;

		} 
		.custom-card-body {
			background-color: #f8f9fa;
			/* Example background color */
			padding: 15px;
			border-radius: 10px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			width: 350px;
			height: 200px;
			padding: 80px;
			/* Example box shadow */
		}
		.fixed-buttons {
			position: fixed;
			bottom: 20px;
			right: 40%;
			display: flex;
			gap: 10px;
		}
		/* Optional styles for the buttons */
		.fixed-buttons button {
			padding: 10px 20px;
		} 
		body {
			margin: 0;
			font-family: Arial, sans-serif;
		}
		
		#content1 {
			 /* Adjust based on the height of the navigation bar */
			padding: 5px;
		}
		.content1 {
			background-color: #fff;
			border: 1px solid;
			overflow-x: auto;
			font-size: 10px;
			width: 173%;
			/* Add horizontal scroll if needed */
		} 
		.formheading {
			display: flex;
			justify-content: center;
			color: white;
			padding: 10px;
			/* Add padding to the form heading */
		}
		.table-container {
			overflow-x: auto;
			/* Add horizontal scroll if needed */
		}
		table {
			border-collapse: collapse;
		}
		td,
		th {
			border: 1px solid white;
			text-align: left;
			padding: 5px;
		}
		tr:nth-child(even) {
			background-color: #dddddd;
		}
		@media (max-width: 768px) {
			/* Adjust styles for smaller screens */
			.formheading {
				font-size: 18px;
				/* Adjust font size */
			}
	.table-container {
				overflow-x: auto;
			}
			table {
				font-size: 14px;
				/* Adjust font size */
			}
			td,
			th {
				padding: 6px;
				/* Adjust padding */
			}
			.toast-big {
				width: 350px;
				font-size: 16px;
				padding: 20px;
			}
						.fixed-buttons {
			position: fixed;
			bottom: 20px;
			right: 40%;
			display: flex;
			gap: 10px;
		}

		/* Optional styles for the buttons */
		.fixed-buttons button {
			padding: 10px 20px;
		}
		
			
	</style>

	<style>
		.modal {
			display: none;
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.5);
			font-size: 12px;
		}
		.modal-content {
			background-color: #fefefe;
			margin: 15% auto;
			padding: 20px;
			border: 1px solid #888;
			width: 50%;
		}
		.h2{
		 color: #008CBA;
		
		}
	#AdminId th {
	background-color: #008CBA;
	color: #fff;
		font-size: 15px;
	
}
#AdminId th{
{
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 15px;
	
}
}
#AdminId td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 14px;
	
}
 
	 
		.close {
			color: red;
			float: right;
			font-size: 28px;
			font-weight: bold;
			cursor: pointer;
		}
		.close:hover,
		.close:focus {
			color: rgb(233, 15, 15);
			text-decoration: none;
		}
		textarea {
			width: 100%;
		}
		.btn {
			padding: 10px;
			margin-top: 10px;
			margin-right: 5px;
		}
		#new {
			display: flex;
			justify-content: flex-end;
			padding: 10px;
			margin-top: 10px;
		}
		}
		.dataTables_filter {
	position: fixed;
	top: 12%;
	right: 10px;
	z-index: 1000;
}
	 
	</style>
</head>
<body>
	<div id="page-content-wrapper">
		<script>
		jQuery(document).ready(function($) {
			//fetchtname();
				$.ajax({
					type: "GET",
					url: "${pageContext.request.contextPath}/api/getunconfirmeddata",
					dataType: "json",
					success: function (data) {
						displayTrainingData(data);
						showDropdowns(data);  
					},

					error: function (xhr, status, error) {

						console.error("API request error: " + error);
					}
				});
				
				toastr.options = {
						"positionClass" : "toast-top-right",
						"showDuration" : "300",
						"hideDuration" : "1000",
						"timeOut" : "5000",
						"extendedTimeOut" : "1000",
					};
				
				
				$('#tnamesbar').on('change', function() {
			        // Retrieve the selected value from the dropdown
//			         $('#vnamesbar').empty();
//			 		$('#distbar').empty();
//			 		$('#desgbar').empty();
			        var selectedValue = $(this).val();
			        
//			         var selectedOptionId = $(this).find(':selected').attr('id');
//			         if (selectedOptionId === "selectalltraining") {
//			         	$.ajax({
//			                 type: "GET",
//			                 url: '${pageContext.request.contextPath}/api/self-attended',
//			                 dataType: "json",
//			                 success: function (response) {
//			                     // Display the response on the console
//			                     console.log("API response:", response);
//			                     // Display training data in the table
//			                     displayTrainingData(response);
//			                     //showDropdowns(response);
			                     
//			                 },
//			                 error: function (xhr, status, error) {
//			                     console.error("API request error: " + error);
//			                 }
//			             });
//			         }
					
					
//			 		$('#vnamesbar').append($('<option>', {
//			 	        value: '',
//			 	        text: 'Select Venue',
//			 	        disabled: true,
//			 	        selected: true
//			 	    }));

//			 	    $('#distbar').append($('<option>', {
//			 	        value: '',
//			 	        text: 'Select District',
//			 	        disabled: true,
//			 	        selected: true
//			 	    }));

//			 	    $('#desgbar').append($('<option>', {
//			 	        value: '',
//			 	        text: 'Select Designation',
//			 	        disabled: true,
//			 	        selected: true
//			 	    }));
				    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());
			        // Call another API using AJAX
//			         $.ajax({
//			             url: '${pageContext.request.contextPath}/api/mytrainings/tnamedata',
//			             method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			             data: { ref_planner_id: selectedValue, appliedtype: 'self' },
//			             success: function(response) {
//			                 // Handle the successful response from the API
//			                 console.log(response);
//			                 appendData(response);
//			                 $('#admintid_length').detach();

//			 		        // Move the DataTables filter element to #sbar
//			 		        $('#admintid_filter').detach();

//			                 displayTrainingData(response);
			               
//			                 // You can perform further actions here based on the response
//			             },
//			             error: function(xhr, status, error) {
//			                 // Handle any errors that occur during the API call
//			                 console.error(status, error);
//			             }
//			         });
			    });
				
			    
			    
				
				$('#vnamesbar').on('change', function() {
					var uniqueDistricts = [];
					var selectedTname = $('#tnamesbar').val();
					var selectedValue = $(this).val();
					//$('#distbar').empty();
//			 		 $('#distbar').append($('<option>', {
//			 		        value: '',
//			 		        text: 'Select District',
//			 		        disabled: true,
//			 		        selected: true
//			 		 }));
					 
				    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

					 
//			 		 if (selectedTname !== null && selectedTname !== '') {
//			 		 $.ajax({
//			 	            url: '${pageContext.request.contextPath}/api/mytrainings/tnamevenuedistrics',
//			 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			 	            data: { vid: selectedValue }, // Pass any data needed for the API call
//			 	            success: function(response) {
//			 	            	console.log(response);
//			 	                 response.forEach(function(item) {
//			 	                	 if (item !== null && !uniqueDistricts.includes(item.trim())) {
//			 	                		 uniqueDistricts.push(item.trim());
//			 	                	        $('#distbar').append($('<option>', {
//			 	                	            value: item.trim(),
//			 	                	            text: item.trim()
//			 	                	        }));
//			 	                	    }
//			 						}); 
				               
//			 	                // You can perform further actions here based on the response
//			 	            },
//			 	            error: function(xhr, status, error) {
//			 	                // Handle any errors that occur during the API call
//			 	                console.error(status, error);
//			 	            }
//			 	        });
					 
//			 		 $.ajax({
//			 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevname',
//			 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			 	            data: { ref_planner_id: $('#tnamesbar').val(),
//			 	                vid: selectedValue,
//			 	                appliedtype: 'self' 
//			                 }, // Pass any data needed for the API call
//			 	            success: function(response) {
//			 	            	console.log(response);
//			 	            	 $('#admintid_length').detach();

//			 	 		        // Move the DataTables filter element to #sbar
//			 	 		        $('#admintid_filter').detach();
//			 	                displayTrainingData(response);
//			 	            },
//			 	            error: function(xhr, status, error) {
//			 	                // Handle any errors that occur during the API call
//			 	                console.error(status, error);
//			 	            }
//			 	        });
//			 		 }else {
//			 			 $.ajax({
//			 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbyvname',
//			 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			 	            data: { vid: selectedValue,
//			 	                appliedtype: 'self' 
//			                 }, // Pass any data needed for the API call
//			 	            success: function(response) {
//			 	            	console.log(response);
//			 	            	 $('#admintid_length').detach();

//			 	 		        // Move the DataTables filter element to #sbar
//			 	 		        $('#admintid_filter').detach();
//			 	                displayTrainingData(response);
//			 	            },
//			 	            error: function(xhr, status, error) {
//			 	                // Handle any errors that occur during the API call
//			 	                console.error(status, error);
//			 	            }
//			 	        });
//			 		 }
					
				});
				
				
				$('#distbar').on('change', function() {
			        // Retrieve the selected value from the dropdown
			        var selectedValue = $(this).val();
			        var selectedTname = $('#tnamesbar').val();
			        var selectedVname = $('#vnamesbar').val();
			        //$('.appended-option').show();
			   	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

			        
			        
			     // Call another API using AJAX
//			          if (selectedTname !== null && selectedTname !== '' && selectedVname !== null && selectedVname !== '') {

//			 	        $.ajax({
//			 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevnamedist',
//			 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			 	            data: { ref_planner_id: $('#tnamesbar').val(),
//			 	                vid: $('#vnamesbar').val(),
//			 	                district_name : selectedValue,
//			 	                appliedtype: 'self' 
//			 	            }, // Pass any data needed for the API call
//			 	            success: function(response) {
//			 	            	console.log(response);
//			 	            	 $('#admintid_length').detach();
				
//			 	 		        // Move the DataTables filter element to #sbar
//			 	 		        $('#admintid_filter').detach();
//			 	                displayTrainingData(response);
//			 	            },
//			 	            error: function(xhr, status, error) {
//			 	                // Handle any errors that occur during the API call
//			 	                console.error(status, error);
//			 	            }
//			 	        });
//			          }else{
//			         	 $.ajax({
//			  	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydistrict',
//			  	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			  	            data: {
//			  	                district_name : selectedValue,
//			  	                appliedtype: 'self' 
//			  	            }, // Pass any data needed for the API call
//			  	            success: function(response) {
//			  	            	console.log(response);
//			  	            	 $('#admintid_length').detach();
			 	
//			  	 		        // Move the DataTables filter element to #sbar
//			  	 		        $('#admintid_filter').detach();
//			  	                displayTrainingData(response);
//			  	            },
//			  	            error: function(xhr, status, error) {
//			  	                // Handle any errors that occur during the API call
//			  	                console.error(status, error);
//			  	            }
//			  	        });
//			          }
				});
				
				$('#desgbar').on('change', function() {
			        // Retrieve the selected value from the dropdown
			        var selectedValue = $(this).val() !== null ? $(this).val() : 'null';
			        var selectedTname = $('#tnamesbar').val();
			        var selectedVname = $('#vnamesbar').val();
			        var selectedDist = $('#distbar').val();
			        
			   	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

			        
			     // Call another API using AJAX
//			      if (selectedTname && selectedVname && selectedDist) {
//			         $.ajax({
//			             url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevnamedistdesg',
//			             method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			             data: { ref_planner_id: $('#tnamesbar').val(),
//			                 vid: $('#vnamesbar').val(),
//			                 district_name : $('#distbar').val(),
//			                 designation : selectedValue,
//			                 appliedtype: 'self' 
//			             }, // Pass any data needed for the API call
//			             success: function(response) {
//			             	console.log(response);
//			             	 $('#admintid_length').detach();

//			  		        // Move the DataTables filter element to #sbar
//			  		        $('#admintid_filter').detach();
//			                 displayTrainingData(response);
//			             },
//			             error: function(xhr, status, error) {
//			                 // Handle any errors that occur during the API call
//			                 console.error(status, error);
//			             }
//			         });
//			      }else{
//			     	 $.ajax({
//			              url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydesignation',
//			              method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//			              data: {
//			                  designation : selectedValue,
//			                  appliedtype: 'self' 
//			              }, // Pass any data needed for the API call
//			              success: function(response) {
//			              	console.log(response);
//			              	 $('#admintid_length').detach();

//			   		        // Move the DataTables filter element to #sbar
//			   		        $('#admintid_filter').detach();
//			                  displayTrainingData(response);
//			              },
//			              error: function(xhr, status, error) {
//			                  // Handle any errors that occur during the API call
//			                  console.error(status, error);
//			              }
//			          });
//			      }
				});
				
				$('#selectAllCheckbox').change(function() {
			        var isChecked = $(this).prop('checked');
			        $('.approveCheckbox:visible').prop('checked', isChecked);
			    });

			    // Handle individual checkboxes
			    $('.approveCheckbox').change(function() {
			        var allChecked = true;
			        $('.approveCheckbox:visible').each(function() {
			            if (!$(this).prop('checked')) {
			                allChecked = false;
			            }
			        });
			        $('#selectAllCheckbox').prop('checked', allChecked);
			    });
			   
			   $('#searchselected').on('click', function() {
		        	searchTraining();
				});

			// Execute the function on page load
	        $('#AdminId').on('click', '.truncated-cell', function() {
			    var $this = $(this);
			    var title = $this.attr('title');
			    $this.text(title);
			    // Remove click event to prevent multiple clicks
			    $this.removeClass('truncated-cell').removeAttr('title');
			});
			
			
	 
				 function searchApi(tnamesbar,vnamesbar,distbar,desgbar){
		               	$.ajax({
// 		                       url: '${pageContext.request.contextPath}/api/mytrainings/filterbasedonchange',
		                       method: 'GET', // Specify the HTTP method (GET, POST, etc.)
		                       data: { 
		                           ref_planner_id: $('#tnamesbar').val(),
		                           vid: $('#vnamesbar').val(),
		                           district_name: $('#distbar').val(),
		                           designation: $('#desgbar').val(),
		                           status:'rejected',
		                           appliedtype: ''
		                       },
		                       success: function(response) {
		                           console.log(response);
		                           
		                           $('#admintid_length').detach();
		           		        // Move the DataTables filter element to #sbar
		           		        $('#admintid_filter').detach();

		                           displayTrainingData(response);
		                          
		                           // You can perform further actions here based on the response
		                       },
		                       error: function(xhr, status, error) {
		                           // Handle any errors that occur during the API call
		                           console.error(status, error);
		                       }
		                   });
		               }
	               
				 function showDropdowns(data) {
		       			console.log(data);
		       			$('#tnamesbar').prepend($('<option>', {
		       		        value: '',
		       		        text: 'Select Training',
		       		        disabled: true,
		       		        selected: true
		       		    }));

		       		    $('#vnamesbar').prepend($('<option>', {
		       		        value: '',
		       		        text: 'Select Venue',
		       		        disabled: true,
		       		        selected: true
		       		    }));

		       		    $('#distbar').prepend($('<option>', {
		       		        value: '',
		       		        text: 'Select District',
		       		        disabled: true,
		       		        selected: true
		       		    }));

		       		    $('#desgbar').prepend($('<option>', {
		       		        value: '',
		       		        text: 'Select Designation',
		       		        disabled: true,
		       		        selected: true
		       		    }));

		       		    var uniqueTnames = [];
		       		    var uniqueVnames = [];
		       		    var uniqueDists = [];
		       		    var uniqueDesgs = [];
		       		    

		       		    var tnameNullAppended = false;
		       		    var vnameNullAppended = false;
		       		    var distNullAppended = false;
		       		    var desgNullAppended = false;
		       		   
		       		    data.forEach(function(item) {
		       		    
		       		        // Append unique training names to #tnamesbar
		       		        if (item.tname !== null && !uniqueTnames.includes(item.tname)) {
		       			        uniqueTnames.push(item.tname);
		       			        $('#tnamesbar').append($('<option>', {
		       			            value: item.refplannerid,
		       			            text: item.tname
		       			        }));
		       			    } else if (item.tname === null && !tnameNullAppended) {
		       			        // Append null option to #tnamesbar if tname is null and null option is not yet appended
		       			        $('#tnamesbar').append($('<option>', {
		       			            value: '',
		       			            text: 'null'
		       			        }));
		       			        tnameNullAppended = true; // Set the flag to true after appending null option
		       			    }
		       		        
		       		        
		       		        // Append unique values to #vnamesbar
		       		        if (item.preferdlocation !== null && !uniqueVnames.includes(item.preferdlocation)) {
		       		            uniqueVnames.push(item.preferdlocation);
		       		            $('#vnamesbar').append($('<option>', {
		       		                value: item.preferdlocation,
		       		                text: item.preferdlocation
		       		            }));
		       		        } else if (item.vname === null && !vnameNullAppended) {
		       		            $('#vnamesbar').append($('<option>', {
		       		                value: '',
		       		                text: 'null'
		       		            }));
		       		            vnameNullAppended = true;
		       		        }
		       		        
		       		        
		       		        // Append unique values to #distbar
		       		        if (item.district_name !== null && !uniqueDists.includes(item.district_name)) {
		       		            uniqueDists.push(item.district_name);
		       		            $('#distbar').append($('<option>', {
		       		                value: item.district_name,
		       		                text: item.district_name
		       		            }));
		       		        } else if (item.district_name === null && !distNullAppended) {
		       		            $('#distbar').append($('<option>', {
		       		                value: '',
		       		                text: 'null'
		       		            }));
		       		            distNullAppended = true;
		       		        }
		       		        
		       		        
		       		        // Append unique values to #desgbar
		       		        if (item.designation !== null && !uniqueDesgs.includes(item.designation)) {
		       		            uniqueDesgs.push(item.designation);
		       		            $('#desgbar').append($('<option>', {
		       		                value: item.designation,
		       		                text: item.designation
		       		            }));
		       		        } else if (item.designation === null && !desgNullAppended) {
		       		            $('#desgbar').append($('<option>', {
		       		                value: '',
		       		                text: 'null'
		       		            }));
		       		            desgNullAppended = true;
		       		        }
		       		       
		       		    });
		       		}
	               

				
				function displayTrainingData(data) {
					
					if ($.fn.DataTable.isDataTable('#AdminId')) {
					    // Destroy the DataTable
					    $('#AdminId').DataTable().destroy();
					    $('#length').detach(); // Detach element with ID 'length'
					    $('#sbar').detach();
					}
					var tableBody = $("#AdminId tbody");
					// Clear existing rows
					tableBody.empty();
					console.log
					for (var i = 0; i < data.length; i++) {
						var training = data[i];
						//console.log(training.treasuryid);
						var row = $("<tr></tr>");
		                row.append("<td class='serial-column'>" + (i + 1) + "</td>");
						row.append('<td><input type="checkbox" class="approveCheckbox"  data-ref_planner_id="' + training.refplannerid + '" data-preferdlocation="' + (training.preferdlocation).trim() + '"></td>');
						row.append("<td>" + training.refplannerid + "</td>");
		                row.append("<td>" + training.tsubject + "</td>");
		                row.append("<td>" + training.tcategory + "</td>");
		                row.append("<td>" + training.tmode + "</td>");
		                row.append("<td>" + training.ttargetgroup + "</td>");
		                row.append("<td>" + training.tmonth + "</td>");
		                row.append("<td>" + training.tyear + "</td>");
		                row.append("<td>" + training.tname + "</td>");
		                row.append("<td>" + training.tdescription + "</td>");
		                row.append("<td>" + training.tgrade + "</td>");
		                row.append("<td>" + training.tagency + "</td>");
		                row.append("<td>" + training.tspell + "</td>");
		                row.append("<td>" + training.preferdlocation + "</td>");
		                row.append("<td>" + training.numberofstakeholder + "</td>");
		                row.append("<td>" + training.numberdayneeded + "</td>");
		                row.append("<td>" + training.thoursperday + "</td>");
		                row.append("<td>" + training.totalhours + "</td>");
		                row.append("<td>" + training.trainingregstartdt + "</td>");
		                row.append("<td>" + training.trainingregenddt + "</td>");
		                row.append("<td>" + training.tstatus + "</td>");

						tableBody.append(row);
					}
					   // Your existing DataTable initialization code
	                   var dataTable = $('#AdminId').DataTable({
	                	   "columnDefs": [{
	                           "targets": '_all', // Apply to all columns
	                           "render": function(data, type, row, meta) {
	                               // Check if it's not the second column or the last column
	                               if (meta.col !== 1) {
	                                   if (type === 'display' && data && data.length > 25) {
	                                       return '<span class="truncated-cell" title="' + data + '">' + data.substr(0, 21) + '...</span>';
	                                   } else {
	                                       return data;
	                                   }
	                               } else {
	                                   return data; // Return full data for the second and last column
	                               }
	                           }
	                       }],
	            dom: 'lBfrtip',
	            buttons: [
	                {
	                    extend: 'pdfHtml5',
	                    orientation: 'landscape', // or 'portrait'
	                    pageSize: 'A3', // or 'A4', 'A3', etc.
	                },
	                 'excel'
	            ]
	        });
	 
	                   $('.dataTables_filter').addClass('btn-group').css({'font-size':
	       				'14px', 'margin-top':'10px'});
	       			$('.dataTables_length').css({'font-size':
	       				'14px', 'margin-top':'10px'});
	                   $('.dt-buttons').addClass('btn-group').css({'font-size':
	          				'14px', 'margin-left':'25px'});
	                   $('.buttons-excel, .buttons-pdf').addClass('btn btn-primary btn-blue').css('width', '100px');
	                   $('.btn-blue').css('background-color', '#63f542');
	               }
	        
	       
	           });
		
		  
		  function previoustrainings(tid) {
				window.location.href = "${pageContext.request.contextPath}/TrainingInformation.jsp?treasuryId="+ tid;
		}
		</script>


		
		<div class="maindiv">
			<div class="content1">
				<div class="formheading">
					<h1 class="h2">Waiting For Spd Approval</h1>
				</div>
				 <div class="row1 custom-font-size" id="row2">
    <div id="selectall" class="col-md-2 custom-font-size" style="margin-top: 20px; text-align: left;">
        <label for="selectAllCheckbox">
            <input type="checkbox" id="selectAllCheckbox"> Select All
        </label>
    </div>
    <div id="tsbar" class="col-md-2 custom-font-size" style="margin-top: 5px;">
        <label for="tnamesbar">Training Name</label>
            <select id="tnamesbar" class="custom-select"><option id="selectalltraining" value="null">Select All Training</option></select>
   </div>
    <div id="vsbar" class="col-md-2 custom-font-size" style="margin-top: 5px;">
        <label for="vnamesbar">Venue Name</label>
            <select id="vnamesbar" class="custom-select"><option id="selectallvenue" value="null">Select All Venue</option></select>
    </div>
<!--     <div id="dist" class="col-md-2 custom-font-size" style="margin-top: 5px;"> -->
<!--         <label for="distbar">District</label> -->
<!--             <select id="distbar" class="custom-select"><option id="selectalldistrict" value="null">Select All District</option></select> -->
<!--     </div> -->
<!--     <div id="desg" class="col-md-3 custom-font-size" style="margin-top: 5px;"> -->
<!--         <label for="desgbar">Designation</label> -->
<!--             <select id="desgbar" class="custom-select"><option id="selectalldesignation" value="null">Select All Designation</option></select> -->
<!--     </div> -->
    
</div>
				<div class="table-container">
					<table id="AdminId">
						<thead>
							<tr>
								<th>Sl No</th>
								<th>Action</th>
								<th>Training Ref Id</th>
								<th>Training Subject</th>
								<th>Training Category</th>
								<th>Training Mode</th>
								<th>Target Group</th>
								<th>Training Month</th>
								<th>Training Year</th>
								<th>Training Name</th>
								<th>Description</th>
								<th>Grade</th>
								<th>Agency</th>
								<th>Training Spell</th>
								<th>Venue Location</th>
								<th>No. Of Stakeholders</th>
								<th>No. Of Day Needed</th>
								<th>Hours per Day</th>
								<th>Total Hours</th>
								<th>Tentative Start Date</th>
								<th>Tentative End Date</th>
								<th>Training Status</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div style="text-align: center; display: flex; justify-content: right; margin-bottom:20px">
			<button class="btn" id="approveButton" style="font-size: 14px;background-color: green;color: white;" onclick="approveTraining()">Approve</button>
			<button class="btn custom-font-size btn-danger" id="cancelButton" onclick="showRejectModal()">Reject</button>
		</div>
			</div>
		</div>
		 
		 <div id="rejectModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeRejectModal()">&times;</span>
            <label for="rejectReason">Reason for Rejection:</label>
            <textarea id="rejectReason" name="rejectReason" rows="4" cols="50" required></textarea><br>
            <div id="new">
               <!--   <button class="btn btn-danger" onclick="rejectTraining()">Cancel</button>  -->
                <button id="submitRejectButton" class="btn btn-danger" onclick="submitFormWithValidation()">Submit</button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Your existing script -->
    <script>
    toastr.options = {
        "positionClass" : "toast-top-right",
        "showDuration" : "300",
        "hideDuration" : "1000",
        "timeOut" : "5000",
        "extendedTimeOut" : "1000",
    };
 
    function showRejectModal() {
        var selectedCheckboxes = $('.approveCheckbox:checked');
 
        if (selectedCheckboxes.length > 0) {
            var selectedCheckbox = selectedCheckboxes.first();
            var refPlannerIds = selectedCheckbox.attr('data-ref_planner_id');
            var preferdlocation = selectedCheckbox.attr('data-preferdlocation');
            
            console.log(refPlannerIds);
            console.log(preferdlocation);
 
            // Set the selected details in the modal
            $('#rejectReason').val('');
            $('#rejectModal').attr('data-ref_planner_id', refPlannerIds);
            $('#rejectModal').attr('data-preferdlocation', preferdlocation);
 
            document.getElementById('rejectModal').style.display = 'block';
        } else {
            console.log('No checkbox selected');
            toastr.warning('Please Select A Checkbox');
        }
    }
 
    function closeRejectModal() {
        document.getElementById('rejectModal').style.display = 'none';
    }
 
    function cancelReject() {
        closeRejectModal();
    }
    
    function approveTraining() {
		toastr.options = {
			"positionClass" : "toast-top-right",
			"showDuration" : "300",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
		};
		var selectedCheckboxes = $('.approveCheckbox:checked');

		if (selectedCheckboxes.length > 0) {
			selectedCheckboxes.each(function() {
				var refplannerid = $(this).attr('data-ref_planner_id');
				var preferdlocation = $(this).attr('data-preferdlocation');
				//console.log(refPlannerId);

				$.ajax({
					type : 'PUT',
					url : '${pageContext.request.contextPath}/api/updatetrainingstatus',
					data : {
						refplannerid : refplannerid,
						preferdlocation : preferdlocation
					},
					success : function(response) {
						console.log('Status updated successfully:',
								response);
						toastr.success('Training Calender Approved Successfully');

						setTimeout(function() {
							window.location.href = '${pageContext.request.contextPath}/SpdApproval.jsp'; // Replace with your target page
						}, 1000);
					},
					error : function(error) {
						console.error('Error updating status:', error);
						toastr.error('Error for training status');

					}
				});
			});
		} else {
			console.log('No checkbox selected');
			toastr.warning('Please select a training to update status');
		}
	}
 
 
    function submitFormWithValidation() {
        var refPlannerIds = $('#rejectModal').attr('data-ref_planner_id');
        var preferdlocation = $('#rejectModal').attr('data-preferdlocation');
        console.log(refPlannerIds);
        var remarks = $('#rejectReason').val();
 
        $.ajax({
            type: 'PUT',
            url: '${pageContext.request.contextPath}/api/remarksupdate',
            data: {
                refplannerid: refPlannerIds,
                preferdlocation: preferdlocation,
                remarks: remarks
            },
            success: function(response) {
                console.log('Training Rejected Successfully:', response);
                toastr.success('Training Rejected Successfully');
 
                closeRejectModal();
 
                setTimeout(function() {
                    window.location.href = '${pageContext.request.contextPath}/SpdApproval.jsp';
                }, 1000);
            },
            error: function(error) {
                console.error('Error For Training Rejected:', error);
                toastr.error('Error For Training Rejected');
            }
        });
    }
    </script>
		<!-- Bootstrap core JS-->

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->

		<script src="js/scripts.js"></script>
</body>

</html>