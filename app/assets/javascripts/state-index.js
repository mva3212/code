$(document).ready(function () {  
    CrudStateIndex.Init();
});

var CrudStateIndex = {};

CrudStateIndex.filter = "";

CrudStateIndex.Init = function () {
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
        "sAjaxSource": "/states/getdata",
        "aaSorting":[[1,"asc"]],
        "aoColumnDefs": [ 
            { "aTargets": [0], "mDataProp": "code", "bUseRendered": false, "sName": "Code", "iDataSort ": 1, "fnRender": function(oObj) {
					 var r= '<a href='+encodeURI('/states/edit/' + oObj.aData.id) + '>' + oObj.aData.code + '</a>';
				 
					return r;
				}
			},
            { "aTargets": [1], "mDataProp": "name", "bUseRendered": false, "sName": "Name", "iDataSort ": 2 },   
			{  "aTargets": [2], "mDataProp": "country_name", "bUseRendered": false, "sName": "Country", "iDataSort ": 3 },
            {  "aTargets": [2], "mDataProp": "country_id", "bUseRendered": false, "sName": "", "iDataSort ": 3,  "fnRender": function(oObj) {
					var r = '<a class="btn" href='+encodeURI('/states/destroy/' + oObj.aData.id) + '>X</a>';
					console.log(r);
					return r;
				}
			} 
        ],
        "fnServerParams": function ( aoData ) {
            aoData.push( { "name": "Filter", "value": CrudStateIndex.filter } );
         },
         
    });
  
    CrudStateIndex.StartFilterTimer();

     $("#dataTable_filter").hide();
     $("#dataTable_length").hide();

     $('#filter-text').val("");
};

CrudStateIndex.EnactFilter = function ()
{
    var temp = $('#filter-text').val();

    console.log(temp);

    if(temp !=null && temp != CrudStateIndex.filter)
    {
        CrudStateIndex.filter = temp;

        $('#dataTable').dataTable().fnDraw();
    }
};

CrudStateIndex.StartFilterTimer = function ()
{
    setInterval("CrudStateIndex.EnactFilter()",2000);
};