﻿<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>${setting.siteName} - CollectCaricature详情</title>
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
                <div class="ibox-title">
                    <h5>CollectCaricature详情</h5>
                    <div class="ibox-tools">
                        <button type="button" class="btn btn-outline btn-white btn-xs" id="btn-return-loippi"
                                onclick="location.href='${base}/admin/acg12_collect_caricature/list.jhtml'"><i
                                class="fa fa-reply-all"></i> 返回列表
                        </button>
                    </div>
                </div>
                <div class="ibox-content">
                    <form id="inputForm" class="form-horizontal" action="update.jhtml" method="post">
                        <input type="hidden" value="${acg12CollectCaricature.id}"
                               name="id"/>

                                <div class="form-group">
                                    <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        userId</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.userId}</p>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                            <!--/row-->
                                <div class="form-group">
                                    <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        comicId</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.comicId}</p>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        类型 1:酷克</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.type}</p>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                            <!--/row-->
                                <div class="form-group">
                                    <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        封面</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.cover}</p>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        标题</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.title}</p>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                            <!--/row-->
                                <div class="form-group">
                                    <div class="row">
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        创建时间</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.createtime}</p>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="col-sm-3 control-label">
                                                        更新时间</label>
                                                    <div class="col-sm-9">
                                                        <p class="form-control-static">${acg12CollectCaricature.updatetime}</p>
                                                    </div>
                                                </div>
                                    </div>
                                </div>
                            <!--/row-->

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-12 col-sm-offset-10">
                                <button type="button" class="btn btn-default" onclick="window.history.back();">返回
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BEGIN Script -->
[#include "/admin/include/script.ftl"]
<!-- END Script -->
</body>
</html>
