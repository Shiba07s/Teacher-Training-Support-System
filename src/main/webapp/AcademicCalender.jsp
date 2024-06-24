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
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 

 
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Your custom script containing deleteTraining function -->
 
<!-- Include Bootstrap JS (after your custom script) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 
<!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous"> -->
 <!-- Include Toastr CSS and JS -->

 
 
<!-- Core theme JS (if needed) -->
<script src="js/scripts.js"></script>
 
 
<!--      ########## Data-table ########## -->
<link rel="stylesheet" type="text/css"
    href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
 
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
 
 
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<style type="text/css">
.btn{
    font-size: 14px;
}
.edit-button {
            width: 62.47px;
        }
     element.style{
     margin-left: -370px;
     }
        
        }
        
input[type=search] {
    -webkit-appearance: none;
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    color: inherit;
    margin-left: 3px;
}
div#uploadicon img {
    width: 18px;
    margin-top: 11px;
}
@media (min-width: 992px)
.col-md-1 {
    width: 1.33333%;
}
</style>
 
</head>
<body>
 
 
 
<div class="row">
    <div class="col-md-2">
        <a href="AddNewTraining.jsp" class="btn btn-success mt-2" style="margin-top: 5px;">Add New Training +</a>
    </div>
   <div id = "dtbuttons" class="col-md-3" style="margin-left: -20px;margin-top: 4px">
        </div>
        
        
   <div id="uploadicon" class="col-md-3">
<!--    <img src="./assets/uploadicon.png" alt="Upload Icon"> -->
<!--    &nbsp; -->
    <a href="${pageContext.request.contextPath}/upload_academic_calender.jsp" class="btn btn-primary mt-2" style="margin-top: 5px; margin-left:-10px;display: inline-block;">Upload Training Calender Data</a>
    </div>
    
        <div id = "dtsearchbar" class="col-md-3" style="margin-left:0px;padding:0px; margin-top: 7px; right:-100px">
        </div>
</div>
    <div class="card mt-2" style="width: 100%;">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="trainingTable"
                    style="font-size: 14px;">
                    <!-- Table headers go here -->
                    <thead class="thead-dark"
                        style="background-color: #337ab7; color: white;">
 
                        <tr>
                            <th>Sl.no.</th>
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
                            <th style="display: none;">Training Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
<script>
    document.ready(function($) {
        // Your existing code...
 
        function uploadExcel() {
            // Add the logic for uploading Excel here
 
            // Simulating a successful upload
            // Replace the following line with your actual upload logic
            console.log("File uploaded successfully");
 
            // Redirect to the next page after successful upload
            window.location.href = "${pageContext.request.contextPath}/upload_academic_calender.jsp";
        }
    });
