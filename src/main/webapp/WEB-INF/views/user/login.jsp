<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String path = request.getContextPath();

  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8"/>
  <title>成长阶梯 | 微信活动管理后台 - 登录页</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->


  <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

  <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link href="assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
  <link href="assets/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/>
  <!-- END PAGE LEVEL SCRIPTS -->
  <!-- BEGIN THEME STYLES -->
  <link href="assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
  <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>


  <link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
  <!-- END THEME STYLES -->
  <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
  <a href="index.html">
    <img src="assets/admin/layout/img/h1new.png" alt=""/>
  </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">
  <!-- BEGIN LOGIN FORM -->
  <form class="login-form" id="loginform" action="<%=path %>/rest/user/login" method="post">
    <h3 class="form-title">登录到您的账户</h3>
    <div id="lgdiv" class="alert alert-danger display-hide">
      <button class="close" data-close="alert"></button>
			<span id="loginms">
			请输入您的用户名和密码。 </span>
    </div>
    <div class="form-group">
      <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
      <label class="control-label visible-ie8 visible-ie9">用户名</label>
      <div class="input-icon">
        <i class="fa fa-user"></i>
        <input  id="username" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">密码</label>
      <div class="input-icon">
        <i class="fa fa-lock"></i>
        <input  id="password" size="25" value="123456"  class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
      </div>
    </div>
    <div class="form-actions">
      <label class="checkbox">
        <input type="checkbox" name="remember" value="1"/> 记住我 </label>
      <button  id="loginBut" type="submit" class="btn blue pull-right">
        登录 <i class="m-icon-swapright m-icon-white"></i>
      </button>
    </div>

  </form>
  <!-- END LOGIN FORM -->


</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
  2015 &copy; 成长阶梯 - 微信活动管理后台
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/login-soft.js" type="text/javascript"></script>

<!-- END PAGE LEVEL SCRIPTS -->
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core components
    //Layout.init(); // init current layout
    Login.init();
    //if (!$.cookie('style_color')) {
      //$.cookie('style_color', 'blue', {path: "/"});
    //}
    // Demo.init();
    // init background slide images
    $.backstretch([
              "assets/admin/pages/media/bg/1.jpg",
              "assets/admin/pages/media/bg/2.jpg",
              "assets/admin/pages/media/bg/3.jpg",
              "assets/admin/pages/media/bg/4.jpg"
            ], {
              fade: 1000,
              duration: 8000
            }
    );

    var ms='${ms}';

    if ('${ms}'!=null&&'${ms}'!=''){
        $('#loginms').text(ms);
      $("#lgdiv").css('display','block');
    }


  });


</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>