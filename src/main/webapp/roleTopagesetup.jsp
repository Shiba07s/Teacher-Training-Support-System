<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Training Group</title>
 
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
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f4f4f4;
}
 
.container {
	max-width: 400px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
 
[11:16 AM] Mangala Charan Panda
label {
/* 	display: block; */
	margin-bottom: 10px;
	font-weight: bold;
}
 
input[type=checkbox], input[type=radio] {
    margin: 1px 10px 0;
/*     margin-top: 1px \9; */
    line-height: normal;
}
input {
/* 	width:100%; */
	padding: 8px;
	margin-bottom: 20px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}
 
.button-container {
	display: flex;
	justify-content: space-between;
}
 
button {
	flex: 1;
	padding: 10px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
	font-weight: bold;
}
 
.save-button {
	background-color: #008CBA;
	color: white;
	margin-right: 10px;
}
 
.close-button {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}
 
button:hover {
	opacity: 0.8;
}
.checkbox-item {
    display: inline-block; /* Make the divs inline */
    margin-right: 10px; /* Add some spacing between checkbox items */
    width:220px;
}
 #dashboardSubmenu {
            display: none;
            margin-left: 20px;
        }

        /* Styles for checkboxes */
        #dashboardSubmenu input[type="checkbox"] {
            margin-right: 5px;
        }

        /* Styles for labels */
        #dashboardSubmenu label {
            margin-left: 5px;
        }
