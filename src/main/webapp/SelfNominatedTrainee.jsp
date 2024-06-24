<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Add this in the head section of your HTML file -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 
    <!-- Your Custom Styles -->
    <link href="css/styles.css" rel="stylesheet" />
    
</head>
 
 
<!--    <style type="text/css">
body {
    font-size: 14px; /* Adjust the size as needed */
}
form {
  font-size: 14px;
}
 
.form-control {
  font-size: 14px;
  padding: 5px;
  border: 1px solid #ccc;
}
 
</style> -->
 
 
<style>
/* Remove date format from input */
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
 
.maindiv {
	width: 100%;
	padding: 20px;
	display: flex;
	justify-content: space-between;
}
 
.content {
	background-color: #fff;
	border: 1px solid;
	overflow-x: auto;
	font-size: 10px;
	width: 100%;
	/* Add horizontal scroll if needed */
}
  .custom-select {
        width: 150px; /* Set a fixed width for the dropdown */
        border: 1px solid #aaa;
	border-radius: 3px;
	padding: 5px;
	background-color: transparent;
    }
.formheading {
	justify-content: left;
	/* 	background-image: linear-gradient(to top, #0077BD, #8AC6D1); */
	
	padding: 4px;
	/* Add padding to the form heading */
}
 
.maindiv2 {
	width: 100%;
	padding: 20px;
	display: flex;
	justify-content: space-between;
}
 
.table-container {
	overflow-x: auto;
	/* Add horizontal scroll if needed */
}
 
table {
	border-collapse: collapse;
}
 
td, th {
	border: 1px solid black;
	text-align: left;
	padding: 5px;
}
 
tr:nth-child(even) {
	background-color: #dddddd;
}

.btn-group {
  font-size: 14px;
}

.dataTables_filter {
  font-size: 14px;
}

.buttons-excel,
.buttons-pdf {
  width: 100px;
}

.btn-primary.btn-blue {
  background-color: #63f542;
}

.dataTables_length {
  margin-top: 15px;
}
.custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td {
    font-size: 14px;
}
.custom-font-size {
    font-size: 14px !important;
}
#length{
width: 200px;
    margin-top: 15px;
}
#buttonss{
width: 250px; margin-top: 10px;
}
 #sbar{ 
 width: 300px; left: 310px; margin-top: 20px;
 } 
 
@media (max-width: 768px) and (min-width: 426px){
.main-content {
    float: left;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
    padding-left: 155px;
    padding-top: 60px;
}
  .dataTables_length,
  .dt-buttons .buttons-excel,
  .dt-buttons .buttons-pdf,
  .custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td,
  .dataTables_filter input {
    font-size: 11px;
    padding: 2px;
    
  }
  .custom-font-size {
    font-size: 11px !important;
}
#admintid td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 11px;
	
}
 
#admintid th {
	background-color: #008CBA;
	color: #fff;
		font-size: 11px;
	
}
 

  #length{
  width: 140px;
  margin-top: 0px;
  }
  .dataTables_length {
    margin-bottom: 5px;
  }

  .dt-buttons {
    display: flex;
    justify-content: center;
    width: 120px;
  }

  .dt-buttons .btn {
    margin: 2px;
  }
  #buttonss{
width: 150px; margin-top: 10px;
}

 #sbar{ 
font-size: 11px; width: -1px; text-align:right; margin-top: -35px;
 }
 .dataTables_filter { 
  font-size: 11px;  
 }

}

@media (min-width: 376px) and (max-width: 425px)  {
.main-content {
    float: left;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
    padding-left: 100px;
    padding-top: 40px;
}

  .dataTables_length,
  .dt-buttons .buttons-excel,
  .dt-buttons .buttons-pdf,
  .custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td,
  .dataTables_filter input {
    font-size: 11px;
    padding: 0px;
    
  }
.custom-font-size {
    font-size: 11px !important;
}
#admintid td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 11px;
	
}
 
