<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String  path = request.getContextPath();

  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8"/>
  <title>成长阶梯 | 微信活动管理后台 - 活动添加页</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->

  <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
  <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
  <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker3.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/fancybox/source/jquery.fancybox.css"/>
  <!-- END PAGE LEVEL SCRIPTS -->
  <!-- BEGIN THEME STYLES -->
  <link href="assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
  <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
  <link id="style_color" href="assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
  <link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
  <!-- END THEME STYLES -->
  <link rel="shortcut icon" href="favicon.ico"/>

  <style type="text/css">
    .col-md-3-new {
      width: 13%;
    }

  </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<body class="page-header-fixed page-quick-sidebar-over-content ">
<c:if test="${wxac.id==null}" >
  <c:set var="pagelevel" value="2.1" /> <!--设置菜单显示 1代表首页，2代表活动管理,3代表奖品管理，2.1代表添加活动，2.2代表修改活动 -->
</c:if>
<c:if test="${wxac.id!=null}" >
  <c:set var="pagelevel" value="2.2" />
  </c:if>
<%@ include file="../global/head.jsp"%>
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
  <%@ include file="../global/sidebar.jsp"%>
  <!-- BEGIN CONTENT -->
  <div class="page-content-wrapper">
    <div class="page-content">
      <%@ include file="../global/customize.jsp"%>
      <%@ include file="../global/page_header.jsp"%>


      <!-- BEGIN PAGE CONTENT-->
      <div class="row">
        <div class="col-md-12">
          <div class="tabbable tabbable-custom boxless tabbable-reversed">
            <ul class="nav nav-tabs">
              <li <c:if test="${active==null||active=='acxx'}">class="active"</c:if>>
                <a href="#tab_0" data-toggle="tab">
                  活动信息 </a>
              </li>

              <li <c:if test="${active=='pzxx'}">class="active"</c:if>>
                <a href="#tab_1" data-toggle="tab">
                  奖品信息 </a>
              </li>
              <!--<li>
                <a href="#tab_2" data-toggle="tab">
                  报名用户列表 </a>
              </li> -->

              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane <c:if test="${active==null||active=='acxx'}">active</c:if>" id="tab_0">
                <div class="portlet box green">
                  <div class="portlet-title">
                    <div class="caption">
                      <i class="fa fa-gift"></i>基本信息
                    </div>
                    <div class="tools">
                      <a href="javascript:;" class="collapse">
                      </a>
                      <a href="#portlet-config" data-toggle="modal" class="config">
                      </a>
                      <a href="javascript:;" class="reload">
                      </a>
                      <a href="javascript:;" class="remove">
                      </a>
                    </div>
                  </div>
                  <div class="portlet-body form">
                    <!-- BEGIN FORM-->
                    <form action="<%=path %>/rest/ac/<c:if test="${wxac.id==null}">add</c:if><c:if test="${wxac.id!=null}">update</c:if>" id="form_ac" class="form-horizontal" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="id" id="id" value="${wxac.id}"> </input>
                      <div class="form-body">
                        <h3 class="form-section">添加基本信息 </h3>
                        <div class="alert alert-danger display-hide">
                          <button class="close" data-close="alert"></button>
                          你的表单填写错误，请检查！

                        </div>
                        <div class="alert alert-success display-hide">
                          <button class="close" data-close="alert"></button>
                          表单校验成功!
                        </div>



                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new" >活动标题
