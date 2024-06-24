<%@ page language="java" contentType="text/html; charset=UTF-8"

   pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<meta name="description" content="" />

<meta name="author" content="" />

   <title>TTSS</title>

   <!-- Favicon-->

   <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />


   <!-- Bootstrap CSS -->

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"

       integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"

       crossorigin="anonymous">


   <!-- jQuery -->

   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


   <!-- Toastr CSS/JS -->

   <link rel="stylesheet" type="text/css"

       href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

   <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>


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



<style>



.row1 {

   --bs-gutter-x: 1.5rem;

   --bs-gutter-y: 0;

   display: flex;

   margin-top: calc(-1* var(--bs-gutter-y));

   margin-right: calc(-0.5* var(--bs-gutter-x));

   margin-left: calc(-0.5* var(--bs-gutter-x));

}

/* Remove date format from input */


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

.maindiv {

padding: 20px;

} 

.content {

background-color: #fff;

border: 1px solid;

overflow-x: auto;

font-size: 10px;

width: 185%;

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

  $(document).ready(function () {

  //fetchtname();

  

  $('#tnamesbar').on('change', function() {

       // Retrieve the selected value from the dropdown

//         $('#vnamesbar').empty();

// $('#distbar').empty();

// $('#desgbar').empty();

       var selectedValue = $(this).val();

       

//         var selectedOptionId = $(this).find(':selected').attr('id');

//         if (selectedOptionId === "selectalltraining") {

//         $.ajax({

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



// $('#vnamesbar').append($('<option>', {

//        value: '',

//        text: 'Select Venue',

//        disabled: true,

//        selected: true

//    }));



//    $('#distbar').append($('<option>', {

//        value: '',

//        text: 'Select District',

//        disabled: true,

//        selected: true

//    }));



//    $('#desgbar').append($('<option>', {

//        value: '',

//        text: 'Select Designation',

//        disabled: true,

//        selected: true

//    }));

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



//        // Move the DataTables filter element to #sbar

//        $('#admintid_filter').detach();



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

// $('#distbar').append($('<option>', {

//        value: '',

//        text: 'Select District',

//        disabled: true,

//        selected: true

// }));


   searchApi($('#tnamesbar').val(),$('#vnamesbar').val(),$('#distbar').val(),$('#desgbar').val());




// if (selectedTname !== null && selectedTname !== '') {

// $.ajax({

//            url: '${pageContext.request.contextPath}/api/mytrainings/tnamevenuedistrics',

//            method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//            data: { vid: selectedValue }, // Pass any data needed for the API call

//            success: function(response) {

//             console.log(response);

//                 response.forEach(function(item) {

//                 if (item !== null && !uniqueDistricts.includes(item.trim())) {

//                 uniqueDistricts.push(item.trim());

//                        $('#distbar').append($('<option>', {

//                            value: item.trim(),

//                            text: item.trim()

//                        }));

//                    }

// }); 

              

//                // You can perform further actions here based on the response

//            },

//            error: function(xhr, status, error) {

//                // Handle any errors that occur during the API call

//                console.error(status, error);

//            }

//        });


// $.ajax({

//            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevname',

//            method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//            data: { ref_planner_id: $('#tnamesbar').val(),

//                vid: selectedValue,

//                appliedtype: 'self' 

//                 }, // Pass any data needed for the API call

//            success: function(response) {

//             console.log(response);

//             $('#admintid_length').detach();



//        // Move the DataTables filter element to #sbar

//        $('#admintid_filter').detach();

//                displayTrainingData(response);

//            },

//            error: function(xhr, status, error) {

//                // Handle any errors that occur during the API call

//                console.error(status, error);

//            }

//        });

// }else {

// $.ajax({

//            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbyvname',

//            method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//            data: { vid: selectedValue,

//                appliedtype: 'self' 

//                 }, // Pass any data needed for the API call

//            success: function(response) {

//             console.log(response);

//             $('#admintid_length').detach();



//        // Move the DataTables filter element to #sbar

//        $('#admintid_filter').detach();

//                displayTrainingData(response);

//            },

//            error: function(xhr, status, error) {

//                // Handle any errors that occur during the API call

//                console.error(status, error);

//            }

//        });

// }


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



//        $.ajax({

//            url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingtnamevnamedist',

//            method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//            data: { ref_planner_id: $('#tnamesbar').val(),

//                vid: $('#vnamesbar').val(),

//                district_name : selectedValue,

//                appliedtype: 'self' 

//            }, // Pass any data needed for the API call

//            success: function(response) {

//             console.log(response);

//             $('#admintid_length').detach();


//        // Move the DataTables filter element to #sbar

//        $('#admintid_filter').detach();

//                displayTrainingData(response);

//            },

//            error: function(xhr, status, error) {

//                // Handle any errors that occur during the API call

//                console.error(status, error);

//            }

//        });

//          }else{

//         $.ajax({

//              url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydistrict',

//              method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//              data: {

//                  district_name : selectedValue,

//                  appliedtype: 'self' 

//              }, // Pass any data needed for the API call

//              success: function(response) {

//               console.log(response);

//               $('#admintid_length').detach();


//          // Move the DataTables filter element to #sbar

//          $('#admintid_filter').detach();

//                  displayTrainingData(response);

//              },

//              error: function(xhr, status, error) {

//                  // Handle any errors that occur during the API call

//                  console.error(status, error);

//              }

//          });

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

//             console.log(response);

//             $('#admintid_length').detach();



//          // Move the DataTables filter element to #sbar

//          $('#admintid_filter').detach();

//                 displayTrainingData(response);

//             },

//             error: function(xhr, status, error) {

//                 // Handle any errors that occur during the API call

//                 console.error(status, error);

//             }

//         });

//      }else{

//     $.ajax({

//              url: '${pageContext.request.contextPath}/api/mytrainings/searchtrainingbydesignation',

//              method: 'GET', // Specify the HTTP method (GET, POST, etc.)

//              data: {

//                  designation : selectedValue,

//                  appliedtype: 'self' 

//              }, // Pass any data needed for the API call

//              success: function(response) {

//               console.log(response);

//               $('#admintid_length').detach();



//          // Move the DataTables filter element to #sbar

//          $('#admintid_filter').detach();

//                  displayTrainingData(response);

//              },

//              error: function(xhr, status, error) {

//                  // Handle any errors that occur during the API call

//                  console.error(status, error);

//              }

//          });

//      }

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

  

              $.ajax({

                  type: "GET",

                  url: "${pageContext.request.contextPath}/api/approved-data",

                  dataType: "json",

                  success: function (data) {

                      displayTrainingData(data);

                      showDropdowns(data);

                  },

                  error: function (xhr, status, error) {

                      console.error("API request error: " + error);

                  }

         

                  

              });

              

//                function fetchtname(){

//               $.ajax({

//                        type: "GET",

//                        url: '${pageContext.request.contextPath}/api/mytrainings/tnamebystatus',

//                        data: { status: 'approved' }, // Correct data object syntax

//                        dataType: "json",

//                        success: function (response) {

                          

//                        },

//                        error: function (xhr, status, error) {

//                            console.error("API request error: " + error);

//                        }

//                    });

//                }




              function searchApi(tnamesbar,vnamesbar,distbar,desgbar){

              $.ajax({

                      url: '${pageContext.request.contextPath}/api/mytrainings/filterbasedonchange',

                      method: 'GET', // Specify the HTTP method (GET, POST, etc.)

                      data: { 

                          ref_planner_id: $('#tnamesbar').val(),

                          vid: $('#vnamesbar').val(),

                          district_name: $('#distbar').val(),

                          designation: $('#desgbar').val(),

                          status:'approved',

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

           

              function displayTrainingData(data) {

              if ($.fn.DataTable.isDataTable('#AdminId')) {

   // Destroy the DataTable

   $('#AdminId').DataTable().destroy();

   $('#length').detach(); // Detach element with ID 'length'

   $('#sbar').detach();

}

                  var tableBody = $("#AdminId tbody");

                  tableBody.empty();

                  for (var i = 0; i < data.length; i++) {

                      var trainings = data[i];

                      var row = $("<tr></tr>");

                      row.append("<td class='serial-column'>" + (i + 1) + "</td>");

                     // row.append('<td><input type="checkbox" class="approveCheckbox" data-treasuryid="' + trainings.TreasuryId + '" data-trainingname="' + trainings.TrainingName + '"></td>');

row.append("<td>" + (trainings.treasuryid ? trainings.treasuryid : '') + "</td>");

row.append("<td>" + (trainings.teacher_name ? trainings.teacher_name : '') + "</td>");

row.append("<td>" + (trainings.mobilenumberteacher ? trainings.mobilenumberteacher : '') + "</td>");

row.append("<td>" + (trainings.tname ? trainings.tname : '') + "</td>");

row.append("<td>" + (trainings.ref_planner_id ? trainings.ref_planner_id : '') + "</td>");

row.append("<td>" + ((trainings.vname && trainings.vaddress) ? (trainings.vname + ',' + trainings.vaddress) : '') + "</td>");

row.append("<td>" + (trainings.vid ? trainings.vid : '') + "</td>");

row.append("<td>" + (trainings.designation ? trainings.designation : '') + "</td>");



var dobParts = (trainings.dob && trainings.dob.split("-")) || [];

var dob = dobParts.length === 3 ? new Date(dobParts[2], dobParts[1] - 1, dobParts[0]) : null;


// Check if dob is not null before using it

if (dob !== null) {

   // Calculate age based on DOB

   var today = new Date();

   var age = today.getFullYear() - dob.getFullYear();

   // Adjust age if birthday hasn't occurred yet this year

   if (today.getMonth() < dob.getMonth() ||

       (today.getMonth() === dob.getMonth() && today.getDate() < dob.getDate())) {

       age--;

   }

   row.append("<td>" + age + " years</td>");

} else {

   // Handle the case where dob is null (e.g., display an alternative value)

   row.append("<td>N/A</td>");

}

row.append("<td>" + (trainings.district_name ? trainings.district_name : '') + "</td>");

row.append("<td>" + (trainings.school_code ? trainings.school_code : '') + "</td>");

row.append("<td>" + (trainings.tmode ? trainings.tmode : '') + "</td>");

row.append("<td>" + (trainings.resourcetype ? trainings.resourcetype : '') + "</td>");

row.append("<td>" + (trainings.tdescription ? trainings.tdescription : '') + "</td>");


var appliedDateTime = new Date(trainings.applydateandtime);

       if (!isNaN(appliedDateTime.getTime())) {

           // Create a human-readable timestamp

           var options = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', timeZoneName: 'short' };

           var formattedDateTime = new Intl.DateTimeFormat('en-US', options).format(appliedDateTime);

           row.append("<td>" + formattedDateTime + "</td>");

       } else {

           // Handle the case where applydateandtime is not a valid date string

           row.append("<td>Invalid Date</td>");

       }


       row.append("<td>" + (trainings.appliedtype ? trainings.appliedtype : '') + "</td>");

       row.append("<td>" + (trainings.secondlevelapproval ? trainings.secondlevelapproval : '') + "</td>");


 tableBody.append(row);

                  }


                  // Your existing DataTable initialization code

                  var dataTable = $('#AdminId').DataTable({

                  "columnDefs": [{

                          "targets": '_all', // Apply to all columns

                          "render": function(data, type, row, meta) {

                              // Check if it's not the second column or the last column

                              if (meta.col < (meta.settings.aoColumns.length)) {

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

           $('#AdminId').DataTable().rows().every(function(rowIdx, tableLoop, rowLoop) {

               var rowData = this.data();

               $(rowData).each(function(colIdx) {

                var cellData = rowData[colIdx];

                rows[rowIdx + 1][colIdx].text = cellData;

               });

           });

           var rowCount = doc.content[1].table.body.length;

//            for (var i = 0; i < rowCount; i++) {

//                var rowData = doc.content[1].table.body[i];

//                rowData.splice(1, 1); // Remove the second column

//                rowData.splice(-1, 1); // Remove the last column

//            }

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

                           

//                                 $(this).attr('r', 'C' + (index + 1));



                       });

                       



                    });



                   }

               }

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

      </script>

      <div class="row1 custom-font-size" id="row2">

   

   <div id="tsbar" class="col-md-3 custom-font-size" style="margin-top: 5px;">

       <label for="tnamesbar">Training Name</label>

           <select id="tnamesbar" class="custom-select"><option id="selectalltraining" value="null">Select All Training</option></select>

  </div>

   <div id="vsbar" class="col-md-3 custom-font-size" style="margin-top: 5px;">

       <label for="vnamesbar">Venue Name</label>

           <select id="vnamesbar" class="custom-select"><option id="selectallvenue" value="null">Select All Venue</option></select>

   </div>

   <div id="dist" class="col-md-3 custom-font-size" style="margin-top: 5px;">

       <label for="distbar">District</label>

           <select id="distbar" class="custom-select"><option id="selectalldistrict" value="null">Select All District</option></select>

   </div>

   <div id="desg" class="col-md-3 custom-font-size" style="margin-top: 5px;">

       <label for="desgbar">Designation</label>

           <select id="desgbar" class="custom-select"><option id="selectalldesignation" value="null">Select All Designation</option></select>

   </div>

   

</div>

<div class="maindiv">

<div class="content">

<div class="formheading">

<h1 class="h2">Approved Training</h1>

</div>

<div class="table-container">

<table id="AdminId">

<thead>

<tr>

<th>Sl No</th>

<!-- <th>Action</th> -->

<th>Treasury Id</th>

<th>Teacher Name</th>

<th>Mobile No</th>

<th>Training Name</th>

<th>Ref Planner Id</th>

<th>Venue details</th>

<th>Venue Id</th>

<th>Designation</th>

<th>Age</th>

<th>District</th>

<th>School Udise</th>

<th>Training Mode</th>

<th>Resource Type</th>

<th>Training Description</th>

<th>Apply Date</th>

<th>Apply Type</th>

<th>Remark</th>

</tr>

</thead>

<tbody>

</tbody>

</table>

</div>

</div>

</div>

<!-- Bootstrap core JS-->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->


<script src="js/scripts.js"></script>

</body>



</html>