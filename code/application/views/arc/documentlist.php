<?php //print_r($enquiries) //foreach ($enquiries as $enquiry): ?>

<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/themes/base/jquery-ui.css" type="text/css" media="all" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
<link type="text/css" href="<?php echo base_url()?>jqgrid/css/ui.jqgrid.css" rel="stylesheet" />
<link type="text/css" href="<?php echo base_url()?>jqgrid/css/jquery.searchFilter.css" rel="stylesheet" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>jqgrid/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>jqgrid/jquery.layout.js"></script>



<style>
body.modal-open{
    width:100%!important;
    padding-right:0!important;
    overflow-y:scroll!important;
    position:fixed!important;
}
</style>

<?php
  $ci =& get_instance();
  $base_url = base_url();
?>
<div id="error-message" class="alert alert-danger" style="display: none"></div>
<div id="success-message" class="alert alert-success" style="display: none"></div>
<table id="listtable"></table>
<div id="plisttable"></div>

<br />

<input type="button" value="Edit in Batch Mode" onclick="startEdit()" />
<input type="button" value="Save All Rows" onclick="saveRows()" />
<input type="button" value="Cancel Edit" onclick="cancelEdit()" />

<script type="text/javascript">
       $(document).ready(function () {


var lastsel2; 
jQuery("#listtable").jqGrid({
  url:'<?php echo $base_url.'index.php/arc/loadDocumentsData'?>',
  mtype : "post", 
  datatype: "json",
  height: 'auto',
  rowNum: 9,
  rowList: [3,6,9],
    colNames:['Document ID','Stdent ID', 'Document Name', 'Document Type','Center Code','Status','Created By','Action'],
    colModel:[
      {name:'row_id',index:'row_id', width:60, sorttype:"int"},
      {name:'student_id',index:'student_id', width:90, sorttype:"text", formatter:"text"},
      {name:'document_name',index:'document_name', width:100},
      {name:'document_type',index:'document_type', width:80, align:"right",sorttype:"text", formatter:"text"},
      {name:'center_code',index:'center_code', width:80, align:"right",sorttype:"text"},    
      {name:'status',index:'status', width:150, editable:true, edittype:"checkbox",editoptions: {value:"approved:A"}},
      {name:'created_by',index:'created_by', width:80,align:"right",formatter:"text"} ,
      {name:'update_document',index:'update_document', width:80,align:"right",formatter:viewDocs}  
    ],
    /*
    onSelectRow: function(id) {
      var s;
      s = jQuery("#listtable").jqGrid('getGridParam','selarrrow');
      alert('------------' + s);
      if(id && id!==lastsel2){
        jQuery('#listtable').jqGrid('restoreRow',lastsel2);
        jQuery('#listtable').jqGrid('editRow',id,true);
        lastsel2=id;
      }
    },
    */
    editurl: "<?php echo $base_url.'index.php/arc/Document_update'?>",
    postData:{q:1},
    pager: "#plisttable",
    viewrecords: true,
    sortname: 'id',
    grouping:true,
    groupingView : {
      groupField : ['student_id'],
      groupColumnShow : [true],
      groupText : ['<b>{0} - {1} Item(s)</b>'],
    groupOrder: ['desc']      
    },
    multiselect: true,
    caption: "Document Data",
    onCellSelect: function(rowid, iCol, cellcontent, e){ 
        if (rowid && iCol == 8) {
                    $.ajax({
                        url: "<?php echo $base_url . 'index.php/arc/getUploadDoc' ?>",
                        type: "POST",
                        data: {'document_id': rowid},
                        dataType: 'html',
                        success: function (resultdata) {
                            $("#studentData").html(resultdata);
                            $("#studentModal").modal('show');
                        }
                    });
                } else if (rowid && iCol == 4) {
                    $.ajax({
                        url: "<?php echo $base_url . 'index.php/arc/getStudentDocs' ?>",
                        type: "POST",
                        data: {'student_id': rowid},
                        dataType: 'html',
                        success: function (resultdata) {
                            $("#studentData").html(resultdata);
                            showSlides(1);
                            $("#studentModal").modal('show');
                        }
                    });
                }
    }
});
jQuery("#listtable").jqGrid('navGrid','#plisttable',{add:true,edit:true,del:true});



      });
      function viewDocs (cellvalue, options, rowObject)
		{
		   return 'Update Document';
		}
  function startEdit() {
      var grid = $("#listtable");
      var selectedRecords;
      selectedRecords = jQuery("#listtable").jqGrid('getGridParam','selarrrow');

      var ids = grid.jqGrid('getDataIDs');

      for (var i = 0; i < selectedRecords.length; i++) {
          grid.jqGrid('editRow',selectedRecords[i]);
      }
  };

  function saveRows() {
       var grid = $("#listtable");
      var ids = grid.jqGrid('getDataIDs');

      for (var i = 0; i < ids.length; i++) {
          grid.jqGrid('saveRow', ids[i]);
      }
  }

  function cancelEdit() {
      var grid = $("#listtable");
      var ids = grid.jqGrid('getDataIDs');

      for (var i = 0; i < ids.length; i++) {
          grid.jqGrid('restoreRow', ids[i]);
      }
  }
   function UploadImage(){
       var formData = new FormData($("#docData")[0]);
        $.ajax({
            url: "<?php echo $base_url . 'index.php/arc/updatedoc' ?>",
            type: "POST",
            data: formData,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function(data) {
                $('#studentModal').modal('hide');
                if (data.success == '1') {
                    $('#success-message').show();
                    $('#success-message').text(data.msg);
                }
                else {
                    $('#error-message').show();
                    if(data.msg != ''){
                        $('#error-message').text(data.msg);
                    }else{
                        $('#error-message').text('Error Uploading File');
                    }
                }
                setTimeout(hideMsg,10000);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.status);
            }
        });
        return false;

   }
   function hideMsg(){
$('#error-message').hide();
$('#success-message').hide();
}

    </script>

    <!-- Modal -->
  <div class="modal fade" id="studentModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button> 
          <h4 class="modal-title">Student Information</h4>        
        </div>
        <div id="studentData" class="modal-body">
          
        </div>
      </div>
    </div>
  </div