<span class="required">
										* </span>
                          </label>
                          <div class="col-md-4">
                            <input type="text" name="name" value="${wxac.name}"  data-required="1" class="form-control"/>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new">活动类型
   <span class="required">
										* </span>

                          </label>

                          <div class="col-md-4">
                            <div class="radio-list" data-error-container="#form_2_membership_error">

                            <label class="radio-inline">
                              <input type="radio" name="type" id="type" value="1" <c:if test="${wxac.type==1}">checked</c:if>>报名类型</label>
                            <label class="radio-inline">
                              <input type="radio" name="type" id="type" value="2" <c:if test="${wxac.type==2}">checked</c:if>>投票类型</label>
                            </div>

                          <div id="form_2_membership_error">
                          </div>
                          </div>
                        </div>

                        <!--
                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new" >活动类型 <span class="required">
										* </span>
                          </label>
                          <div class="col-md-4">
                            <select class="form-control input-large" name="type">
                              <option value="1">报名类型</option>
                              <option value="2">投票类型</option>
                            </select>
                          </div>
                        </div>-->

                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new">活动开始时间<span class="required">
										* </span></label>
                          <div class="col-md-4">
                            <div class="input-group date form_datetime">
                              <input type="text" id="startTime" name="startTime" size="16" value="<fmt:formatDate value="${wxac.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>


                            </div>



                          </div>
                        </div>




                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new">活动结束时间<span class="required">
										* </span></label>
                          <div class="col-md-4">
                            <div class="input-group date form_datetime">
                              <input type="text" size="16" id="endTime"  value="<fmt:formatDate value="${wxac.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="endTime" readonly class="form-control">
												<span class="input-group-btn">
												<button class="btn default date-set" type="button"><i class="fa fa-calendar"></i></button>
												</span>
                            </div>

                            <!-- /input-group -->
                          </div>
                        </div>
                        <!--
                        <c:if test="${wxac.id!=null}">
                          <div class="form-group" >
                            <label class="control-label col-md-3 col-md-3-new" >活动图片</label>
                            <div class="col-md-4"    >
                              <img style="vertical-align: middle"  height="160px" width="auto" src="${wxac.tinyImgUrl}" />
                            </div>

                          </div>

                        </c:if>
-->
                        <div class="form-group" >
                          <label class="control-label col-md-3 col-md-3-new" >活动图片
<span class="required">
										* </span></label>
                          <div class="col-md-4"  >

                            <div class="file-list" data-error-container="#form_3_membership_error">

                            <input id="formfile"  name="formfile"    type="file"  class="file <c:if test="${wxac.id==null}">required</c:if>" multiple="true" data-show-upload="false" data-show-caption="true"/>
                            <!-- /input-group -->

                            </div>
                            <div id="form_3_membership_error"></div>
                            </div>

                        </div>


                        <div class="form-group last">
                          <label class="control-label col-md-3 col-md-3-new">活动介绍 <span class="required">
										* </span>
                          </label>
                          <div class="col-md-9">
                            <textarea class="ckeditor form-control"   name="intro" id="intro" rows="6" data-error-container="#editor2_error">${wxac.intro}</textarea>
                            <div id="editor2_error">
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-actions">
                        <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                            <button type="submit"  class="btn green">提交</button> <!--onclick="InOrUp(${wxac.id})" -->
                            <button type="button" onclick="javascript:location.href='<%=path%>/rest/ac/list';" class="btn default">返回</button>
                          </div>
                        </div>
                      </div>
                    </form>
                    <!-- END FORM-->
                  </div>
                  <!-- END VALIDATION STATES-->
                </div>

              </div>
              <div class="tab-pane <c:if test="${active=='pzxx'}">active</c:if>" id="tab_1">
                <!-- BEGIN PAGE CONTENT-->
                <div class="row">
                  <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box	">

                      <div class="portlet-body">
                        <div class="table-toolbar">
                          <div class="row">
                            <div class="col-md-6">
                                <button  class="btn green" data-toggle="modal" data-target="#myModal" >
                                  添加奖品<i class="fa fa-plus"></i>
                                </button>
                                <button type="button" onclick="javascript:location.href='<%=path%>/rest/ac/list';" class="btn default">返回</button>

                            </div>

                          </div>
                        </div>
                        <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                          <thead>

                          <tr>
                            <th>
                              奖品图片
                            </th>
                            <th>
                              奖品名称
                            </th>
                            <th>
                              等级
                            </th>
                            <th>
                              状态
                            </th>
                            <th>
                              操作
                            </th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${prizeList}" var="pz" >
                            <tr>
                              <td width="133px" height="99px">
                                <a href="${pz.imgUrl}" class="fancybox-button" data-rel="fancybox-button" >
                                <img src="${pz.tinyImgUrl}" width="133px" height="99px" class="img-responsive" alt />
                              </a>
                              </td>
                              <td>
                                ${pz.name}
                              </td>

                                <c:choose>
                                <c:when test="${pz.grade==1}">
                              <td>一等奖</td>
                              </c:when>
                              <c:when test="${pz.grade==2}">
                                <td>二等奖</td>
                              </c:when>
                              <c:when test="${pz.grade==3}">
                                <td>三等奖</td>
                              </c:when>
                              <c:otherwise>
                                <td>参与奖</td>
                              </c:otherwise>
                              </c:choose>


                                <c:choose>
                                <c:when test="${pz.stats==1}">
                              <td>开启</td>
                              </c:when>
                              <c:otherwise>
                                <td>关闭</td>
                              </c:otherwise>
                              </c:choose>

                              <td>
                                <a  href="javascript:shanchu('${wxac.id}','${pz.id}');">
                                  删除 </a>
                              </td>
                            </tr>
                          </c:forEach>






                          </tbody>
                        </table>
                      </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
                  </div>
                </div>
                <!-- END PAGE CONTENT -->

              </div>

              <!-- END EXAMPLE TABLE PORTLET-->
            </div>
          </div>
          <!-- END PAGE CONTENT -->

        </div>

      </div>
    </div>
  </div>
</div>
<!-- END PAGE CONTENT-->
</div>
</div>
<!-- END CONTENT -->

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_ms" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <h3  class="modal-title" id="myModalLabel">
          系统提示
        </h3 >


      </div>
      <div class="modal-body" id="myModal_body_ms">

        按下 ESC 按钮退出。
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_comfire" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <h3  class="modal-title" id="myModalLabel">
          确认删除
        </h3 >


      </div>
      <div class="modal-body" id="myModal_body_comfire">

        按下 ESC 按钮退出。
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-default"
                         data-dismiss="modal">关闭
      </button>
        <a class="btn btn-danger btn-ok"  >确认删除</a>
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <h3  class="modal-title" id="myModalLabel">
          选择奖品
        </h3 >


      </div>
      <div class="modal-body">
        <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
          <thead>
          <tr>
            <th>
              奖品图片
            </th>
            <th>
              奖品名称
            </th>
            <th>
              等级
            </th>
            <th>
              状态
            </th>
            <th>
              操作
            </th>

          </tr>
          </thead>
          <tbody>
          <c:forEach items="${prizeAllList}" var="prize" >
            <tr>
              <td  width="133px" height="99px">
                <a href="${prize.imgUrl}" class="fancybox-button" data-rel="fancybox-button" >
                  <img src="${prize.tinyImgUrl}" width="133px" height="99px"  class="img-responsive" alt />
                </a>
                <!-- width="168px" height="112px"-->
              </td>

              <td>${prize.name}</td>



              <c:choose>
                <c:when test="${prize.grade==1}">
                  <td>一等奖</td>
                </c:when>
                <c:when test="${prize.stats==2}">
                  <td>二等奖</td>
                </c:when>
                <c:when test="${prize.stats==3}">
                  <td>三等奖</td>
                </c:when>
                <c:otherwise>
                  <td>参与奖</td>
                </c:otherwise>
              </c:choose>

              <c:choose>
                <c:when test="${prize.stats==1}">
                  <td>开启</td>
                </c:when>
                <c:otherwise>
                  <td>关闭</td>
                </c:otherwise>
              </c:choose>


              <td><a class="edit" href="javascript:location.href='<%=path %>/rest/ac/save_ac_pz?acid=${wxac.id}&pzid=${prize.id}';">添加</a></td>
            </tr>

          </c:forEach>


          </tbody>
        </table>
        按下 ESC 按钮退出。
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
  <div class="page-footer-inner">
    2014 &copy; Metronic by keenthemes.
  </div>
  <div class="scroll-to-top">
    <i class="icon-arrow-up"></i>
  </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/localization/messages_zh.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="assets/global/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
<script type="text/javascript" src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/form-samples.js"></script>
<script src="assets/admin/pages/scripts/form-validation.js"></script>
<script src="assets/admin/pages/scripts/table-editable.js"></script>
<script src="assets/admin/pages/scripts/components-pickers.js"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<script>
  jQuery(document).ready(function() {
    // initiate layout and plugins
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    //FormValidation.init();
    handleValidation4();
    TableEditable.init();


    //ComponentsPickers.init();
    $(".form_datetime").datetimepicker({
      autoclose: true,
      startView: 2,
      minView: 1,
      forceParse: false,
      isRTL: Metronic.isRTL(),
      language :'zh-CN',
      todayBtn: 1,
      format: 'yyyy-mm-dd hh:00',
      pickerPosition: (Metronic.isRTL() ? "bottom-right" : "bottom-left")
      });


    var scrollY = document.documentElement.scrollTop || document.body.scrollTop;    //滚动条解决办法
    var top = (window.screen.height / 4) + scrollY - 100;  //滚动条解决办法
     /*
      'margin-top': function () {
      var modalHeight = $('#myModal').find('.modal-dialog').height();
      return ($(window).height() / 2 - (modalHeight / 2));
      }
     */
    $('#myModal').on('show.bs.modal', function (e) {
      $(this).find('.modal-dialog').css({
             'width':function(){
                return 800;
             },
        "margin-top": function () {
          return top;
        }
      });
    });
    $('#myModal_ms').on('show.bs.modal', function (e) {
      $(this).find('.modal-dialog').css({
        'width':function(){
          return 800;
        },
        "margin-top": function () {
          return top;
        }
      });
    });


    $('#myModal_comfire').on('show.bs.modal', function (e) {
      $(this).find('.modal-dialog').css({
        'width':function(){
          return 800;
        },
        "margin-top": function () {
          return top;
        }
      });
    });

    $.validator.addMethod('rangeDateTimeMax',
            function (value, element) {
              if (!value) {
                return true; // not testing 'is required' here!
              }

              if (element.name=='startTime'){
                //alert($('#endTime').val());
                if ($('#endTime').val()==null||$('#endTime').val()==''){
                  return true;
                }else{

                  var dateValue =convertDateTime( value);
                  var endvalue = convertDateTime( $('#endTime').val());
                  //alert("start:"+dateValue);
                  //alert("end:"+endvalue);
                  if (dateValue>endvalue){
                    return false;
                  }
                }
              }


              return true;
            },'活动开始日期不能大于活动结束日期！！');



    $.validator.addMethod('rangeDateTimeMin',
            function (value, element) {
              if (!value) {
                return true; // not testing 'is required' here!
              }


              if (element.name=='endTime'){
                if ($('#startTime').val()==null||$('#startTime').val()==''){
                  return true;
                }else{
                  var endTime = convertDateTime( value);
                  var startTime = convertDateTime($('#startTime').val());
                  if (endTime<startTime){
                    return false;
                  }
                }
              }
              return true;
            },'活动结束日期不能小于活动开始日期！！');

    $.validator.addMethod('fileType',
            function (value, element) {
              if (!value) {
                return true; // not testing 'is required' here!
              }

              if (value!=null&&value!=''){
                return true;
              }else{
                return false;
              }

              return true;
            },'活动开始日期不能大于活动结束日期！！');


    var ms='${ms.message}';
    if (ms!=null&&ms!=''){
      $("#myModal_body_ms").text(ms);
      $('#myModal_ms').modal({
        keyboard: true
      });
    }

    var acid='${wxac.id}';
    var imgurl='${wxac.imgUrl}';
    if (acid!=null&&acid!=''&&imgurl!=null&&imgurl!='') {
      $("#formfile").fileinput('refresh', {
        initialPreview: [
          "<img style='height:160px' src=\'"+imgurl+"\'>"
        ]
      });
    }
  });


  //location.href='<%=path%>/rest/ac/deleteByF?id=${wxac.id}'

  function shanchu(acid,pzid){
    $("#myModal_body_comfire").text("确认删除吗？");
    $('#myModal_comfire').on('show.bs.modal', function(e) {
      $(this).find('.btn-ok').attr('href', '<%=path%>/rest/ac/deleteByF?id='+acid+'&pzid='+pzid);
    });
    $('#myModal_comfire').modal({
      backdrop: 'static',
      keyboard: false
    });

  }

  function convertDateTime(dateTime){
    var dateTime1 = dateTime.split(" ");
    var date = dateTime1[0].split("-");
    var yyyy = date[0];
    var mm = date[1]-1;
    var dd = date[2];

    var time = dateTime1[1].split(":");
    var h = time[0];
    //var m = time[1];
    //var s = parseInt(time[2]); //get rid of that 00.0;

    return new Date(yyyy,mm,dd,h);
  }

  var handleValidation4 = function() {
    // for more info visit the official plugin documentation:
    // http://docs.jquery.com/Plugins/Validation

    var form3 = $('#form_ac');
    var error3 = $('.alert-danger', form3);
    var success3 = $('.alert-success', form3);

    //IMPORTANT: update CKEDITOR textarea with actual content before submit
    form3.on('submit', function() {

      for(var instanceName in CKEDITOR.instances) {
        CKEDITOR.instances[instanceName].updateElement();
      }


   })

    form3.validate({
      errorElement: 'span', //default input error message container
      errorClass: 'help-block help-block-error', // default input error message class
      focusInvalid: false, // do not focus the last invalid input
      ignore: "", // validate all fields including form hidden input
      rules: {
        name: {
          minlength: 2,
          required: true
        },
        type:{
          required: true
        },
        startTime: {
          required: true,
          rangeDateTimeMax:true
        },
        endTime: {
          required: true,
          rangeDateTimeMin:true
        },
          intro:{
          required: true
        }
      },

      messages: { // custom messages for radio buttons and checkboxes
        membership: {
          required: "Please select a Membership type"
        },
        service: {
          required: "Please select  at least 2 types of Service",
          minlength: jQuery.validator.format("Please select  at least {0} types of Service")
        }
      },

      errorPlacement: function (error, element) { // render error placement for each input type
        if (element.parent(".input-group").size() > 0) {
          error.insertAfter(element.parent(".input-group"));
        } else if (element.attr("data-error-container")) {
          error.appendTo(element.attr("data-error-container"));
        } else if (element.parents('.radio-list').size() > 0) {

          error.appendTo(element.parents('.radio-list').attr("data-error-container"));
        }  else if (element.parents('.file-list').size() > 0) {

          error.appendTo(element.parents('.file-list').attr("data-error-container"));
        } else if (element.parents('.radio-inline').size() > 0) {
          error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
        } else if (element.parents('.checkbox-list').size() > 0) {
          error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
        } else if (element.parents('.checkbox-inline').size() > 0) {
          error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
        } else {
          error.insertAfter(element); // for other inputs, just perform default behavior
        }
      },

      invalidHandler: function (event, validator) { //display error alert on form submit
        success3.hide();
        error3.show();
        Metronic.scrollTo(error3, -200);
      },

      highlight: function (element) { // hightlight error inputs
        $(element)
                .closest('.form-group').addClass('has-error'); // set error class to the control group
      },

      unhighlight: function (element) { // revert the change done by hightlight
        $(element)
                .closest('.form-group').removeClass('has-error'); // set error class to the control group
      },

      success: function (label) {
        label
                .closest('.form-group').removeClass('has-error'); // set success class to the control group
      },

      submitHandler: function (form) {
        success3.show();
        error3.hide();
        form[0].submit(); // submit the form
        //InOrUp(${wxac.id}); //不知为何不能这么写，如果这么写，就会无限循环，真奇怪！！！
      }

    });


  }

  function InOrUp(id){

    if (id!=null){
      $("#form_ac").attr("action","<%=path %>/rest/ac/update").submit();
    }else{
      $("#form_ac").attr("action","<%=path %>/rest/ac/add").submit();    }
  }

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
