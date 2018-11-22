﻿<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>${setting.siteName} - subject管理</title>
    <meta name="keywords" content="${setting.siteName}">
    <meta name="description" content="${setting.siteName}">

    <!-- BEGIN HEADER -->
		[#include "/admin/include/style.ftl"]
    <!-- END HEADER -->
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <form id="listForm" action="list.jhtml" method="get">
                    <div class="ibox-title">
                        <h5>subject管理 </h5>
                        <div class="ibox-tools">
                            <a class="btn btn-outline btn-success btn-xs" id="btn-add-loippi"
                               href="javascript:to_add()"><i
                                    class="fa fa-plus"></i> 新增</a>
                            <a class="btn btn-outline btn-danger btn-xs btn-delete-loippi-group2"
                               href='javascript:dels()'><i class="fa fa-trash"></i> 删除</a>

                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">

                            <div id="filter-div-id" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入" name="filter_ids" id="filter_ids"
                                           class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入" name="filter_ide" id="filter_ide"
                                           class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-sId" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入" name="filter_sIds" id="filter_sIds"
                                           class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入" name="filter_sIde" id="filter_sIde"
                                           class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-type" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入1、书籍 2、动画 3、音乐 4、游戏 6、三次元" name="filter_types"
                                           id="filter_types" class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入1、书籍 2、动画 3、音乐 4、游戏 6、三次元" name="filter_typee"
                                           id="filter_typee" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-typeName" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入类型名称" name="filter_typeName" id="filter_typeName"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-name" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入名称" name="filter_name" id="filter_name"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-nameCn" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入name_cn" name="filter_nameCn" id="filter_nameCn"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-summary" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入概况" name="filter_summary" id="filter_summary"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-image" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入封面" name="filter_image" id="filter_image"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-epsCount" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入话数" name="filter_epsCounts" id="filter_epsCounts"
                                           class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入话数" name="filter_epsCounte" id="filter_epsCounte"
                                           class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-airDate" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入放送开始" name="filter_airDate" id="filter_airDate"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-airWeekday" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入放送星期" name="filter_airWeekdays"
                                           id="filter_airWeekdays" class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入放送星期" name="filter_airWeekdaye"
                                           id="filter_airWeekdaye" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-endDate" class="col-sm-3 m-b-xs">
                                <input type="text" placeholder="请输入播放结束" name="filter_endDate" id="filter_endDate"
                                       class="input-sm form-control">
                            </div>


                            <div id="filter-div-lockStatus" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入锁定状态  1正常 2锁定" name="filter_lockStatuss"
                                           id="filter_lockStatuss" class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入锁定状态  1正常 2锁定" name="filter_lockStatuse"
                                           id="filter_lockStatuse" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-createtime" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入" name="filter_createtimes"
                                           id="filter_createtimes" class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入" name="filter_createtimee"
                                           id="filter_createtimee" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-updatetime" class="col-sm-3 m-b-xs">
                                <div class="input-group">
                                    <input type="text" placeholder="请输入" name="filter_updatetimes"
                                           id="filter_updatetimes" class="input-sm form-control  ">
                                    <span class="input-group-addon">--</span>
                                    <input type="text" placeholder="请输入" name="filter_updatetimee"
                                           id="filter_updatetimee" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-createTime" class="col-sm-3 m-b-xs">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" placeholder="请输入创建时间日期" name="filter_createTimes"
                                           id="filter_createTimes" class="input-sm form-control  ">
                                    <span class="input-group-addon">——</span>
                                    <input type="text" placeholder="请输入创建时间日期" name="filter_createTimee"
                                           id="filter_createTimee" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div id="filter-div-updateTime" class="col-sm-3 m-b-xs">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" placeholder="请输入修改时间日期" name="filter_updateTimes"
                                           id="filter_updateTimes" class="input-sm form-control  ">
                                    <span class="input-group-addon">——</span>
                                    <input type="text" placeholder="请输入修改时间日期" name="filter_updateTimee"
                                           id="filter_updateTimee" class="input-sm form-control  ">
                                </div>
                            </div>


                            <div class="col-sm-2　 m-b-xs">
                                　　　　
                                <div class="btn-group">
                                    <span> <button type="button"
                                                   class="btn btn-sm btn-primary btn-primary-search"> 搜索</button> </span>
                                    <span>  <div id="toolbar" class="btn-group"></span>
                                </div>
                            </div>
                        </div>
                        <div class="dataTables_wrapper form-inline">
                            <table id="Acg12Subject_list"></table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- BEGIN Script -->
		[#include "/admin/include/script.ftl"]
<!-- END Script -->

<script>

    $(document).ready(function () {
        	[@flash_message /]

        //时间控件
        $(".input-daterange").datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

    });
</script>


<script>
    // $("#Acg12Subject_list").colResizable({
    //     liveDrag: true,
    //     draggingClass: "dragging",
    //     resizeMode: 'fit'
    // });

    $('#Acg12Subject_list').bootstrapTable({
        method: 'get',
        toolbar: '#toolbar',    //工具按钮用哪个容器
        striped: true,      //是否显示行间隔色
        cache: false,      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,     //是否显示分页（*）
        sortable: true,      //是否启用排序
        sortOrder: "id desc",     //排序方式
        pageNumber: 1,      //初始化加载第一页，默认第一页
        pageSize: 20,      //每页的记录行数（*）
        pageList: [20, 50, 100, 150],  //可供选择的每页的行数（*）
        url: "listNew.json",//这个接口需要处理bootstrap table传递的固定参数
        queryParamsType: '', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
        // 设置为 '' 在这种情况下传给服务器的参数为：pageSize,pageNumber
        queryParams: queryParams,//前端调用服务时，会默认传递上边提到的参数，如果需要添加自定义参数，可以自定义一个函数返回请求参数
        sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
        showColumns: true, //是否显示所有的列
        showRefresh: true, //是否显示刷新按钮
        minimumCountColumns: 2,    //最少允许的列数
        clickToSelect: false,    //是否启用点击选中行
        searchOnEnterKey: true,
        checkboxHeader: true,
        columns: [
            {checkbox: true},
            {
                title: "id", field: "id", align: "center", valign: "middle", sortable: true
            },
            {
                title: "sId", field: "sId", align: "center", valign: "middle", sortable: true
            },
            {
                title: "类型", field: "type", align: "center", valign: "middle", sortable: true
            },
            {
                title: "类型名称", field: "typeName", align: "center", valign: "middle", sortable: true, width: "100",
            },
            {
                title: "名称", field: "name", align: "center", valign: "middle", sortable: true, width: "200",
            },
            {
                title: "名称_中文", field: "nameCn", align: "center", valign: "middle", sortable: true, width: "200",
            },
            {
                title: "概况", field: "summary", align: "center", valign: "middle", sortable: true, visible: false
            },
            {
                title: "封面", field: "image", align: "center", valign: "middle", sortable: true, visible: false
            },
            {
                title: "话数", field: "epsCount", align: "center", valign: "middle", sortable: true
            },
            {
                title: "放送开始", field: "airDate", align: "center", valign: "middle", sortable: true
            },
            {
                title: "放送星期", field: "airWeekday", align: "center", valign: "middle", sortable: true
            },
            {
                title: "播放结束", field: "endDate", align: "center", valign: "middle", sortable: true
            },
            {
                title: "锁定状态", field: "lockStatus", align: "center", valign: "middle", sortable: true
            },
            {
                title: "", field: "createtime", align: "center", valign: "middle", sortable: true, visible: false
            },
            {
                title: "", field: "updatetime", align: "center", valign: "middle", sortable: true, visible: false
            },
            {
                title: "创建时间", field: "createTime", align: "center", valign: "middle", sortable: true, visible: false
                , formatter: function (value, row, index) {
                    if ("undefined" != value + "") {
                        var a = dateFtt("yyyy-MM-dd hh:mm:ss", new Date(value));
                        return a;
                    } else {
                        return value;
                    }
                }

            },
            {
                title: "修改时间", field: "updateTime", align: "center", valign: "middle", sortable: true, visible: false
                , formatter: function (value, row, index) {
                    if ("undefined" != value + "") {
                        var a = dateFtt("yyyy-MM-dd hh:mm:ss", new Date(value));
                        return a;
                    } else {
                        return value;
                    }
                }

            },
            {
                title: "操作", field: "id2", align: "center", valign: "middle", width: "200",
                formatter: function (value, row, index) {
                    //通过formatter可以自定义列显示的内容
                    //value：当前field的值，即id
                    //row：当前行的数据
                    var a =
                            "<a class='btn btn-danger btn-xs btn-delete-loippi2'  href='javascript:del(" + row.id + ")' data-id='" + row.id + "' ><i class='fa fa-trash'></i> 删除</a>"
                            + "<a class='btn btn-info btn-xs btn-edit-loippi' data-id='" + row.id + "'  href='javascript:to_edit(" + row.id + ")' ><i class='fa fa-paste'></i> 编辑</a>"
                            + "<a class='btn btn-info btn-xs btn-edit-loippi' data-id='" + row.id + "'  href='javascript:to_detailList(" + row.id + ")' ><i class='fa fa-paste'></i> 详情</a>";
                    if ("1" == row.type) {
                        a += "<a class='btn btn-info btn-xs btn-edit-loippi' data-id='" + row.id + "'  href='javascript:to_edit(" + row.id + ")' ><i class='fa fa-paste'></i> 编辑</a>";
                    }
                    return a;
                }
            },
        ],
        pagination: true
    });

    //初始化显示隐藏字段
    initColumns();

    function queryParams(params) {  //配置参数
        var temp = {
            pageNumber: params.pageNumber,   //页面大小
            pageSize: params.pageSize,   //页面大小
            pageList: params.pageList,   //页面大小

            filter_ids: $("#filter_ids").val(),
            filter_ide: $("#filter_ide").val(),


            filter_sIds: $("#filter_sIds").val(),
            filter_sIde: $("#filter_sIde").val(),


            filter_types: $("#filter_types").val(),
            filter_typee: $("#filter_typee").val(),


            filter_typeNamelike: $("#filter_typeName").val(),

            filter_namelike: $("#filter_name").val(),

            filter_nameCnlike: $("#filter_nameCn").val(),

            filter_summarylike: $("#filter_summary").val(),

            filter_imagelike: $("#filter_image").val(),

            filter_epsCounts: $("#filter_epsCounts").val(),
            filter_epsCounte: $("#filter_epsCounte").val(),


            filter_airDatelike: $("#filter_airDate").val(),

            filter_airWeekdays: $("#filter_airWeekdays").val(),
            filter_airWeekdaye: $("#filter_airWeekdaye").val(),


            filter_endDatelike: $("#filter_endDate").val(),

            filter_lockStatuss: $("#filter_lockStatuss").val(),
            filter_lockStatuse: $("#filter_lockStatuse").val(),


            filter_createtimes: $("#filter_createtimes").val(),
            filter_createtimee: $("#filter_createtimee").val(),


            filter_updatetimes: $("#filter_updatetimes").val(),
            filter_updatetimee: $("#filter_updatetimee").val(),


            filter_createTimes: $("#filter_createTimes").val(),
            filter_createTimee: $("#filter_createTimee").val(),

            filter_updateTimes: $("#filter_updateTimes").val(),
            filter_updateTimee: $("#filter_updateTimee").val(),
            sortName: params.sortName,
            sortOrder: params.sortOrder
        };
        return temp;
    }


    //初始化显示列,搜索字段
    function initColumns() {
        //初始化显示列
   [#list systemColumnList as systemColumn] 
	   $('#Acg12Subject_list').bootstrapTable('${systemColumn.columnType}', '${systemColumn.columnName}');
   [/#list]
        //  初始化搜索字段
    [#list systemColumnSearchList as systemColumn]
       $('#checkbox-search-${systemColumn.columnName}').iCheck('${systemColumn.columnType}');
       $('#checkbox-search-${systemColumn.columnName}').attr('checked', '${systemColumn.columnType}');
    [/#list]

        $("[name='checkbox-search']").each(function () {
            if (!$(this).is(":checked")) {
                var id = "#filter-div-" + $(this).attr("data-field");
                $(id).hide();
            }
        });
    }


    //监听搜索字段
    $(".dropdown-menu-search").change(function () {
        var visibleColumns = "";
        var hiddenColumns = "";
        $("[name='checkbox-search']").each(function () {
            if ($(this).is(":checked")) {
                visibleColumns = visibleColumns + $(this).attr("data-field") + ",";
                var id = "#filter-div-" + $(this).attr("data-field");
                $(id).show();
            } else {
                hiddenColumns = hiddenColumns + $(this).attr("data-field") + ",";
                var id = "#filter-div-" + $(this).attr("data-field");
                $(id).hide();
                $(id).val("");

            }
        });

        $.ajax({
            url: "updateColumnSearchLists.jhtml",
            type: "GET",
            data: {
                visibleColumns: visibleColumns,
                hiddenColumns: hiddenColumns
            },
            success: function (message) {
            }
        });

    });

    //页面跳转
    function refreshNum() {
        $('#Acg12Subject_list').bootstrapTable('selectPage', $('#searchPageNum').val());
    };

    //搜索按钮
    $(".btn-primary-search").click(function () {
        $('#Acg12Subject_list').bootstrapTable('selectPage', 1);
        $('#Acg12Subject_list').bootstrapTable(
                "refresh",
                {
                    url: "listNew.json"
                }
        );
    });


    // 删除单条记录
    function del(val) {
        bootbox.confirm(message("admin.dialog.deleteConfirm"), function (result) {
            if (result) {
                $.ajax({
                    url: "delete.html",
                    type: "get",
                    data: {ids: val},
                    dataType: "json",
                    cache: false,
                    success: function (message) {
                        $('#Acg12Subject_list').bootstrapTable(
                                "refresh",
                                {
                                    url: "listNew.json"
                                }
                        );
                    }
                });
            }
        });
    };

    // 删除多条条记录
    function dels(val) {
        bootbox.confirm(message("admin.dialog.deleteConfirm"), function (result) {
            var rows = $.map($('#Acg12Subject_list').bootstrapTable('getSelections'), function (row) {
                return row.id
            });
            var ids = "";
            for (i = 0; i < rows.length; i++) {
                ids = ids + "," + rows[i];
            }
            if (result) {
                $.ajax({
                    url: "delete.html",
                    type: "get",
                    data: {ids: ids},
                    dataType: "json",
                    cache: false,
                    success: function (message) {
                        $('#Acg12Subject_list').bootstrapTable(
                                "refresh",
                                {
                                    url: "listNew.json"
                                }
                        );
                    }
                });
            }
        });
    };

    var to_add = function () {
        layer.open({
            type: 2,
            title: '弹出窗口',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['80%', '90%'],
            content: 'add.html',
            cancel: function (index) {
                layer.close(index);
                location.reload();
                return false;
            }
        });
    }

    var to_edit = function (id) {
        layer.open({
            type: 2,
            title: '弹出窗口',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['80%', '90%'],
            content: 'edit/' + id + '.html',
            cancel: function (index) {
                layer.close(index);
                location.reload();
                return false;
            }
        });
    }

    var to_detailList = function (id) {
        layer.open({
            type: 2,
            title: '弹出窗口',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['80%', '90%'],
            content: '${base}/admin/subject_detail/list.html?subject_id=' + id,
            // cancel: function(index){
            //     layer.close(index);
            //     location.reload();
            //     return false;
            // }
        });
    }

</script>


</body>

</html>

