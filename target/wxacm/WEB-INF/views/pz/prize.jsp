<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
  <title>成长阶梯 | 微信活动管理后台 - 奖品管理页</title>
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
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="assets/global/plugins/fancybox/source/jquery.fancybox.css"/>

  <!-- END PAGE LEVEL STYLES -->
  <!-- BEGIN THEME STYLES -->
  <link href="assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
  <link href="assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
  <link id="style_color" href="assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
  <link href="assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
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
<body class="page-header-fixed page-quick-sidebar-over-content ">
<c:set var="pagelevel" value="3" /> <!--设置菜单显示 1代表首页，2代表活动管理,3代表奖品管理，2.1代表添加活动，2.2代表 -->

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
          <!-- BEGIN EXAMPLE TABLE PORTLET-->
          <div class="portlet box	">

            <div class="portlet-body">
              <div class="table-toolbar">
                <div class="row">
                  <div class="col-md-6">
                    <div class="btn-group">
                        <button  class="btn green" onclick="javascript:location.href='<%=path %>/rest/page/add_pz'">


                           添加奖品<i class="fa fa-plus"></i>
                      </button>
                    </div>
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
                <c:forEach items="${prizeList}" var="prize" >
                  <tr>
                    <td width="133px" height="99px">
                      <a href="${prize.imgUrl}" class="fancybox-button" data-rel="fancybox-button" >
                        <img src="${prize.tinyImgUrl}" class="img-responsive"  alt />
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


                    <td><a  href="javascript:location.href='<%=path%>/rest/pz/queryByid?id=${prize.id}';">编辑</a>|<a  href="javascript:shanchu(${prize.id});">删除</a></td>
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
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="assets/admin/pages/scripts/table-editable.js"></script>
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    TableEditable.init();

    var scrollY = document.documentElement.scrollTop || document.body.scrollTop;    //滚动条解决办法
    var top = (window.screen.height / 4) + scrollY - 100;  //滚动条解决办法
    $('#myModal_comfire').on('show.bs.modal', function (e) {
      $(this).find('.modal-dialog').css({
        'width':function(){
          return 400;
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

    var ms='${ms.message}';
    if (ms!=null&&ms!=''){
      $("#myModal_body_ms").text(ms);
      $('#myModal_ms').modal({
        keyboard: true
      });
    }

  });

//location.href='<%=path%>/rest/pz/delete?id=${prize.id}
  function shanchu(pzid){
    $("#myModal_body_comfire").text("确认删除吗？");
    $('#myModal_comfire').on('show.bs.modal', function(e) {
      //$(e.relatedTarget).data('href'));
      $(this).find('.btn-ok').attr('href', '<%=path%>/rest/pz/delete?id='+pzid);
    });
    $('#myModal_comfire').modal({
      backdrop: 'static',
      keyboard: false
    });
  }
</script>
</body>
<!-- END BODY -->
</html>