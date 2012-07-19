$(document).ready(function () {  
    CrudClimateIndex.Init();
});

var CrudClimateIndex = {};

CrudClimateIndex.filter = "";

CrudClimateIndex.Init = function () {
    //Activate Tab
    //NavLinks.Activate("admin", "main");
    //NavLinks.Activate("staff", "admin-datatable"); 
 
    //set up data table
	
	console.log($("#dataTable"));
    $('#dataTable').dataTable({
        "fnDrawCallback": function ( oSettings ) {
            
        },
        "bProcessing": false,
        "sPaginationType": "bootstrap",
        "bServerSide": true,
        "sAjaxSource": "/climates/getdata",
        "aaSorting":[[1,"asc"]],
        "aoColumnDefs": [ 
            { "aTargets": [0], "mDataProp": "code", "sName": "Code", "iDataSort ": 1 },
            { "aTargets": [1], "mDataProp": "name", "sName": "Name", "iDataSort ": 2 },
            { "aTargets": [2], "mDataProp": "description", "sName": "Description", "iDataSort ": 3 },
        ],
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "Filter", "value": CrudClimateIndex.filter } );
         },
         
    });
  
    CrudClimateIndex.StartFilterTimer();

     $("#dataTable_filter").hide();
     $("#dataTable_length").hide();

     $('#climate-filter-text').val("");
};

CrudClimateIndex.EnactFilter = function ()
{
    var temp = $('#climate-filter-text').val();

    console.log(temp);

    if(temp !=null && temp != CrudClimateIndex.filter)
    {
        CrudClimateIndex.filter = temp;

        $('#dataTable').dataTable().fnDraw();
    }
};

CrudClimateIndex.StartFilterTimer = function ()
{
    setInterval("CrudClimateIndex.EnactFilter()",2000);
};