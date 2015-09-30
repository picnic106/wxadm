<%@ page language="java"  pageEncoding="utf-8"%>
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">
  <c:if test="${fn:indexOf(pagelevel,'1')==0}">
    首页
  </c:if>
<c:if test="${fn:indexOf(pagelevel,'2')==0}">
  活动管理
</c:if>

  <c:if test="${fn:indexOf(pagelevel,'3')==0}">
    奖品管理
  </c:if>
  <small>微信后台活动管理</small>
</h3>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <i class="fa fa-home"></i>
      <a href="<%=path%>/rest/page/index">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <c:if test="${fn:indexOf(pagelevel,'2')==0}">
    <li>
      <a href="<%=path%>/rest/ac/list">活动管理</a>
      <i class="fa fa-angle-right"></i>
    </li>
    </c:if>

    <c:if test="${fn:indexOf(pagelevel,'3')==0}">
      <li>
        <a href="<%=path%>/rest/pz/list">奖品管理</a>
        <i class="fa fa-angle-right"></i>
      </li>
    </c:if>

    <c:if test="${fn:indexOf(pagelevel,'2.1')==0}">
      <li>
        <a href="<%=path%>/rest/page/add_ac">添加活动</a>
      </li>
    </c:if>

    <c:if test="${fn:indexOf(pagelevel,'2.2')==0}">
      <li>
        <a href="javascript:;">修改活动</a>
      </li>
    </c:if>
    <c:if test="${fn:indexOf(pagelevel,'2.3')==0}">
      <li>
        <a href="javascript:;">查看报名用户</a>
      </li>
    </c:if>

    <c:if test="${fn:indexOf(pagelevel,'2.4')==0}">
      <li>
        <a href="javascript:;">排行榜</a>
      </li>
    </c:if>

    <c:if test="${fn:indexOf(pagelevel,'3.1')==0}">
      <li>
        <a href="<%=path%>/rest/page/add_pz">添加奖品</a>
      </li>
    </c:if>
    <c:if test="${fn:indexOf(pagelevel,'3.2')==0}">
      <li>
        <a href="javascript:;">修改奖品</a>
      </li>
    </c:if>
  </ul>

</div>
<!-- END PAGE HEADER-->