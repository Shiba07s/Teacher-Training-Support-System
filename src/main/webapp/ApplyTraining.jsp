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
        <style>
    .container {
        width: 100%;
        font-size: 14px;
    }
    body{
    	margin-left: 30%;
    
    }

    #tab2 {
        display: none;
    }

    .table {
        height: 500px;
    }

    .table thead th {
        background-color: #008CBA;
        color: white;
        width: 100px;
    }
    
    .custom-font-size table.dataTable,
.custom-font-size table.dataTable th,
.custom-font-size table.dataTable td {
    font-size: 14px;
}
.custom-font-size {
    font-size: 14px !important;
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
    	#trainingTable th {
    	border: 1px solid white;
	background-color: #008CBA;
	color: #fff;
		font-size: 15px;
	
}
#trainingTable th{
{
	border: 1px solid white;
	padding: 8px;
	text-align: left;
		font-size: 15px;
	
}
}
#trainingTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
		font-size: 14px;
	
}

.xyz{
	background-color: green;
	 color: white;
	 width:65px;
	 height:25px;
	 font:Segoe UI;
	 	 font-size:10px;
	 	 	 border-radius:8px;
	 	 	 border:none;
	 	 
	 

}
.abc{

	background-color: green;
	 color: white;
	 opacity:0.6;
	  width:65px;
	 height:25px;
	 cursor:no-drop;
	 	 font:Segoe UI;
	 font-size:10px;
	 border-radius:8px;
	 	 	 	 border:none;
	 
	
}
 #messageContainer {
            text-align: center;
            color: red;
            font-size: 18px; /* Adjust the font size as needed */
/*             margin-top: 7%; /* Adjust the top margin to center vertically */ */
        }
   
</style>    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous" />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <style>
        /* Define a style for the disabled button */
    .btn-disabled12 {
        background-color: #b3f5c3 !important; /* Set your desired background color for the disabled state */
        border-color: red !important; /* Set your desired border color for the disabled state */
        color: black !important;
       cursor: no-drop !important;
          /* Set your desired text color for the disabled state */
       /* Optional: Change the cursor to indicate the button is disabled */
        font-weight:bold !important;
    }
    </style>
    
</head>
<body>
    <div id="messageContainer" class="custom-font-size"></div>
 
    <div class="tab-content custom-font-size" id="tab2">
        <div class="mt-1 custom-font-size">
            <b></b>
        </div>
        <table class="table table-hover custom-font-size" id="trainingTable">
            <thead style="width: 80px">
                <tr>
                    <th>slno</th>
                    <th>Reference Id</th>
                    <th>Training Name</th>
                    <th>Training Mode</th>
                    <th>Description</th>
                    <th>Application start Date</th>
                    <th>Application End Date</th>
                    <th>Training start Date</th>
                    <th>Training Start Time</th>
                    <th>Training End Date</th>
                    <th>Training End Time</th>
                    <th>Venue Id</th>
                    <th>venue Address</th>
                    <th>Map Location</th>
                    <th>Co-ordinater Details</th>
                    <th>Resource Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <script>
        $(document).ready(function () {
        	$('#trainingTable').on('click', '.truncated-cell', function() {
    		    var $this = $(this);
    		    var title = $this.attr('title');
    		    $this.text(title);
    		    // Remove click event to prevent multiple clicks
    		    $this.removeClass('truncated-cell').removeAttr('title');
    		});
            fetchDataAndDisplay();
 
            function fetchDataAndDisplay() {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/api/scheduledTrainings",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);
                        if (data === null || data.length === 0) {
                            // Display a message when data is null or empty
                           
                            $("#messageContainer").text("No on-going trainings available.");
                            //$("#messageContainer").css("color", "red");
                        }else{
                        	 displayTrainingData(data);
                             checkAndDisableApplyButtons();
                             $("#tab2").css("display", "block");
                        
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("API request error: " + error);
                    }
                });
            }
 
            function displayTrainingData(data) {
                var trainings = data;
                trainings.reverse();
 
                var table = document.getElementById("trainingTable");
 
                for (var i = 0; i < trainings.length; i++) {
                    var training = trainings[i];
                    var row = table.insertRow(i + 1);
                    row.insertCell(0).innerHTML = i + 1;
 
                    row.insertCell(1).innerHTML = truncateContent(training.ref_planner_id);
                    row.insertCell(2).innerHTML = truncateContent(training.tname);
                    row.insertCell(3).innerHTML = truncateContent(training.tmode);
                    row.insertCell(4).innerHTML = truncateContent(training.tdescription);
                    row.insertCell(5).innerHTML = truncateContent(training.apply_start_dt);
                    row.insertCell(6).innerHTML = truncateContent(training.apply_end_dt);
                    row.insertCell(7).innerHTML = truncateContent(training.training_start_dt);
                    row.insertCell(8).innerHTML = truncateContent(training.tstarttime);
                    row.insertCell(9).innerHTML = truncateContent(training.training_end_dt);
                    row.insertCell(10).innerHTML = truncateContent(training.tendtime);
                    row.insertCell(11).innerHTML = truncateContent(training.venue_id);
                    row.insertCell(12).innerHTML = truncateContent(training.venue_name + ', ' + training.vaddress);
                    row.insertCell(13).innerHTML = truncateContent(training.maplocation);
                    row.insertCell(14).innerHTML = truncateContent(training.coordinatorname);
                    row.insertCell(15).innerHTML = truncateContent(training.resourcetype);
 
                    var applyNowButton = document.createElement("button");
                    applyNowButton.textContent = "Apply Now";
//                    applyNowButton.className = "btn btn-success";
                   applyNowButton.className = "xyz custom-font-size";
 
                    applyNowButton.onclick = createApplyButtonClickHandler(training.ref_planner_id, training.venue_id);
 
                    var actionCell = row.insertCell(16);
                    actionCell.appendChild(applyNowButton);
                    
        
                }
            }
 
         // Function to truncate content with triple dots
            // Function to truncate content with triple dots and add onclick event
