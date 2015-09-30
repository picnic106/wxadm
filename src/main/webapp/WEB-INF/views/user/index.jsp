<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.0
Version: 3.5
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8"/>
  <title>成长阶梯 | 微信活动管理后台 - 首页</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport"/>
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <link href="<%=path%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
  <!-- END GLOBAL MANDATORY STYLES -->

  <!-- BEGIN PAGE STYLES -->
  <link href="<%=path%>/assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
  <!-- END PAGE STYLES -->
  <!-- BEGIN THEME STYLES -->
  <!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
  <link href="<%=path%>/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
  <link href="<%=path%>/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
  <!-- END THEME STYLES -->
  <link rel="shortcut icon" href="favicon.ico"/>
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
<body class="page-header-fixed page-quick-sidebar-over-content page-style-square">
<c:set var="pagelevel" value="1" /> <!--通过这个变量控制菜单显示样式设置 设置菜单显示 1代表首页，2代表活动管理,3代表奖品管理，2.1代表添加活动，2.2代表 -->
<%@ include file="../global/head.jsp"%>
<!-- BEGIN CONTAINER -->
<div class="page-container">
  <%@ include file="../global/sidebar.jsp"%>
  <!-- BEGIN CONTENT -->
  <div class="page-content-wrapper">
    <div class="page-content">
      <%@ include file="../global/customize.jsp"%>
      <!-- BEGIN PAGE HEADER-->
      <h3 class="page-title">
        首页 <small>成长阶梯 | 微信活动管理后台</small>
      </h3>
      <div class="page-bar">
        <ul class="page-breadcrumb">
          <li>
            <i class="fa fa-home"></i>
            <a href="<%=path%>/rest/page/index">首页</a>
            <i class="fa fa-angle-right"></i>

          </li>
        </ul>

      </div>
      <!-- END PAGE HEADER-->

      <div class="clearfix">
      </div>




    </div>
  </div>
  <!-- END CONTENT -->

</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
  <div class="page-footer-inner">
    2015 &copy; 成长阶梯 - 微信活动管理后台
  </div>
  <div class="scroll-to-top">
    <i class="icon-arrow-up"></i>
  </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=path%>/assets/global/plugins/respond.min.js"></script>
<script src="<%=path%>/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="<%=path%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=path%>/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="<%=path%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=path%>/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/pages/scripts/index.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core componets
    Layout.init(); // init layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    Index.init();

  });


</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>