</script>
    
   
<script>
    // Declare the editTraining function in the global scope
    function editTraining(training) {
        
//       var isConfirmed = confirm("Are you sure you want to edit this training?");
 
        // Proceed with deletion only if the user confirms
//          if (isConfirmed) {
        // Construct the URL with parameters
        var editUrl = "${pageContext.request.contextPath}/editTrainingPage.jsp" +
            "?refplannerid=" + training.refplannerid;
 
        // Redirect to the edit page
        window.location.href = editUrl;
//     }
    }
 
   
        // Execute the function on page load
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
                url: "${pageContext.request.contextPath}/api/getdata",
                dataType: "json",
                success: function (data) {
                    displayTrainingData(data);
                },
                error: function (xhr, status, error) {
                    console.error("API request error: " + error);
                    toastr.error("Failed to fetch training data");
                }
            });
        }
 
        function displayTrainingData(data) {
            var trainings = data;
            var tableBody = $("#trainingTable tbody");
 
            // Clear existing rows
            tableBody.empty();
 
            for (var i = 0; i < trainings.length; i++) {
                var training = trainings[i];
                var row = $("<tr></tr>");
                row.append("<td class='serial-column'>"+ (i + 1) + "</td>");
                row.append("<td title='" + training.refplannerid + "'>" + training.refplannerid + "</td>");
                row.append("<td title='" + training.tsubject + "'>" + training.tsubject + "</td>");
                row.append("<td title='" + training.tcategory + "'>" + training.tcategory + "</td>");
                row.append("<td title='" + training.tmode + "'>" + training.tmode + "</td>");
                row.append("<td title='" + training.ttargetgroup + "'>" + training.ttargetgroup + "</td>");
                row.append("<td title='" + training.tmonth + "'>" + training.tmonth + "</td>");
                row.append("<td title='" + training.tyear + "'>" + training.tyear + "</td>");
                row.append("<td title='" + training.tname + "'>" + training.tname + "</td>");
                row.append("<td title='" + training.tdescription + "'>" + training.tdescription + "</td>");
                row.append("<td title='" + training.tgrade + "'>" + training.tgrade + "</td>");
                row.append("<td title='" + training.tagency + "'>" + training.tagency + "</td>");
                row.append("<td title='" + training.tspell + "'>" + training.tspell + "</td>");
                row.append("<td title='" + training.preferdlocation + "'>" + training.preferdlocation + "</td>");
                row.append("<td title='" + training.numberofstakeholder + "'>" + training.numberofstakeholder + "</td>");
                row.append("<td title='" + training.numberdayneeded + "'>" + training.numberdayneeded + "</td>");
                row.append("<td title='" + training.thoursperday + "'>" + training.thoursperday + "</td>");
                row.append("<td title='" + training.totalhours + "'>" + training.totalhours + "</td>");
                row.append("<td title='" + training.trainingregstartdt + "'>" + training.trainingregstartdt + "</td>");
                row.append("<td title='" + training.trainingregenddt + "'>" + training.trainingregenddt + "</td>");
                row.append("<td style='display: none;' title='" + training.tstatus + "'>" + training.tstatus + "</td>");
 
                var currentDate = new Date(); // Get the current date
                 
                                if (currentDate >= new Date(training.trainingregstartdt) && currentDate <= new Date(training.trainingregenddt)) {
                                    // Current date is between trainingregstartdt and trainingregenddt
                                    row.append("<td><button class='btn btn-primary btn-sm edit-button' onclick='editTraining(" + JSON.stringify(training) + ")'>Edit</button></td>");
                                } else {
                                    // Current date is outside trainingregstartdt and trainingregenddt
                                    row.append("<td><button class='btn btn-primary btn-sm edit-button' onclick='editTraining(" + JSON.stringify(training) + ")'>Edit</button><button class='btn btn-danger btn-sm' onclick='deleteTraining(this," + training.refplannerid + ")'>Delete</button></td>");
                                } 
                tableBody.append(row);
            }
            var dataTable = $('#trainingTable').DataTable({
                paging: true,
                columnDefs: [{
                    targets: '_all',
                    render: function(data, type, row, meta) {
                        if (meta.col !== 1 && meta.col < (meta.settings.aoColumns.length - 1)) {
                            if (type === 'display' && data && data.length > 25) {
                                return '<span class="truncated-cell" title="' + data + '">' + data.substr(0, 25) + '...</span>'; // Display truncated text with triple dots in UI
                            } else {
                                return data;
                            }
                        } else {
                            return data;
                        }
                    }
                }],
                dom: 'lBfrtip',
                buttons: [
                    {
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'A3',
                        customize: function(doc) {
                            doc.defaultStyle.fontSize = 9;
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
                                rowData.splice(-2); // Remove the last column from each row
                            }
                        }
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
                            $('row', sheet).each(function() {
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
                                });
                                $(this).find('c:last').remove();
                                $(this).find('c:last').remove();
                            });

                        }
                    }
                ],
                autoWidth: false
            });
            $('.dt-buttons').appendTo('#dtbuttons');
            $('.dataTables_filter').appendTo('#dtsearchbar');
            
            $('.dt-buttons').addClass('btn-group').css({'font-size':'14px','margin-left':'20px','position':'sticky'});
            $('.buttons-excel, .buttons-pdf').addClass(
                    'btn btn-primary btn-blue').css('width', '100px');
            $('.btn-blue').css('background-color', '#63f542');
            
        }
 
     // Sample function for delete
       function deleteTraining(button,refplannerid) {
 
            var isConfirmed = confirm("Are you sure you want to delete this training?");
 
            // Proceed with deletion only if the user confirms
            if (isConfirmed) {
                // Make an AJAX request to the delete endpoint
 
                $.ajax({
                    type : "POST",
                    url : "${pageContext.request.contextPath}/api/deactivate",
                    data : {
                        refplannerid : refplannerid
                    },
 
                    success : function(response) {
                        var table = $('#trainingTable').DataTable();
                        var row = $(button).closest('tr');
                        table.row(row).remove().draw(false);
                        updateSerialNumbers();
                        toastr.success("Training deleted successfully");
                        // Reload or update the data after deletion
                        //fetchDataAndDisplay();
                    },
                    error : function(xhr, status, error) {
                        toastr.error("Failed to delete training: " + error);
                    }
                });
            }
        }
        
        function updateSerialNumbers() {
            var table = $('#trainingTable').DataTable();
            var rows = table.rows().nodes();
            $(rows).each(function(index, row) {
                $(row).find('.serial-column').text(index + 1);
            });
        }
   
</script>
 
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- Toastr CSS and JS links go here -->
</body>
</html>
