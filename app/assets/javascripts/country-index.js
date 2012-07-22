$(document).ready(function () {  
    CrudCountryIndex.Init();
});

var CrudCountryIndex = {};

CrudCountryIndex.filter = "";

CrudCountryIndex.Init = function () {
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
        "sAjaxSource": "/countries/getdata",
        "aaSorting":[[1,"asc"]],
        "aoColumnDefs": [ 
            { "aTargets": [0], "mDataProp": "code", "bUseRendered": false, "sName": "Code", "iDataSort ": 1, "fnRender": function(oObj) {
					 var r= '<a href='+encodeURI('/countries/edit/' + oObj.aData.id) + '>' + oObj.aData.code + '</a>';
				 
					return r;
				}
			},
            { "aTargets": [1], "mDataProp": "name",  "bUseRendered": false, "sName": "Name", "iDataSort ": 2 },
            {  "aTargets": [2], "mDataProp": "name", "bUseRendered": false, "sName": "", "iDataSort ": 3,  "fnRender": function(oObj) {
					var r = '<a class="btn" href='+encodeURI('/countries/destroy/' + oObj.aData.id) + '>X</a>';
					console.log(r);
					return r;
				}
			} 
        ],
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "Filter", "value": CrudCountryIndex.filter } );
         },
         
    });
  
    CrudCountryIndex.StartFilterTimer();

     $("#dataTable_filter").hide();
     $("#dataTable_length").hide();

     $('#filter-text').val("");
};

CrudCountryIndex.EnactFilter = function ()
{
    var temp = $('#filter-text').val();

    console.log(temp);

    if(temp !=null && temp != CrudCountryIndex.filter)
    {
        CrudCountryIndex.filter = temp;

        $('#dataTable').dataTable().fnDraw();
    }
};

CrudCountryIndex.StartFilterTimer = function ()
{
    setInterval("CrudCountryIndex.EnactFilter()",2000);
};