function truncateContent(content) {
    if (content.length > 25) {
        return '<span class="truncated-cell" title="' + content + '" onclick="showFullContent(this)">' + content.substr(0, 25) + '...</span>';
    } else {
        return content;
    }
}

// Function to show full content when cell is clicked
function showFullContent(element) {
    if (element.innerHTML.includes('...')) {
        element.innerHTML = element.getAttribute('title');
    }
}
         
            function createApplyButtonClickHandler(refPlannerId, venueId) {
                return function () {
                    checkApplicationStatusAndRedirect(refPlannerId, venueId);
                };
            }
 
            function checkApplicationStatusAndRedirect(refPlannerId, venueId) {
            	var elements = document.getElementsByClassName('xyz');
            	for (var i = 0; i < elements.length; i++) {
            	    elements[i].disabled = true;
            	}
            	var treasuryId = sessionStorage.getItem("treasuryId");
 
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/api/HaveAnyTrainings",
                    data: {
                        ref_planner_id: refPlannerId,
                        treasuryId: treasuryId
                    },
                    success: function (response) {
                        if (response && Array.isArray(response) && response.length !== 0) {
                            alert("You have already applied.");
                        } else {
                            redirectToApplyPage(refPlannerId, venueId);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("API request error: " + error);
                    }
                });
            }
 
            function checkAndDisableApplyButtons() {
                var treasuryId = sessionStorage.getItem("treasuryId");
                var table = document.getElementById("trainingTable");
 
                for (var i = 1; i < table.rows.length; i++) {
                    var refPlannerId = table.rows[i].cells[1].innerHTML;
                    var venueId = table.rows[i].cells[11].innerHTML;
                    
                    // Use let to declare applyNowButton
                    let applyNowButton = table.rows[i].cells[16].getElementsByTagName("button")[0];
 
                    if (treasuryId && refPlannerId) {
                        $.ajax({
                            type: "GET",
                            url: "${pageContext.request.contextPath}/api/HaveAnyTrainings",
                            data: {
                                ref_planner_id: refPlannerId,
                                treasuryId: treasuryId,
                                vid:venueId
                            },
                            success: function (response) {
                                if (response && Array.isArray(response) && response.length !== 0) {
                                    // Disable the button
                                    applyNowButton.disabled = true;
                                    
                                    applyNowButton.title = "You have already applied or nominated.";
                                  applyNowButton.classList.add("abc");
                                    applyNowButton.style.cursor="no-drop";
 
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error("API request error: " + error);
                            }
                        });
                    }
                }
            }
 
            function redirectToApplyPage(refPlannerId, venueId) {
                var applyPageUrl = '${pageContext.request.contextPath}/TrainingApplyForm.jsp';
                applyPageUrl += '?ref_planner_id=' + encodeURIComponent(refPlannerId);
 
                if (venueId !== null && venueId !== undefined) {
                    applyPageUrl += '&venue_id=' + encodeURIComponent(venueId);
                }
 
                window.location.href = applyPageUrl;
            }
        });
    </script>
 
</body>
</html>