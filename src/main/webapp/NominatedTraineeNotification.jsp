<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Trainings Soon</title>
<!-- Include jQuery library -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

h2 {
	text-align: center;
	color: #008CBA;
	margin: 20px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

th {
	border: 1px solid white;
	text-align: left;
	padding: 5px;
	background-color: #008CBA;
	color: white;
	/* Change this line to set the background color */
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a {
	text-decoration: none;
	color: #007bff;
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
</style>
<script>
	$(document).ready(function() {
		// Retrieve the stored data from sessionStorage
		
		$('#trainingTable').on('click', '.tooltip-cell', function() {
			var $this = $(this);
			var fullContent = $this.data('fullContent');
			if (!fullContent) {
				fullContent = $this.attr('title');
			}
			console.log(fullContent);
			$this.text(fullContent);
			// Remove click event to prevent multiple clicks
			$this.removeClass('tooltip-cell').removeAttr('title');
		});
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/api/scheduledTrainings",
			dataType : "json",
			success : function(data) {
				// Display training data in the table
				showDropdowns(data);
				displayTrainingData(data);
			},
			error : function(xhr, status, error) {
				console.error("API request error: " + error);
				// Handle the error here, e.g., display an error message to the user
			}
		});
		
		
		$('#tnamesbar').on('change', function() {
	        var selectedValue = $(this).val();
		    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());
	    });
		
		$('#vnamesbar').on('change', function() {
		    searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());
		});
		
		
	});
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

		    var uniqueTnames = [];
		    var uniqueVnames = [];
		    

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
		                value: item.venue_id,
		                text: item.venue_name
		            }));
		        } else if (item.vname === null && !vnameNullAppended) {
		            $('#vnamesbar').append($('<option>', {
		                value: '',
		                text: 'null'
		            }));
		            vnameNullAppended = true;
		        }
		       
		    });
		}
	
	
	function searchApi(tnamesbar,vnamesbar,distbar,desgbar){
       	$.ajax({
               url: '${pageContext.request.contextPath}/api/filterbasedsearch',
               method: 'GET', // Specify the HTTP method (GET, POST, etc.)
               data: { 
            	   ref_planner_id: $('#tnamesbar').val(),
            	   venue_id: $('#vnamesbar').val()
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
	function appendData(data) {
		//console.log(data);
		var uniqueVnames = [];
	    var uniqueDesignations = [];
		data.forEach(function(item) {
	    
			if (item.venue_name !== null && !uniqueVnames.includes(item.venue_name)) {
		        uniqueVnames.push(item.venue_name);
		        $('#vnamesbar').append($('<option>', {
		            value: item.venue_id,
		            text: item.venue_name
		        }));
		    }
	    });
	}
	
		
	

	function displayTrainingData(data) {
		
		var table = $("#trainingTable tbody");

		// Clear existing rows
		table.empty();

		for (var i = 0; i < data.length; i++) {
			var training = data[i];
			var row = $("<tr></tr>");
			row.append("<td class='serial-column'>" + (i + 1) + "</td>");
			// Populate the row with data from the 'training' object
			appendCellWithTooltip(row, training.tname + "(" + training.ref_planner_id + ")", 25);
			appendCellWithTooltip(row, training.venue_name + " (" + training.venue_id + "), " + training.vaddress, 25);
			appendCellWithTooltip(row, training.tmode, 25);
			appendCellWithTooltip(row, training.tmonth, 25);
			appendCellWithTooltip(row, training.tyear, 25);
			appendCellWithTooltip(row, training.training_start_dt + " to " + training.training_end_dt, 25);
			appendCellWithTooltip(row, training.tmodule, 25);
			appendCellWithTooltip(row, training.tdescription, 25);

			row.append("<td style='display: none;'>" + training.tstarttime
					+ "</td>");
			row.append("<td style='display: none;'>" + training.tendtime
					+ "</td>");
			row.append("<td style='display: none;'>" + training.coordinatorname
					+ "</td>");
			row.append("<td style='display: none;'>"
					+ training.coordinatoremailid + "</td>");
			row.append("<td style='display: none;'>"
					+ training.coordinatormobileno + "</td>");
			row.append("<td style='display: none;'>" + training.maplocation
					+ "</td>");
			row.append("<td style='display: none;'>" + training.tagency
					+ "</td>");
			row.append("<td style='display: none;'>" + training.resourcetype
					+ "</td>");

			var actionCell = $("<td></td>");
			var applyNowButton = $("<button></>button").attr("href",
					"javascript:void(0);")
			// Set href to prevent default navigation
			.click(
					createClickHandler(training.ref_planner_id,
							training.venue_id, training.tname,
							training.venue_name, training.vaddress,
							training.tmode, training.tmonth, training.tyear,
							training.training_start_dt,
							training.training_end_dt, training.tmodule,
							training.tdescription, training.tstarttime,
							training.tendtime, training.coordinatorname,
							training.coordinatoremailid,
							training.coordinatormobileno, training.maplocation,
							training.tagency, training.resourcetype)).text(
					"Apply Nomination");

			// Apply CSS to make the button green
			applyNowButton.css({
				"background-color" : "green",
			    "color" : "white",
			    "border" : "none",
			    "padding" : "10px 10px",
			    "cursor" : "pointer",
			    "border-radius" : "5px",
			    "white-space": "nowrap" // Prevent text wrapping
 // Add border radius for rounded corners
			});

			actionCell.append(applyNowButton);
			row.append(actionCell);

			table.append(row);
		}
	}
	function appendCellWithTooltip(row, content, maxLength) {
	    var truncatedContent = content.length > maxLength ? (content.substr(0, maxLength) + '...') : content;
	    var tooltipContent = content.length > maxLength ? content : '';
	    row.append("<td class='tooltip-cell' title='" + tooltipContent + "'>" + truncatedContent + "</td>");
	}
	function createClickHandler(refPlannerId, venueId, tname, venue_name,
			vaddress, tmode, tmonth, tyear, training_start_dt, training_end_dt,
			tmodule, tdescription, tstarttime, tendtime, coordinatorname,
			coordinatoremailid, coordinatormobileno, maplocation, tagency,
			resourcetype) {
		return function() {
			redirectToApplyPage(refPlannerId, venueId, tname, venue_name,
					vaddress, tmode, tmonth, tyear, training_start_dt,
					training_end_dt, tmodule, tdescription, tstarttime,
					tendtime, coordinatorname, coordinatoremailid,
					coordinatormobileno, maplocation, tagency, resourcetype);
		};
	}
	function redirectToApplyPage(refPlannerId, venueId, tname, venue_name,
			vaddress, tmode, tmonth, tyear, training_start_dt, training_end_dt,
			tmodule, tdescription, tstarttime, tendtime, coordinatorname,
			coordinatoremailid, coordinatormobileno, maplocation, tagency,
			resourcetype) {
		// Construct the URL with parameters
		var applyPageUrl = '${pageContext.request.contextPath}/NominatedForm.jsp'
				+ '?ref_planner_id='
				+ encodeURIComponent(refPlannerId)
				+ '&venue_id='
				+ encodeURIComponent(venueId)
				+ '&tname='
				+ encodeURIComponent(tname)
				+ '&venue_name='
				+ encodeURIComponent(venue_name)
				+ '&vaddress='
				+ encodeURIComponent(vaddress)
				+ '&tmode='
				+ encodeURIComponent(tmode)
				+ '&tmonth='
				+ encodeURIComponent(tmonth)
				+ '&tyear='
				+ encodeURIComponent(tyear)
				+ '&training_start_dt='
				+ encodeURIComponent(training_start_dt)
				+ '&training_end_dt='
				+ encodeURIComponent(training_end_dt)
				+ '&tmodule='
				+ encodeURIComponent(tmodule)
				+ '&tdescription='
				+ encodeURIComponent(tdescription)
				+ '&tstarttime='
				+ encodeURIComponent(tstarttime)
				+ '&tendtime='
				+ encodeURIComponent(tendtime)
				+ '&coordinatorname='
				+ encodeURIComponent(coordinatorname)
				+ '&coordinatoremailid='
				+ encodeURIComponent(coordinatoremailid)
				+ '&coordinatormobileno='
				+ encodeURIComponent(coordinatormobileno)
				+ '&tagency='
				+ encodeURIComponent(tagency)
				+ '&resourcetype='
				+ encodeURIComponent(resourcetype)
				+ '&maplocation='
				+ encodeURIComponent(maplocation);

		console.log(applyPageUrl);

		// Redirect to the apply page
		window.location.href = applyPageUrl;
	}
</script>

</head>
<body>
	<h2>Nominate Teachers For Trainings</h2>
	<div class="formheading">
		<div class="row custom-font-size" id="row2">
			<div id="tsbar" class="col-md-2 custom-font-size">
				<label for="tnamesbar">Training Name</label> <select id="tnamesbar"
					class="custom-select"> <option id="selectalltraining" value="null">Select All Training</option></select>
			</div>
			<div id="vsbar" class="col-md-2 custom-font-size">
				<label for="vnamesbar">Venue Name</label> <select id="vnamesbar"
					class="custom-select"><option id="selectallvenue" value="null">Select All Venue</option></select>
			</div>
		</div>
	</div>
	<table border="1" id="trainingTable">
		<thead>
			<tr>

				<th>Sl N0</th>
				<th>Training Name</th>

				<th>Venue</th>

				<th>Training Mode</th>
				<th>Training Month</th>
				<th>Training Year</th>
				<th>Training Start to end Date</th>
				<th>Module</th>
				<th>Description</th>
				<th>Nominated Trainings</th>
			</tr>
		</thead>
		<tbody>
			<!-- Data will be populated dynamically here -->
		</tbody>
	</table>
</body>
</html>