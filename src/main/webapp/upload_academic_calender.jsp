<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>File Upload Page</title>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    
    <style>
        body {
            background-color: #f8f9fa;
            padding: 40px;
            font-family: 'Times New Roman', Times, serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #007bff;
        }
        .btn-download {
            margin-top: 20px;
            background-color: #17a2b8;
            color: #fff;
            border: none;
        }
        .btn-download:hover {
            background-color: #138496;
        }
        .file-upload {
            margin-top: 20px;
        }
        .upload-btn {
            margin-top: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
        }
        .upload-btn:hover {
            background-color: #218838;
        }
        .instructions {
            margin-top: 20px;
            font-style: italic;
            color: #6c757d;
        }
        /* Modal styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
 
/* Modal content */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto; /* 5% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 90%; /* 90% width */
    height: 90%; /* 90% height */
    overflow-x: auto; /* Enable horizontal scroll if needed */
    overflow-y: auto; /* Enable vertical scroll if needed */
}
 
/* Close button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
 
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
 
/* Scrollable content */
.scrollable {
    overflow-x: auto; /* Enable horizontal scroll if needed */
    overflow-y: auto; /* Enable vertical scroll if needed */
    max-width: 100%; /* Maximum width */
    max-height: 100%; /* Maximum height */
}
 
        
    </style>
</head>
<body>
 
<div class="container">
    <h2 class="text-center">File Upload Page</h2>
    
    <!-- Step 1: Download Template -->
    <div id="step1">
        <h4>Step 1: Download the Excel File</h4>
        <div class="col-md-4">
                       <a href="${pageContext.request.contextPath}/academic calender upload file.xlsx" download class="btn btn-info btn-download  mx-auto mb-2" >Download Template</a>
           
<%--             <a href="${pageContext.request.contextPath}/academic calender upload file.xlsx" download class="btn btn-info btn-download  mx-auto mb-2" >Download Template</a> --%>
        </div>
    </div>
 
    <!-- Step 2: Fill Data -->
    <div id="step2">
        <h4>Step 2: Fill Data in the Downloaded Excel File</h4>
        <p class="instructions">Fill in the necessary data in the downloaded Excel file.</p>
      
 
		<!-- Modal -->
<div id="previewModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <div id="previewContent" class="scrollable"></div>
  </div>
</div>
 
        <div class="col-md-4 file-upload">
            <div class="form-group">
                <label for="file" style="width: 119%;">Choose File (Upload That Excel format):</label>
                <input type="file" class="form-control-file"  id="file" name="file" onchange="previewFile()">
            </div>
            <button type="submit" id="uploadBtn" class="btn btn-primary upload-btn  btn-md mb-2" onclick="uploadFile()">Upload Training Calendar Data</button>
        </div>
    </div>
</div>
<script>
    var $j = jQuery.noConflict();
 
    $j(document).ready(function() {
        uploadFileOnReady();
    });
 
    function uploadFileOnReady() {
        console.log("Document ready. You can add your initialization logic here.");
    }
    
    function previewFile() {
        var fileInput = document.getElementById('file');
        var file = fileInput.files[0];
 
        var reader = new FileReader();
        reader.onload = function(event) {
            var data = event.target.result;
            var workbook = XLSX.read(data, { type: 'binary' });
            var sheetName = workbook.SheetNames[0];
            var sheet = workbook.Sheets[sheetName];
            var html = renderTablePreview(sheet);
            showModal(html);
        };
        reader.readAsBinaryString(file);
        
     // Clear the file input after reading the file
        //fileInput.value = null;
    }
 
    function renderTablePreview(sheet) {
        var html = '<table border="1">';
        var range = XLSX.utils.decode_range(sheet['!ref']);
        var maxRows = range.e.r;
        var maxCols = range.e.c;
 
        for (var R = 1; R <= maxRows; ++R) {
            html += '<tr>';
            for (var C = 0; C < maxCols - 1; ++C) { // Exclude the last column
                var cellAddress = { c: C, r: R };
                var cellRef = XLSX.utils.encode_cell(cellAddress);
                var cell = sheet[cellRef];
                var cellValue = cell ? cell.v : '';
                html += '<td>' + cellValue + '</td>';
            }
            html += '</tr>';
        }
        html += '</table>';
        return html;
    }
 
    function showModal(html) {
        var modal = document.getElementById('previewModal');
        var content = document.getElementById('previewContent');
        content.innerHTML = html;
 
        // Show the modal
        modal.style.display = 'block';
 
        // Close the modal when the close button or outside modal area is clicked
        var closeBtn = document.getElementsByClassName('close')[0];
        closeBtn.onclick = function() {
            modal.style.display = 'none';
        };
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        };
    }
 
    function uploadFile() {
        var fileInput = document.getElementById('file');
        var file = fileInput.files[0];
 
        var formData = new FormData();
        formData.append('file', file);
 
        $j.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/upload',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log(response);
                alert(response);
                window.location.href = "${pageContext.request.contextPath}/AcademicCalender.jsp";
            },
            error: function(error) {
                console.error(error);
                alert('File upload failed. Please try again.');
            }
        });
    }
</script>
 
 
  
<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
</body>
</html>
