<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
  <div class="page-sidebar navbar-collapse collapse">
    <!-- BEGIN SIDEBAR MENU -->
    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
      <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
      <li class="sidebar-toggler-wrapper">
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        <div class="sidebar-toggler">
        </div>
        <!-- END SIDEBAR TOGGLER BUTTON -->
      </li>

      <c:choose>
        <c:when test="${fn:indexOf(pagelevel,'1')==0}">
        <li class="start active open">
          <a href="<%=path%>/rest/page/index">
            <i class="icon-home"></i>
            <span class="title">首页</span>
            <span class="selected"></span>
            <span class="arrow open"></span>
          </a>

        </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="<%=path%>/rest/page/index">
              <i class="icon-home"></i>
              <span class="title">首页</span>
              <span class="arrow"></span>
            </a>

          </li>
        </c:otherwise>
      </c:choose>


      <c:choose>
        <c:when test="${fn:indexOf(pagelevel,'2')==0}">
          <li class="start active open">
            <a href="<%=path%>/rest/ac/list">
              <i class="icon-diamond"></i>
              <span class="title">活动管理</span>
              <span class="selected"></span>
              <span class="arrow open"></span>
            </a>

          </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="<%=path%>/rest/ac/list">
              <i class="icon-diamond"></i>
              <span class="title">活动管理</span>
              <span class="arrow "></span>
            </a>

          </li>
        </c:otherwise>
      </c:choose>

      <c:choose>
        <c:when test="${fn:indexOf(pagelevel,'3')==0}">
          <li class="start active open">
            <a href="<%=path%>/rest/pz/list">
              <i class="icon-present"></i>
              <span class="title">奖品管理</span>
              <span class="selected"></span>
              <span class="arrow open"></span>
            </a>

          </li>
        </c:when>
        <c:otherwise>
          <li>
            <a href="<%=path%>/rest/pz/list">
              <i class="icon-present"></i>
              <span class="title">奖品管理</span>
              <span class="arrow "></span>
            </a>

          </li>
        </c:otherwise>
      </c:choose>





    </ul>
    <!-- END SIDEBAR MENU -->
  </div>
</div>
<!-- END SIDEBAR -->