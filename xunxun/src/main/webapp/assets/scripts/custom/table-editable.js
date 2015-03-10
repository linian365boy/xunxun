var TableEditable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="form-control input-small" name="resourceName[' + nRow.rowIndex + ']" value="' + aData[0] + '">';
                //jqTds[1].innerHTML = '<input type="text" class="form-control input-small" name="resourceType[' + nRow.rowIndex + ']" value="' + aData[1] + '">';
                jqTds[1].innerHTML = '<select class="form-control input-small" ><option value="action" selected>Action</option><option value="url">URL</option></select>';
                jqTds[2].innerHTML = '<input type="text" class="form-control input-middle" name="resourceUrl[' + nRow.rowIndex + ']" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="form-control input-small" name="resourceDesc[' + nRow.rowIndex + ']" value="' + aData[3] + '">';
                //jqTds[4].innerHTML = '<input type="text" class="form-control input-small" name="enabled[' + nRow.rowIndex + ']" value="' + aData[4] + '">';
                jqTds[4].innerHTML = '<select class="form-control input-small" ><option value="1" selected>是</option><option value="0">否</option></select>';
                //jqTds[5].innerHTML = '<input type="text" class="form-control input-small" name="defaults[' + nRow.rowIndex + ']" value="' + aData[5] + '">';
                jqTds[5].innerHTML = '<select class="form-control input-small" ><option value="false" selected>否</option><option value="true">是</option></select>';
                jqTds[6].innerHTML = '<input type="text" class="form-control input-small" name="moduleId[' + nRow.rowIndex + ']" value="' + aData[6] + '">';
                //jqTds[7].innerHTML = '<input type="text" class="form-control input-small" name="showInMenu[' + nRow.rowIndex + ']" value="' + aData[7] + '">';
                jqTds[7].innerHTML = '<select class="form-control input-small" ><option value="false" selected>否</option><option value="true">是</option></select>';
                jqTds[8].innerHTML = '<a class="edit" href="">Save</a>';
                jqTds[9].innerHTML = '<a class="cancel" href="">Cancel</a>';
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                var jqSelects = $('select', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqSelects[0].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 3, false);
                oTable.fnUpdate(fromBool(jqSelects[1].value), nRow, 4, false);
                oTable.fnUpdate(fromBool(jqSelects[2].value), nRow, 5, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);
                oTable.fnUpdate(fromBool(jqSelects[3].value), nRow, 7, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 8, false);
                oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 9, false);
                oTable.fnDraw();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                var jqSelects = $('select', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqSelects[0].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 3, false);
                oTable.fnUpdate(fromBool(jqSelects[1].value), nRow, 4, false);
                oTable.fnUpdate(fromBool(jqSelects[2].value), nRow, 5, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 6, false);
                oTable.fnUpdate(fromBool(jqSelects[3].value), nRow, 7, false);
                oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 8, false);
                oTable.fnDraw();
            }

            var oTable = $('#sample_editable_1').dataTable({
                "aLengthMenu": [
                    [5, 10, 20, -1],
                    [5, 10, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 10,
                
                "sPaginationType": "bootstrap",
                "oLanguage": {
//                    "sLengthMenu": "_MENU_ records",
//                    "oPaginate": {
//                        "sPrevious": "Prev",
//                        "sNext": "Next"
//                    }
                	"sProcessing" : "正在加载数据...",
                    "sLengthMenu" : "显示_MENU_条 ",
                    "sZeroRecords" : "没有您要搜索的内容",
                    "sInfo" : "从_START_ 到 _END_ 条记录——总记录数为 _TOTAL_ 条",
                    "sInfoEmpty" : "记录数为0",
                    "sInfoFiltered" : "(全部记录数 _MAX_  条)",
                    "sInfoPostFix" : "",
                    "sSearch" : "搜索",
                    "sUrl" : "",
                    "oPaginate" : {
                      "sFirst" : "第一页",
                      "sPrevious" : " 上一页 ",
                      "sNext" : " 下一页 ",
                      "sLast" : " 最后一页 "
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("form-control input-medium input-inline"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("form-control input-small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialize select2 dropdown

            var nEditing = null;

            $('#sample_editable_1_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '', '', '', '', '', '', '',
                        '<a class="edit" href="">Edit</a>', '<a class="cancel" data-mode="new" href="">Cancel</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editRow(oTable, nRow);
                nEditing = nRow;
            });

            $('#sample_editable_1 a.delete').live('click', function (e) {
                e.preventDefault();

                if (confirm("Are you sure to delete this row ?") == false) {
                    return;
                }

                var nRow = $(this).parents('tr')[0];
                var id = nRow.id;
                $.dialog.confirm('你确定要删除这条资源吗？', function(){
            		$.ajax({
                        type:"post",
                        dataType:"text",
                        url: ctx + '/resources/delete?resourceId=' + id,
                        success: function(msg){
                        	//$('#tr'+id).remove();
                        	oTable.fnDeleteRow(nRow);
                        },
                        error: function (msg) {
                            alert(msg.responseText);
                        }
                    });
            		//var nRow = $(this).parents('tr')[0];
            		//oTable.fnDeleteRow(nRow);
            	}, function(){
            	    $.dialog.tips('您放弃删除。');
            	});
//                var nRow = $(this).parents('tr')[0];
//                oTable.fnDeleteRow(nRow);
//                alert("Deleted! Do not forget to do some ajax to sync with backend :)");
            });

            $('#sample_editable_1 a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#sample_editable_1 a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                } else if (nEditing == nRow && this.innerHTML == "Save") {
                    /* Editing this row and want to save it */
                    saveRow(oTable, nEditing);
                    nEditing = null;
                    var aData = oTable.fnGetData(nRow);
                    
                    var json = '{';
                    json += '"resourceName":"' + aData[0] + '",';
                    json += '"resourceType":"' + aData[1] + '",';
                    json += '"resourceUrl":"' + aData[2] + '",';
                    json += '"resourceDesc":"' + aData[3] + '",';
                    json += '"enabled":' + toBool(aData[4], 1) + ',';
                    json += '"defaults":' + toBool(aData[5]) + ',';
                    json += '"moduleId":' + aData[6] + ',';
                    json += '"showInMenu":' + toBool(aData[7]);
                    json += '}'
                    $.ajax({
                        type:"post",
                        contentType: "application/json",
                        dataType:"json",
                        data:json,
                        url: ctx + '/resources/save',
                        success: function(msg){
                        	//alert('success');
                        	nRow.id = msg;
                        	//$(nRow).attr('id', msg);//这个也可以
                        },
                        error: function (msg) {
                            alert(msg.responseText);
                        }
                    });
                    //alert("Updated! Do not forget to do some ajax to sync with backend :)");
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                }
            });
        }

    };

}();