</style>
</head>
<body>
	<form id="addSessionForm" onsubmit="return saveGroup()">
 
		<div class="container">
			<h2>User Role Setup </h2>
 
 
			<button type="button" class="save-button" onclick="newRole()"> Add New
				Role </button>
			<button type="button" class="save-button" onclick="existingRole()">Edit Existing
				Role </button>
 
 
			<div id="rolediv" style="display: none;">
				<label for="role-name">Role Name:</label> <select id="roleDropdown"
					class="form-control" required></select>
			</div>
			
			<div id="role1div" style="display: none;">
				<label for="role-name">Role Name:</label> <input type="text" id="role1"
					class="form-control" required></input>
			</div>
 
			<div id="pagediv" style="display: none;">
			    <label for="page-name">Accessible To:</label>
			    <div id="checkboxOptions">
			        <!-- Checkboxes will be dynamically added here -->
			    </div>
			</div>
			
 <div id="checkboxOptions">
        <div id="dashboardSubmenu">
            <input type="checkbox" id="waitingForApproval" value="waitingForApproval" name="pageCheckbox">
            <label for="waitingForApproval">Waiting For Approval</label>
            <br>
            <input type="checkbox" id="approvedTrainees" value="approvedTrainees" name="pageCheckbox">
            <label for="approvedTrainees">Approved Trainees</label>
            <br>
            <input type="checkbox" id="rejectedTrainees" value="rejectedTrainees" name="pageCheckbox">
            <label for="rejectedTrainees">Rejected Trainees</label>
            <br>
            <input type="checkbox" id="nomination" value="nomination" name="pageCheckbox">
            <label for="nomination">Nomination</label>
            <br>
            <input type="checkbox" id="budgetApproval" value="budgetApproval" name="pageCheckbox">
            <label for="budgetApproval">Budget Approval</label>
            <br>
        </div>
    </div>
			
 
 
			<div class="button-container" style="display: none;" id="buttondiv">
				<button type="button" class="save-button" onclick="saveGroup()">Save</button>
				<button type="button" class="close-button" onclick="closeForm()">Close</button>
			</div>
 
		</div>
	</form>
	
	<script>
		function newRole() {
			document.getElementById("buttondiv").style.display = "none";
 
			document.getElementById("rolediv").style.display = "none";
 
			document.getElementById("role1div").style.display = "block";
			document.getElementById("pagediv").style.display = "block";
			document.getElementById("buttondiv").style.display = "block";
			callApi();
		}
		
		
		function existingRole(){
			document.getElementById("buttondiv").style.display = "none";
 
			document.getElementById("role1div").style.display = "none";
 
			document.getElementById("rolediv").style.display = "block";
			document.getElementById("pagediv").style.display = "block";
			document.getElementById("buttondiv").style.display = "block";
 
 
			callApi();
		}
				
						
 
		function callApi(){
			$.ajax({
				url : '${pageContext.request.contextPath}/api/names', // Change this URL to match your API endpoint
				type : 'GET',
				success : function(data) {
 
					$('#roleDropdown').empty();
 
					var options = '';
					options += '<option value="" selected disabled>---Select Role---</option>';
					for (var i = 0; i < data.length; i++) {
						// Split the data by commas if it contains commas
						var dataArray = data[i]
								.split(',');
						//console.log(dataArray[1]);
						options += '<option value="' + dataArray[1] + '">'
								+ dataArray[0]
								+ '</option>';
					}
					$('#roleDropdown').html(options);
				},
				error : function(xhr, status, error) {
					console.error(
							'Error fetching data:',
							error);
				}
			});
			
			// Generate checkboxes for page dropdown
			generateCheckboxes();
		}
		
		
		function generateCheckboxes() {
		    var checkboxOptions = document.getElementById("checkboxOptions");
		    checkboxOptions.innerHTML = ""; // Clear existing checkboxes
		    
		    // Add "Select All" checkbox
		    var selectAllCheckbox = document.createElement("input");
		    selectAllCheckbox.type = "checkbox";
		    selectAllCheckbox.id = "selectAllCheckbox";
		    selectAllCheckbox.value = "Select All";
		    selectAllCheckbox.name = "selectAllCheckbox";
		    var selectAllLabel = document.createElement("label");
		    selectAllLabel.htmlFor = "selectAllCheckbox";
		    selectAllLabel.appendChild(document.createTextNode("Select All"));
		    
		    checkboxOptions.appendChild(selectAllCheckbox);
		    checkboxOptions.appendChild(selectAllLabel);
		    checkboxOptions.appendChild(document.createElement("br")); // Add a line break
<!--		    
		 // Append dashboard submenu
		// Append dashboard submenu
// Append dashboard submenu
var dashboardSubmenu = document.createElement("div");
dashboardSubmenu.id = "dashboardSubmenu";
dashboardSubmenu.style.display = "none"; // Initially hide the submenu
dashboardSubmenu.style.marginLeft = "20px"; // Add margin to move the submenu to the right

var waitingForApprovalCheckbox = createCheckbox("waitingForApproval", "Waiting For Approval");
var approvedTraineesCheckbox = createCheckbox("approvedTrainees", "Approved Trainees");
var rejectedTraineesCheckbox = createCheckbox("rejectedTrainees", "Rejected Trainees");
var nominationCheckbox = createCheckbox("nomination", "Nomination");
var budgetApprovalCheckbox = createCheckbox("budgetApproval", "Budget Approval");

appendCheckboxLabelPair(dashboardSubmenu, waitingForApprovalCheckbox);
appendCheckboxLabelPair(dashboardSubmenu, approvedTraineesCheckbox);
appendCheckboxLabelPair(dashboardSubmenu, rejectedTraineesCheckbox);
appendCheckboxLabelPair(dashboardSubmenu, nominationCheckbox);
appendCheckboxLabelPair(dashboardSubmenu, budgetApprovalCheckbox);

var checkboxOptions = document.getElementById("checkboxOptions");
var dashboardCheckboxDiv = document.createElement("div");
dashboardCheckboxDiv.classList.add("checkbox-item");
var dashboardCheckbox = document.createElement("input");
dashboardCheckbox.type = "checkbox";
dashboardCheckbox.id = "Dashboard";
dashboardCheckbox.value = "Dashboard";
dashboardCheckbox.name = "pageCheckbox";
var dashboardLabel = document.createElement("label");
dashboardLabel.htmlFor = "Dashboard";
dashboardLabel.appendChild(document.createTextNode("Dashboard"));
dashboardCheckboxDiv.appendChild(dashboardCheckbox);
dashboardCheckboxDiv.appendChild(dashboardLabel);
checkboxOptions.appendChild(dashboardCheckboxDiv);
checkboxOptions.appendChild(dashboardSubmenu);

dashboardCheckbox.addEventListener("change", function() {
    if (dashboardCheckbox.checked) {
        dashboardSubmenu.style.display = "block";
    } else {
        dashboardSubmenu.style.display = "none";
    }
});

function createCheckbox(id, labelText) {
    var checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.id = id;
    checkbox.value = id;
    checkbox.name = "pageCheckbox";

    var label = document.createElement("label");
    label.htmlFor = id;
    label.appendChild(document.createTextNode(labelText));
    label.style.marginLeft = "10px"; // Add margin to move the label to the right

    return { checkbox: checkbox, label: label };
}

function appendCheckboxLabelPair(parent, checkboxLabelPair) {
    parent.appendChild(checkboxLabelPair.checkbox);
    parent.appendChild(checkboxLabelPair.label);
    parent.appendChild(document.createElement("br"));
}
-->


		    var dropdownValues = [
// 		        "Dashboard",
		        "MasterSetup",
		        "AcademicCalender",
		        "ScheduleTraining",
		        "TrainingToVenueMapping",
		        "Budget",
		        "ViewTrainings",
		        "MasterMapping"
		        // Add more options as needed
		    ];
		    
		    dropdownValues.forEach(function(option) {
		        var checkboxDiv = document.createElement("div"); // Create a div for each checkbox and label pair
		        checkboxDiv.classList.add("checkbox-item"); // Add a class for styling
		        
		        var checkbox = document.createElement("input");
		        checkbox.type = "checkbox";
		        checkbox.id = option;
		        checkbox.value = option;
		        checkbox.name = "pageCheckbox"; // Add a name to group checkboxes if needed
		        
		        var label = document.createElement("label");
		        label.htmlFor = option;
		        label.appendChild(document.createTextNode(option));
		        
		        checkboxDiv.appendChild(checkbox); // Append checkbox to the div
		        checkboxDiv.appendChild(label); // Append label to the div
		        
		        checkboxOptions.appendChild(checkboxDiv); // Append the div to the checkboxOptions div
		        
		        checkboxOptions.appendChild(document.createElement("br")); // Add a line break after each checkbox and label pair
		        
		        var dashboardCheckbox = document.getElementById("Dashboard");
	            dashboardCheckbox.addEventListener("change", function() {
	                var dashboardSubmenu = document.getElementById("dashboardSubmenu");
	                if (this.checked) {
	                    dashboardSubmenu.style.display = "block";
	                } else {
	                    dashboardSubmenu.style.display = "none";
	                }
		        });
		    });
 
		    // Add event listener to "Select All" checkbox outside the forEach loop
		 // Add event listener to "Select All" checkbox
		    selectAllCheckbox.addEventListener("change", function() {
		        var checkboxes = document.getElementsByName("pageCheckbox");
		        checkboxes.forEach(function(checkbox) {
		            checkbox.checked = selectAllCheckbox.checked;
		        });
		        
		        var dashboardSubmenu = document.getElementById("dashboardSubmenu");
		        if (selectAllCheckbox.checked) {
		            dashboardSubmenu.style.display = "block"; // Show sub-menu checkboxes
		        } else {
		            dashboardSubmenu.style.display = "none"; // Hide sub-menu checkboxes
		        }
		    });
		}
 
		function saveGroup() {
		    var role;
		    var page;
 
		    if (document.getElementById("rolediv").style.display === "block") {
		        role = $("#roleDropdown option:selected").text();
		    } else {
		        role = $("#role1").val();
		    }
 
		    page = $("#pageDropdown").val();
		    
		    // Fetching checkbox values
		    var dashboardValue = $('#Dashboard').is(":checked") ? "YES" : "NO";
		    var masterSetupValue = $('#MasterSetup').is(":checked") ? "YES" : "NO";
		    var academicCalenderValue = $('#AcademicCalender').is(":checked") ? "YES" : "NO";
		    var scheduleTrainingValue = $('#ScheduleTraining').is(":checked") ? "YES" : "NO";
		    var trainingToVenueMappingValue = $('#TrainingToVenueMapping').is(":checked") ? "YES" : "NO";
		    var budgetValue = $('#Budget').is(":checked") ? "YES" : "NO";
		    var viewTrainingsValue = $('#ViewTrainings').is(":checked") ? "YES" : "NO";
		    var masterMappingValue = $('#MasterMapping').is(":checked") ? "YES" : "NO";
		    var waitingForApprovalValue = $('#waitingForApproval').is(":checked") ? "YES" : "NO";
		    var approvedTraineesValue = $('#approvedTrainees').is(":checked") ? "YES" : "NO";
		    var rejectedTraineesValue = $('#rejectedTrainees').is(":checked") ? "YES" : "NO";
		    var nominationValue = $('#nomination').is(":checked") ? "YES" : "NO";
		    var budgetApprovalValue = $('#budgetApproval').is(":checked") ? "YES" : "NO";
		    // Add more lines like above for each option
 
		    // Create payload object with role and options
		    var payload = {
		        role: role,
		        url: '/api/admin',
		        dashboard: dashboardValue,
		        masterSetup: masterSetupValue,
		        academicCalender: academicCalenderValue,
		        scheduleTraining: scheduleTrainingValue,
		        trainingToVenueMapping: trainingToVenueMappingValue,
		        budget: budgetValue,
		        viewTrainings: viewTrainingsValue,
		        masterMapping: masterMappingValue,
		        waitingForApproval: waitingForApprovalValue,
		        approvedTrainees: approvedTraineesValue,
		        rejectedTrainees: rejectedTraineesValue,
		        nomination: nominationValue,
		        budgetApproval: budgetApprovalValue
		        // Add more options as needed
		    };
 
		    // Do something with role and page data, like sending it to the server
		    $.ajax({
		        url: '${pageContext.request.contextPath}/api/createrole',
		        type: 'POST',
		        data: JSON.stringify(payload),
		        contentType: 'application/json', // Add content type header
 
		        success: function (data) {
		            alert("Role Created Successfully");
		            window.location.href = "${pageContext.request.contextPath}/roleTopagesetup.jsp";

		            console.log(data);
		        },
		        error: function (xhr, status, error) {
		            console.error('Error fetching data:', error);
		        }
		    });
		}
 
 
	</script>
</body>
</html>