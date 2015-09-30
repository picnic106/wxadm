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
  <title>成长阶梯 | 微信活动管理后台 - 活动管理页</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->

  <link href="<%=path%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/select2/select2.css"/>
  <link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
  <link rel="stylesheet" type="text/css" href="<%=path%>/assets/global/plugins/fancybox/source/jquery.fancybox.css"/>

  <!-- END PAGE LEVEL STYLES -->
  <!-- BEGIN THEME STYLES -->
  <link href="<%=path%>/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="<%=path%>/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
  <link id="style_color" href="<%=path%>/assets/admin/layout/css/themes/default.css" rel="stylesheet" type="text/css"/>
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
<body class="page-header-fixed page-quick-sidebar-over-content ">
<c:set var="pagelevel" value="2" /> <!--设置菜单显示 1代表首页，2代表活动管理,3代表奖品管理，2.1代表添加活动，2.2代表 -->
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
                      <button  class="btn green" onclick="javascript:location.href='<%=path %>/rest/page/add_ac'">
                        添加活动<i class="fa fa-plus"></i>
                      </button>
                    </div>
                  </div>

                </div>
              </div>
              <table class="table table-striped table-hover table-bordered" id="sample_editable_1">
                <thead>
                <tr>
                  <th>
                    活动图片
                  </th>
                  <th>
                    活动名称
                  </th>
                  <th>
                    活动类型
                  </th>
                  <th>
                    活动时间
                  </th>
                  <th>
                    活动状态
                  </th>
                  <th>
                    操作
                  </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${wxacList}" var="wxac" >
                  <tr>
                    <td width="133px" height="99px"> <!-- class="thumbnail"  -->
                      <a href="${wxac.imgUrl}" class="fancybox-button" data-rel="fancybox-button">
                        <img src="${wxac.tinyImgUrl}" class="img-responsive" alt="" />
                      </a>
                      <!-- width="168px" height="112px"-->
                    </td>

                    <td>${wxac.name}</td>

                    <c:choose>
                      <c:when test="${wxac.type==1}">
                        <td>报名类型</td>
                      </c:when>
                      <c:otherwise>
                        <td>投票类型</td>
                      </c:otherwise>
                    </c:choose>

                    <td><fmt:formatDate value="${wxac.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 至
                      <fmt:formatDate value="${wxac.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                    <c:choose>
                      <c:when test="${wxac.stats==0}">
                        <td>新建</td>
                      </c:when>
                      <c:when test="${wxac.stats==1}">
                        <td>上线</td>
                      </c:when>
                      <c:otherwise>
                        <td>下线</td>
                      </c:otherwise>
                    </c:choose>



                    <td>
                      <c:choose>
                        <c:when test="${wxac.stats==1}">
                          <a  href="javascript:sx(2,'${wxac.id}');">下线 |</a>
                        </c:when>
                        <c:otherwise>
                          <a  href="javascript:sx(1,'${wxac.id}');">上线 |</a>
                        </c:otherwise>
                      </c:choose>
                      <a  href="javascript:location.href='<%=path %>/rest/ac/add_after?acid=${wxac.id}';">编辑</a> |
                      <a  href="javascript:shanchu(${wxac.id});">删除</a> |
                      <a  href="javascript:location.href='<%=path %>/rest/ac/selectSignUpUsers?acid=${wxac.id}';">查看报名用户</a>
                      <c:if test="${wxac.type==2}">

                        | <a  href="javascript:location.href='<%=path %>/rest/ac/selectCharts?acid=${wxac.id}';">排行榜</a>
                      </c:if>

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
  </div>
  <!-- END CONTENT -->

</div>
<!-- END CONTAINER -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <h3  class="modal-title" id="myModalLabel1">
          更新提示
        </h3 >


      </div>
      <div class="modal-body">

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
        <h3  class="modal-title" id="myModalLabel2">
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
<div class="modal fade" id="myModal_ms" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <h3  class="modal-title" id="myModalLabel3">
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
<script src="<%=path%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="<%=path%>/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=path%>/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="<%=path%>/assets/admin/pages/scripts/index.js" type="text/javascript"></script>

<script src="<%=path%>/assets/admin/pages/scripts/table-editable.js"></script>
<script>
  jQuery(document).ready(function() {
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    QuickSidebar.init(); // init quick sidebar
    Demo.init(); // init demo features
    TableEditable.init();

    var scrollY = document.documentElement.scrollTop || document.body.scrollTop;    //滚动条解决办法
    var top = (window.screen.height / 4) + scrollY - 100;  //滚动条解决办法
    $('#myModal').on('show.bs.modal', function (e) {
      $(this).find('.modal-dialog').css({
        'width':function(){
          return 400;
        },
        "margin-top": function () {
          return top;
        }
      });
    });

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

    $('#myModal').on('hidden.bs.modal', function () {
      location.href="<%=path%>/rest/ac/list";
    })

    var ms='${ms.message}';
    if (ms!=null&&ms!=''){
      $("#myModal_body_ms").text(ms);
      $('#myModal_ms').modal({
        keyboard: true
      });
    }

  });

  function sx(stats,acid){
    var sxname;
    if (stats==1){
      sxname="上线";
    }else{
      sxname="下线";
    }
    $.ajax({
      type:"POST",
      url:"<%=path%>/rest/ac/updateStats",
      data:{stats:stats,acid:acid},
      success:function(data){
        if (data==0){
          $(".modal-body").text(sxname+"失败！！");
        }else{
          $(".modal-body").text(sxname+"成功！！");
        }

        $('#myModal').modal({
          keyboard: true
        });


      }
    });

    //location.href='<%=path%>/rest/ac/delete?id=${wxac.id}'


  }

  function shanchu(acid){
    $("#myModal_body_comfire").text("确认删除吗？");
    $('#myModal_comfire').on('show.bs.modal', function(e) {
      //$(e.relatedTarget).data('href'));
      $(this).find('.btn-ok').attr('href', '<%=path%>/rest/ac/delete?id='+acid);
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