#admintid th {
	background-color: #008CBA;
	color: #fff;
		font-size: 11px;
	
}
 

  #length{
  width: 140px;
  margin-top: 0px;
  }
  .dataTables_length {
    margin-bottom: 5px;
  }

  .dt-buttons {
    display: flex;
    justify-content: right;
    width: 120px;
  }

  .dt-buttons .btn {
    margin: 2px;
  }
  #buttonss{
width: 150px; margin-top: 10px;
}

 #sbar{ 
font-size: 11px; width: -1px; text-align:left; margin-top:0px;
 }
 .dataTables_filter { 
  font-size: 11px;  
 }
}

@media (max-width: 320px) and (min-width: 0px){
.main-content {
    float: left;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
    padding-left: 100px;
    padding-top: 40px;
}

  .dataTables_length,
  .dt-buttons .buttons-excel,
  .dt-buttons .buttons-pdf,
  .custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td,
  .dataTables_filter input {
    font-size: 11px;
    padding: 0px;
    
  }
.custom-font-size {
    font-size: 11px !important;
}
#admintid td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 11px;
	
}
 
#admintid th {
	background-color: #008CBA;
	color: #fff;
		font-size: 11px;
	
}
 

  #length{
  width: 140px;
  margin-top: 0px;
  }
  .dataTables_length {
    margin-bottom: 5px;
  }

  .dt-buttons {
    display: flex;
    justify-content: center;
    width: 80px;
  }

  .dt-buttons .btn {
    margin: 2px;
  }
  .row {
	  #buttonss{
		width: 95px; margin-top: 10px; text-align: right;
	}
  }

 #sbar{ 
font-size: 11px; width: 295px; left: -40px; margin-top:0px;
 }
 .dataTables_filter { 
  font-size: 11px;  
 }
}




</style>
<style>
<
style>.modal {
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
	font-size: 14px;
}
 
.close {
	color: red;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}
 
.close:hover, .close:focus {
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
	font-size: 14px;
}
 
#new {
	display: flex;
	justify-content: flex-end;
	padding: 10px;
	margin-top: 10px;
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
}
</style>
<style>
.table-container {
	margin-top: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
}
 
.table-responsive {
	overflow-x: auto;
}
 
#admintid {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 0;
}
 


 #admintid td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	
}
 
#admintid th {
	background-color: #008CBA;
	color: #fff;
		border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	
}
 
#admintid tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}
 
#admintid tbody tr:hover {
	background-color: #ddd;
}
 
#selfButton {
	font-size: 16px;
	margin-left: 40%;
}
 
#selfButton label {
	margin-right: 10px;
	/* Optional: Adjust spacing between radio buttons and labels */
}
.dataTables_filter input {
	border: 1px solid #aaa;
	border-radius: 3px;
	padding: 5px;
	background-color: transparent;
	color: inherit;
	margin-left: 3px;
}
</style>
</head>
 
