<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
<div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        Widget settings form goes here
      </div>
      <div class="modal-footer">
        <button type="button" class="btn blue">Save changes</button>
        <button type="button" class="btn default" data-dismiss="modal">Close</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
<!-- BEGIN STYLE CUSTOMIZER -->
<div class="theme-panel hidden-xs hidden-sm">
  <div class="toggler">
  </div>
  <div class="toggler-close">
  </div>
  <div class="theme-options">
    <div class="theme-option theme-colors clearfix">
						<span>
						主题颜色 </span>
      <ul>
        <li class="color-default current tooltips" data-style="default" data-container="body" data-original-title="Default">
        </li>
        <li class="color-darkblue tooltips" data-style="darkblue" data-container="body" data-original-title="Dark Blue">
        </li>
        <li class="color-blue tooltips" data-style="blue" data-container="body" data-original-title="Blue">
        </li>
        <li class="color-grey tooltips" data-style="grey" data-container="body" data-original-title="Grey">
        </li>
        <li class="color-light tooltips" data-style="light" data-container="body" data-original-title="Light">
        </li>
        <li class="color-light2 tooltips" data-style="light2" data-container="body" data-html="true" data-original-title="Light 2">
        </li>
      </ul>
    </div>

    <div class="theme-option">
						<span>
						布局 </span>
      <select name="layout" class="layout-option form-control input-sm">
        <option value="fluid" selected="selected">顺序</option>
        <option value="boxed">盒状</option>
      </select>
    </div>
    <div class="theme-option">
						<span>
						页头 </span>
      <select class="page-header-option form-control input-sm">
        <option value="fixed" selected="selected">固定</option>
        <option value="default">默认</option>
      </select>
    </div>
    <div class="theme-option">
						<span>
						侧边栏</span>
      <select class="sidebar-option form-control input-sm">
        <option value="fixed" selected="selected">固定</option>
        <option value="default">默认</option>
      </select>
    </div>


    <div class="theme-option">
						<span>
						侧边栏位置 </span>
      <select class="sidebar-pos-option form-control input-sm">
        <option value="left" selected="selected">左边</option>
        <option value="right">右边</option>
      </select>
    </div>
    <div class="theme-option">
						<span>
						页脚 </span>
      <select class="page-footer-option form-control input-sm">
        <option value="fixed" selected="selected">固定</option>
        <option value="default" >默认</option>
      </select>
    </div>
  </div>
</div>
<!-- END STYLE CUSTOMIZER -->