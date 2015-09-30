<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String path = request.getContextPath();

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
  <title>成长阶梯 | 微信活动管理后台 - 奖品添加页</title>
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
<c:if test="${pz.id==null}" >
  <c:set var="pagelevel" value="3.1" /> <!--设置菜单显示 1代表首页，2代表活动管理,3代表奖品管理，2.1代表添加活动，2.2代表修改活动 -->
</c:if>
<c:if test="${pz.id!=null}" >
  <c:set var="pagelevel" value="3.2" />
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
              <li class="active">
                <a href="#tab_0" data-toggle="tab">
                  添加奖品 </a>
              </li>

              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_0">
                <div class="portlet box green">
                  <div class="portlet-title">
                    <div class="caption">
                      <i class="fa fa-gift"></i>添加奖品
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
                    <form action="<%=path %>/rest/pz/<c:if test="${pz.id==null}">add</c:if><c:if test="${pz.id!=null}">update</c:if>" id="form_pz" class="form-horizontal" method="post" enctype="multipart/form-data">
                      <input type="hidden" name="id" id="id" value="${pz.id}"> </input>
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
                          <label class="control-label col-md-3 col-md-3-new" >奖品标题 <span class="required">
										* </span>
                          </label>
                          <div class="col-md-4">
                            <input type="text" name="name" value="${pz.name}"  data-required="1" class="form-control"/>
                          </div>
                        </div>







                        <div class="form-group">
                          <label class="control-label col-md-3 col-md-3-new">奖品图片<span class="required">
										* </span></label>
                          <div class="col-md-4">
                            <div class="file-list" data-error-container="#form_4_membership_error">
                            <input id="formfile" name="formfile" type="file"  class="file <c:if test="${pz.id==null}">required</c:if>" multiple="true" data-show-upload="false" data-show-caption="true">
                            <!-- /input-group -->
                             </div>
                            <div id="form_4_membership_error"></div>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="control-label  col-md-3 col-md-3-new">奖品级别<span class="required">
										* </span></label>
                          <div class="col-md-5">
                            <div class="radio-list" data-error-container="#form_2_membership_error">
                            <label class="radio-inline">
                              <input type="radio" name="grade" value="1" <c:if test="${pz.grade==1}">checked</c:if>>一等奖  </label>
                            <label class="radio-inline">
                              <input type="radio" name="grade"  value="2" <c:if test="${pz.grade==2}">checked</c:if> > 二等奖 </label>
                            <label class="radio-inline">
                              <input type="radio" name="grade"  value="3" <c:if test="${pz.grade==3}">checked</c:if> > 三等奖 </label>
                            <label class="radio-inline">
                              <input type="radio" name="grade" value="4" <c:if test="${pz.grade==4}">checked</c:if>> 参与奖 </label>
                            </div>
                            <div id="form_2_membership_error">
                            </div>
                            </div>

                        </div>


                        <div class="form-group last">
                          <label class="control-label col-md-3 col-md-3-new">状态<span class="required">
										* </span></label>
                          <div class="col-md-4">
                            <div class="radio-list" data-error-container="#form_3_membership_error">
                            <label class="radio-inline">
                              <input type="radio" name="stats"  value="1" <c:if test="${pz.stats==null||pz.stats==1}">checked</c:if>>开启</label>
                            <label class="radio-inline">
                              <input type="radio" name="stats"  value="2" <c:if test="${pz.stats==2}">checked</c:if>> 关闭 </label>
                             </div>
                            <div id="form_3_membership_error">
                            </div>
                            </div>
                        </div>

                      </div>
                      <div class="form-actions">
                        <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                            <button type="submit"  class="btn green">提交</button>
                            <button type="button" onclick="javascript:location.href='<%=path%>/rest/pz/list'" class="btn default">返回</button>
                          </div>
                        </div>
                      </div>
                    </form>
                    <!-- END FORM-->
                  </div>
                  <!-- END VALIDATION STATES-->
                </div>

              </div>
              <div class="tab-pane" id="tab_1">
                <!-- BEGIN PAGE CONTENT-->
                <div class="row">
                  <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box	">

                      <div class="portlet-body">
                        <div class="table-toolbar">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="btn-group">
                                <button  class="btn green" onclick="javascript:location.href='form_layouts.html'">
                                  添加奖品<i class="fa fa-plus"></i>
                                </button>
                              </div>
                            </div>

                          </div>
                        </div>

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
<!-- END CONTAINER -->


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

<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/localization/messages_zh.js"></script>

<script type="text/javascript" src="assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>

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
    handleValidation4();
    //FormValidation.init();
    //TableEditable.init();
    //ComponentsPickers.init();
    var scrollY = document.documentElement.scrollTop || document.body.scrollTop;    //滚动条解决办法
    var top = (window.screen.height / 4) + scrollY - 100;  //滚动条解决办法
    /*
     'margin-top': function () {
     var modalHeight = $('#myModal').find('.modal-dialog').height();
     return ($(window).height() / 2 - (modalHeight / 2));
     }
     */
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

    var ms='${ms.message}';
    if (ms!=null&&ms!=''){
      $("#myModal_body_ms").text(ms);
      $('#myModal_ms').modal({
        keyboard: true
      });
    }

    var pzid='${pz.id}';
    var imgurl='${pz.imgUrl}';
    if (pzid!=null&&pzid!=''&&imgurl!=null&&imgurl!='') {
      $("#formfile").fileinput('refresh', {
        initialPreview: [
          "<img style='height:160px' src=\'"+imgurl+"\'>"
        ]
      });
    }
  });

  function InOrUp(id){
    if (id!=null){
      $("#form_pz").attr("action","<%=path %>/rest/pz/update").submit();
    }else{
      $("#form_pz").attr("action","<%=path %>/rest/pz/add").submit();    }
  }


  var handleValidation4 = function() {
    // for more info visit the official plugin documentation:
    // http://docs.jquery.com/Plugins/Validation

    var form3 = $('#form_pz');
    var error3 = $('.alert-danger', form3);
    var success3 = $('.alert-success', form3);

    //IMPORTANT: update CKEDITOR textarea with actual content before submit
    form3.on('submit', function() {


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
        grade: {
          required: true
        },
        stats: {
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
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