<body>
<script>
jQuery(document).ready(function($) {
	
    // Add a click event listener to the "Self" button
    // Execute the function on page load
    
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
			// Handle input events on the search bar
			$("#searchBar").on("input", function() {
				var searchText = $(this).val().toLowerCase();
				filterTableRows(searchText);
			});

    
    	$("#searchBar1").on("input", function() {
			var searchText = $(this).val().toLowerCase();
			filterTableRows(searchText);
		});
    
    	$('#admintid').on('click', '.truncated-cell', function() {
		    var $this = $(this);
		    var title = $this.attr('title');
		    var text = $this.text();
		
		    // Check if the text is truncated
		    if (text === title) {
		        // Check if text exceeds 25 characters
		        if (text.length > 25) {
		            // Truncate text and add three dots
		            $this.text(text.substring(0, 20) + '...'); // Adjust as needed
		        }
		    } else {
		        // Restore original text
		        $this.text(title);
		    }
		    
        });
    
        $('#searchselected').on('click', function() {
        	searchTraining();
		});
        
    $("#selfRadio").click(function () {
        var apiEndpoint = "${pageContext.request.contextPath}/api/self-attended";
        fetchDataAndDownload(apiEndpoint, "SelfData");
        window.location.href = "${pageContext.request.contextPath}/Admin_approval.jsp";
    });
 
    // Add a click event listener to the "Nominate" button
    $("#nominateRadio").click(function () {
        var apiEndpoint = "${pageContext.request.contextPath}/api/nominate/training";
        fetchDataAndDownload(apiEndpoint, "NominateData");
       
    });
    
    
    $('#tnamesbar').on('change', function() {
        // Retrieve the selected value from the dropdown
//         $('#vnamesbar').empty();
// 		$('#distbar').empty();
// 		$('#desgbar').empty();
        var selectedValue = $(this).val();
        
//         var selectedOptionId = $(this).find(':selected').attr('id');
//         if (selectedOptionId === "selectalltraining") {
//         	$.ajax({
//                 type: "GET",
//                 url: '${pageContext.request.contextPath}/api/self-attended',
//                 dataType: "json",
//                 success: function (response) {
//                     // Display the response on the console
//                     console.log("API response:", response);
//                     // Display training data in the table
//                     displayTrainingData(response);
//                     //showDropdowns(response);
                     
//                 },
//                 error: function (xhr, status, error) {
//                     console.error("API request error: " + error);
//                 }
//             });
//         }
		
		
// 		$('#vnamesbar').append($('<option>', {
// 	        value: '',
// 	        text: 'Select Venue',
// 	        disabled: true,
// 	        selected: true
// 	    }));

// 	    $('#distbar').append($('<option>', {
// 	        value: '',
// 	        text: 'Select District',
// 	        disabled: true,
// 	        selected: true
// 	    }));

// 	    $('#desgbar').append($('<option>', {
// 	        value: '',
// 	        text: 'Select Designation',
// 	        disabled: true,
// 	        selected: true
// 	    }));
	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());
        // Call another API using AJAX
//         $.ajax({
//             url: '${pageContext.request.contextPath}/api/mytrainings/tnamedata',
//             method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//             data: { ref_planner_id: selectedValue, appliedtype: 'self' },
//             success: function(response) {
//                 // Handle the successful response from the API
//                 console.log(response);
//                 appendData(response);
//                 $('#admintid_length').detach();

// 		        // Move the DataTables filter element to #sbar
// 		        $('#admintid_filter').detach();

//                 displayTrainingData(response);
               
//                 // You can perform further actions here based on the response
//             },
//             error: function(xhr, status, error) {
//                 // Handle any errors that occur during the API call
//                 console.error(status, error);
//             }
//         });
    });
	
    
    
	
	$('#vnamesbar').on('change', function() {
		var uniqueDistricts = [];
		var selectedTname = $('#tnamesbar').val();
		var selectedValue = $(this).val();
		//$('#distbar').empty();
// 		 $('#distbar').append($('<option>', {
// 		        value: '',
// 		        text: 'Select District',
// 		        disabled: true,
// 		        selected: true
// 		 }));
		 
	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

		 
// 		 if (selectedTname !== null && selectedTname !== '') {
// 		 $.ajax({
// 	            url: '${pageContext.request.contextPath}/api/mytrainings/tnamevenuedistrics',
// 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
// 	            data: { vid: selectedValue }, // Pass any data needed for the API call
// 	            success: function(response) {
// 	            	console.log(response);
// 	                 response.forEach(function(item) {
// 	                	 if (item !== null && !uniqueDistricts.includes(item.trim())) {
// 	                		 uniqueDistricts.push(item.trim());
// 	                	        $('#distbar').append($('<option>', {
// 	                	            value: item.trim(),
// 	                	            text: item.trim()
// 	                	        }));
// 	                	    }
// 						}); 
	               
// 	                // You can perform further actions here based on the response
// 	            },
// 	            error: function(xhr, status, error) {
// 	                // Handle any errors that occur during the API call
// 	                console.error(status, error);
// 	            }
// 	        });
		 
// 		 $.ajax({
// 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevname',
// 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
// 	            data: { ref_planner_id: $('#tnamesbar').val(),
// 	                vid: selectedValue,
// 	                appliedtype: 'self' 
//                 }, // Pass any data needed for the API call
// 	            success: function(response) {
// 	            	console.log(response);
// 	            	 $('#admintid_length').detach();

// 	 		        // Move the DataTables filter element to #sbar
// 	 		        $('#admintid_filter').detach();
// 	                displayTrainingData(response);
// 	            },
// 	            error: function(xhr, status, error) {
// 	                // Handle any errors that occur during the API call
// 	                console.error(status, error);
// 	            }
// 	        });
// 		 }else {
// 			 $.ajax({
// 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbyvname',
// 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
// 	            data: { vid: selectedValue,
// 	                appliedtype: 'self' 
//                 }, // Pass any data needed for the API call
// 	            success: function(response) {
// 	            	console.log(response);
// 	            	 $('#admintid_length').detach();

// 	 		        // Move the DataTables filter element to #sbar
// 	 		        $('#admintid_filter').detach();
// 	                displayTrainingData(response);
// 	            },
// 	            error: function(xhr, status, error) {
// 	                // Handle any errors that occur during the API call
// 	                console.error(status, error);
// 	            }
// 	        });
// 		 }
		
	});
	
	
	$('#distbar').on('change', function() {
        // Retrieve the selected value from the dropdown
        var selectedValue = $(this).val();
        var selectedTname = $('#tnamesbar').val();
        var selectedVname = $('#vnamesbar').val();
        //$('.appended-option').show();
   	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

        
        
     // Call another API using AJAX
//          if (selectedTname !== null && selectedTname !== '' && selectedVname !== null && selectedVname !== '') {

// 	        $.ajax({
// 	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevnamedist',
// 	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
// 	            data: { ref_planner_id: $('#tnamesbar').val(),
// 	                vid: $('#vnamesbar').val(),
// 	                district_name : selectedValue,
// 	                appliedtype: 'self' 
// 	            }, // Pass any data needed for the API call
// 	            success: function(response) {
// 	            	console.log(response);
// 	            	 $('#admintid_length').detach();
	
// 	 		        // Move the DataTables filter element to #sbar
// 	 		        $('#admintid_filter').detach();
// 	                displayTrainingData(response);
// 	            },
// 	            error: function(xhr, status, error) {
// 	                // Handle any errors that occur during the API call
// 	                console.error(status, error);
// 	            }
// 	        });
//          }else{
//         	 $.ajax({
//  	            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydistrict',
//  	            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//  	            data: {
//  	                district_name : selectedValue,
//  	                appliedtype: 'self' 
//  	            }, // Pass any data needed for the API call
//  	            success: function(response) {
//  	            	console.log(response);
//  	            	 $('#admintid_length').detach();
 	
//  	 		        // Move the DataTables filter element to #sbar
//  	 		        $('#admintid_filter').detach();
//  	                displayTrainingData(response);
//  	            },
//  	            error: function(xhr, status, error) {
//  	                // Handle any errors that occur during the API call
//  	                console.error(status, error);
//  	            }
//  	        });
//          }
	});
	
	$('#desgbar').on('change', function() {
        // Retrieve the selected value from the dropdown
        var selectedValue = $(this).val() !== null ? $(this).val() : 'null';
        var selectedTname = $('#tnamesbar').val();
        var selectedVname = $('#vnamesbar').val();
        var selectedDist = $('#distbar').val();
        
   	    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());

        
     // Call another API using AJAX
//      if (selectedTname && selectedVname && selectedDist) {
//         $.ajax({
//             url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevnamedistdesg',
//             method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//             data: { ref_planner_id: $('#tnamesbar').val(),
//                 vid: $('#vnamesbar').val(),
//                 district_name : $('#distbar').val(),
//                 designation : selectedValue,
//                 appliedtype: 'self' 
//             }, // Pass any data needed for the API call
//             success: function(response) {
//             	console.log(response);
//             	 $('#admintid_length').detach();

//  		        // Move the DataTables filter element to #sbar
//  		        $('#admintid_filter').detach();
//                 displayTrainingData(response);
//             },
//             error: function(xhr, status, error) {
//                 // Handle any errors that occur during the API call
//                 console.error(status, error);
//             }
//         });
//      }else{
//     	 $.ajax({
//              url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydesignation',
//              method: 'GET', // Specify the HTTP method (GET, POST, etc.)
//              data: {
//                  designation : selectedValue,
//                  appliedtype: 'self' 
//              }, // Pass any data needed for the API call
//              success: function(response) {
//              	console.log(response);
//              	 $('#admintid_length').detach();

//   		        // Move the DataTables filter element to #sbar
//   		        $('#admintid_filter').detach();
//                  displayTrainingData(response);
//              },
//              error: function(xhr, status, error) {
//                  // Handle any errors that occur during the API call
//                  console.error(status, error);
//              }
//          });
//      }
	});
 
    // Trigger the click event for the "Self" button on page load
    $("#nominateRadio").trigger("click");
  
    
    function searchApi(tnamesbar,vnamesbar,distbar,desgbar){
    	$.ajax({
            url: '${pageContext.request.contextPath}/api/mytrainings/filterbasedonchange',
            method: 'GET', // Specify the HTTP method (GET, POST, etc.)
            data: { 
                ref_planner_id: $('#tnamesbar').val(),
                vid: $('#vnamesbar').val(),
                district_name: $('#distbar').val(),
                designation: $('#desgbar').val(),
                status:'',
                appliedtype: 'nominated'
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
    
    function fetchDataAndDownload(apiEndpoint, spreadsheetName) {
        // Make an AJAX request to the selected endpoint
        $.ajax({
            type: "GET",
            url: apiEndpoint,
            dataType: "json",
            success: function (response) {
                // Display the response on the console
                console.log("API response:", response);
                if ($.fn.DataTable.isDataTable('#admintid')) {
				    // Destroy the DataTable
				    $('#admintid').DataTable().destroy();
				}
                // Display training data in the table
                console.log(response);
                displayTrainingData(response);
                showDropdowns(response);
                 
            },
            error: function (xhr, status, error) {
                console.error("API request error: " + error);
            }
        });
        
//         $.ajax({
//             type: "GET",
//             url: '${pageContext.request.contextPath}/api/mytrainings/tname',
//             data: { appliedtype: 'nominated' }, // Correct data object syntax
//             dataType: "json",
//             success: function (response) {
//             	//showDropdowns(response);     
//             },
//             error: function (xhr, status, error) {
//                 console.error("API request error: " + error);
//             }
//         });
    }
    
    
 
    function displayTrainingData(data) {
		if ($.fn.DataTable.isDataTable('#admintid')) {
		    // Destroy the DataTable
		    $('#admintid').DataTable().destroy();
		
		}
 
		var tableBody = $("#admintid tbody");
 
		// Clear existing rows
		tableBody.empty();
 
		for (var i = 0; i < data.length; i++) {
			var training = data[i];
			var row = $("<tr></tr>");
			row.append("<td class='serial-column'>"
					+ (i + 1) + "</td>");
			// Populate the row with data from the 'training' object
		row.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + training.treasuryid + '" data-ref_planner_id="' + training.ref_planner_id + '" data-vid="' + training.vid + '"></td>');
 
		row.append("<td>" + (training.treasuryid ? training.treasuryid : '') + "</td>");
		row.append("<td>" + (training.teacher_name ? training.teacher_name : '') + "</td>");
		row.append("<td>" + (training.mobilenumberteacher ? training.mobilenumberteacher : '') + "</td>");
		row.append("<td>" + (training.tname ? training.tname : '') + "(" + (training.ref_planner_id ? training.ref_planner_id : '') + ")" + "</td>");
		row.append("<td>" + (training.vname && training.vid && training.vaddress ? training.vname + ",(" + training.vid + ")," + training.vaddress : '') + "</td>");
		row.append("<td style='display:none;'>" + (training.vid ? training.vid : '') + "</td>");
		row.append("<td>" + (training.designation ? training.designation : '') + "</td>");
		
			// Parse DOB string to create a Date object
			var dobParts = training.dob.split("-");
			var dob = new Date(dobParts[2],
					dobParts[1] - 1, dobParts[0]);
 
			// Calculate age based on DOB
			var today = new Date();
			var age = today.getFullYear()
					- dob.getFullYear();
 
			// Adjust age if birthday hasn't occurred yet this year
			if (today.getMonth() < dob.getMonth()
					|| (today.getMonth() === dob
							.getMonth() && today
							.getDate() < dob.getDate())) {
				age--;
			}
			row.append("<td>" + (age ? age + " years" : '') + "</td>");
			row.append("<td>" + (training.district_name ? training.district_name : '') + "</td>");
			row.append("<td>" + (training.school_code ? training.school_code : '') + "</td>");
			row.append("<td>" + (training.tmode ? training.tmode : '') + "</td>");
			row.append("<td>" + (training.resourcetype ? training.resourcetype : '') + "</td>");
			row.append("<td>" + (training.tdescription ? training.tdescription : '') + "</td>");
 
			console.log(training.applydateandtime);
 
			   var appliedDateTime = new Date(training.applydateandtime);
		        if (!isNaN(appliedDateTime.getTime())) {
		            // Create a human-readable timestamp
		            var options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZoneName: 'short' };
		            var formattedDateTime = new Intl.DateTimeFormat('en-US', options).format(appliedDateTime);
		            row.append("<td>" + formattedDateTime + "</td>");
		        } else {
		            // Handle the case where Applydate is not a valid date string
		            row.append("<td>Invalid Date</td>");
		        }
 
		     // Add a button with a link to the next page, passing the treasury ID in the URL
				var button = $('<button class="btn custom-font-size" style="font-size: 14px; background-color: green; color: white;" onclick="previoustrainings(\'' + training.treasuryid + '\')">Previous Trainings</button>');
 
		        var buttonCell = $("<td></td>").append(button);
		        row.append(buttonCell);
		        // Add a checkbox in the "Action" column
		        tableBody.append(row);
 
		}
		var dataTableReject = $('#admintid').DataTable({
       	 "columnDefs": [{
                   "targets": '_all', // Apply to all columns
                   "render": function(data, type, row, meta) {
                       // Check if it's not the second column or the last column
                       if (meta.col !== 1 && meta.col < (meta.settings.aoColumns.length - 1)) {
                           if (type === 'display' && data && data.length > 25) {
                               return '<span class="truncated-cell" title="' + data + '">' + data.substr(0, 20) + '...</span>';
                           } else {
                               return data;
                           }
                       } else {
                           return data; // Return full data for the second and last column
                       }
                   }
               }],
       	 retrieve:true,
	            dom: 'lBfrtip',
	            buttons: [
	                {
	                    extend: 'pdfHtml5',
	                    orientation: 'landscape', // or 'portrait'
	                    pageSize: 'A3',
	                    customize: function(doc) {
				            doc.defaultStyle.fontSize = 9; // Reduce font size
				            // Exclude the last column from the PDF
				             var rows = doc.content[1].table.body;
					            $('#admintid').DataTable().rows().every(function(rowIdx, tableLoop, rowLoop) {
					                var rowData = this.data();
					                $(rowData).each(function(colIdx) {
					                	var cellData = rowData[colIdx];
					                	rows[rowIdx + 1][colIdx].text = cellData;
					                });
					            });
				            var rowCount = doc.content[1].table.body.length;
				            for (var i = 0; i < rowCount; i++) {
				                var rowData = doc.content[1].table.body[i];
				                rowData.splice(1, 1); // Remove the second column
				                rowData.splice(-1, 1); // Remove the last column
				            }
				        }// or 'A4', 'A3', etc.
	                },
	                {
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
	                    		$(this).find('c:last').remove();
	                    		if (index != 1) {
	                                // Find the cells in the second column (excluding the first cell)
	                                $(this).find('c:nth-child(2)').not(':first-child').remove();
	                            }
	                    	    // Loop through all cells in the current row
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
	                    	        
//	                                 $(this).attr('r', 'C' + (index + 1));

	                    	    });
	                    	    

	                    	});

	                    }
	                }
	            ]
	        });
        $('.dt-buttons').addClass('btn-group');
			$('.dataTables_filter').addClass('btn-group');
			$('.buttons-excel, .buttons-pdf').addClass(
					'btn btn-primary btn-blue');
			
			$('.dt-buttons').appendTo('#buttonss');
			$('#admintid_length').detach().appendTo('#length').css({'style':'none'});
 
			// Move the DataTables filter element to #sbar
			$('#admintid_filter').detach().appendTo('#sbar');
 
	}
							           });
							           

function previoustrainings(tid) {
		window.location.href = "${pageContext.request.contextPath}/TrainingInformation.jsp?treasuryId="+ tid;
}
	//	#################### Approved button script ########################
 
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
					var treasuryId = $(this).attr('data-treasuryid');
					var refPlannerId = $(this).attr('data-ref_planner_id');
					var vid = $(this).attr('data-vid');
					console.log(vid);
 
					$.ajax({
						type : 'PUT',
						url : '${pageContext.request.contextPath}/api/update-status',
						data : {
							treasuryId : treasuryId,
							refPlannerId : refPlannerId,
							vid : vid
						},
						success : function(response) {
							console.log('Status updated successfully:',
									response);
							toastr.success('Approved Training successfully');
 
							setTimeout(function() {
								window.location.href = '${pageContext.request.contextPath}/Admin_approval.jsp'; // Replace with your target page
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
	
function appendData(data) {
			
			var uniqueVnames = [];
		    var uniqueDesignations = [];
			data.forEach(function(item) {
		    
				if (item.vname !== null && !uniqueVnames.includes(item.vname)) {
			        uniqueVnames.push(item.vname);
			        $('#vnamesbar').append($('<option>', {
			            value: item.vid,
			            text: item.vname
			        }));
			    }
				if (item.designation !== null) {
				    var designationText = item.designation.trim();
				    if (!uniqueDesignations.includes(designationText)) {
				        uniqueDesignations.push(designationText);
				        $('#desgbar').append($('<option>', {
				            value: designationText,
				            text: designationText
				        })).children(':last').addClass('appended-option').hide();
				    }
				} else {
				    // Append 'null' text only if it's not already in the options
				    if (!uniqueDesignations.includes('null')) {
				        uniqueDesignations.push('null');
				        $('#desgbar').append($('<option>', {
				            value: 'null',
				            text: 'null'
				        })).children(':last').addClass('appended-option').hide();
				    }
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
	            value: item.ref_planner_id,
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
        if (item.vname !== null && !uniqueVnames.includes(item.vname)) {
            uniqueVnames.push(item.vname);
            $('#vnamesbar').append($('<option>', {
                value: item.vid,
                text: item.vname
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
 
		// Function to filter table rows based on search text
		function filterTableRows(searchText) {
			$("#admintid tbody tr").filter(
					function() {
						var trainingName = $(this).find("td:eq(11)").text()
								.toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(trainingName.indexOf(searchText) > -1);
					});
		}
		
	

		// Function to filter table rows based on search text
		function filterTableRows(searchText) {
			$("#admintid tbody tr").filter(
					function() {
						var District = $(this).find("td:eq(9)")
								.text().toLowerCase(); // Index 1 is the "Training Name" column
						$(this).toggle(
								District.indexOf(searchText) > -1);
					});
		}
 
		
	</script>
	
</head>
 
<body>
 
		<div class="maindiv custom-font-size" style="margin-left: 10px;">
<!-- 		<div class="maindiv2"> -->
<!-- 			<input type=" text" class="form-control" -->
<!-- 				placeholder="Search Training Name..." id="searchBar" /> -->
<!-- 		</div> -->
<!-- 		<div class="maindiv2"> -->
<!-- 			<input type="text" class="form-control" -->
<!-- 				placeholder="Search District Name..." id="searchBar1" /> -->
<!-- 		</div> -->
 
	</div>
 
 
	<div class="custom-font-size" id="selfButton" style="margin-top: -20px;margin-left: 10px;">
		<input class="custom-font-size" type="radio" id="selfRadio" name="attendType" value="self"
			checked> <label class="custom-font-size" for="selfRadio">Self</label>
			 <input class="custom-font-size" type="radio" id="nominateRadio" name="attendType" value="Nominated">
		<label class="custom-font-size" for="nominateRadio">Nominate</label>
	</div>
	<div class="formheading">
		<!-- 			<h1 class="h2">Training Approval</h1> -->
	<div class="row">
			<div id="length" class="col-md-2 custom-font-size" >
				<!-- First div at top left -->
				<!-- Content for the first div -->
			</div>
			<div id="buttonss" class="col-md-3 custom-font-size">
				<!-- First div at top left -->
				<!-- Content for the first div -->
			</div>
			<div id="sbar" class="col-md-4 text-center custom-font-size">
				<!-- Second div at top right -->
				<!-- Content for the second div -->
			</div>
		</div>
	</div>
	<div class="formheading" style="margin-top: 0px;margin-bottom: 10px;">
	<div class="row custom-font-size" id="row2">
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
    <div id="dist" class="col-md-2 custom-font-size" style="margin-top: 5px;">
        <label for="distbar">District</label>
            <select id="distbar" class="custom-select"><option id="selectalldistrict" value="null">Select All District</option></select>
    </div>
    <div id="desg" class="col-md-2 custom-font-size" style="margin-top: 5px;">
        <label for="desgbar">Designation</label>
            <select id="desgbar" class="custom-select"><option id="selectalldesignation" value="null">Select All Designation</option></select>
    </div>
</div>
	</div>
	
	<div class="table-container custom-font-size" style="margin-top: -10px;">
		<div class="table-responsive">
			<table id="admintid" class="table">
				<thead>
					<tr>
						<th>Sl no</th>
						<th>Action</th>
						<th>Treasury Id</th>
						<th>Teacher Name</th>
						<th>Mobile No</th>
						<th>Training Name</th>
						<th>Venue details</th>
						<th style="display: none;">Venue Id</th>
						<th>Designation</th>
						<th>Age</th>
						<th>District</th>
						<th>School Udise</th>
						<th>Training Mode</th>
						<th>Resource Type</th>
						<th>Training Description</th>
						<th>Apply Date</th>
						<th>Previous Training</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	
<div style="text-align: right;">
    <button class="btn custom-font-size" id="approveButton" style="background-color: green;color: white;" onclick="approveTraining()">Approve</button><button class="btn custom-font-size btn-danger" id="cancelButton" onclick="showRejectModal()">Reject</button>
</div>
 
<div id="rejectModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeRejectModal()">&times;</span>
        <label for="rejectReason">Reason for Rejection:</label>
        <textarea id="rejectReason" name="rejectReason" rows="4" cols="50" required></textarea>
        <br>
        <div id="new">
            <button class="btn btn-danger custom-font-size" onclick="cancelReject()">Cancel</button>
            <button id="submitRejectButton" class="btn btn-primary custom-font-size" style="width:100px;" onclick="submitFormWithValidation()">Submit</button>
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
            var treasuryId = selectedCheckbox.attr('data-treasuryid');
            var refPlannerIds = selectedCheckbox.attr('data-ref_planner_id');
            var vids = selectedCheckbox.attr('data-vid');
 
            // Set the selected details in the modal
            $('#rejectReason').val('');
            $('#rejectModal').attr('data-treasuryid', treasuryId);
            $('#rejectModal').attr('data-ref_planner_id', refPlannerIds);
            $('#rejectModal').attr('data-vid', vids);
 
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
 
    function submitFormWithValidation() {
        var treasuryId = $('#rejectModal').attr('data-treasuryid');
        var refPlannerIds = $('#rejectModal').attr('data-ref_planner_id');
        var vids = $('#rejectModal').attr('data-vid');
        var remarks = $('#rejectReason').val();
        console.log("ssssssss"+vids);
 
        $.ajax({
            type: 'PUT',
            url: '${pageContext.request.contextPath}/api/remarks',
            data: {
                treasuryId: treasuryId,
                refPlannerIds: refPlannerIds,
                vid: vids,
                remarks: remarks
            },
            success: function(response) {
                console.log('Training Rejected Successfully:', response);
                toastr.success('Training Rejected Successfully');
 
                closeRejectModal();
 
                setTimeout(function() {
                    window.location.href = '${pageContext.request.contextPath}/Admin_approval.jsp';
                }, 1000);
            },
            error: function(error) {
                console.error('Error For Training Rejected:', error);
                toastr.error('Error For Training Rejected');
            }
        });
    }
    </script>
 
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
 
</html>