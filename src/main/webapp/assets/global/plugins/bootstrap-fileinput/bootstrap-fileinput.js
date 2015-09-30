/*!
 * @copyright Copyright &copy; Kartik Visweswaran, Krajee.com, 2014 - 2015
 * @version 4.2.6
 *
 * File input styled for Bootstrap 3.0 that utilizes HTML5 File Input's advanced 
 * features including the FileReader API. 
 * 
 * The plugin drastically enhances the HTML file input to preview multiple files on the client before
 * upload. In addition it provides the ability to preview content of images, text, videos, audio, html, 
 * flash and other objects. It also offers the ability to upload and delete files using AJAX, and add 
 * files in batches (i.e. preview, append, or remove before upload).
 * 
 * Author: Kartik Visweswaran
 * Copyright: 2015, Kartik Visweswaran, Krajee.com
 * For more JQuery plugins visit http://plugins.krajee.com
 * For more Yii related demos visit http://demos.krajee.com
 */
!
    function(e) {
      "use strict";
      e.fn.fileinputLocales = {};
      var i = function(e) {
            var i, t = document.createElement("div");
            return t.innerHTML = "<!--[if IE " + e + "]><i></i><![endif]-->",
                i = 1 === t.getElementsByTagName("i").length,
                document.body.appendChild(t),
                t.parentNode.removeChild(t),
                i
          },
          t = function(e, i, t, a) {
            var n = a ? i: i + ".fileinput";
            e.off(n).on(n, t)
          },
          a = {
            data: {},
            init: function(e) {
              var i = e.initialPreview,
                  t = e.id;
              i.length > 0 && !H(i) && (i = i.split(e.initialPreviewDelimiter)),
                  a.data[t] = {
                    content: i,
                    config: e.initialPreviewConfig,
                    tags: e.initialPreviewThumbTags,
                    delimiter: e.initialPreviewDelimiter,
                    template: e.previewGenericTemplate,
                    msg: function(i) {
                      return e.getMsgSelected(i)
                    },
                    initId: e.previewInitId,
                    footer: e.getLayoutTemplate("footer"),
                    isDelete: e.initialPreviewShowDelete,
                    caption: e.initialCaption,
                    actions: function(i, t, a, n, r) {
                      return e.renderFileActions(i, t, a, n, r)
                    }
                  }
            },
            fetch: function(e) {
              return a.data[e].content.filter(function(e) {
                return null !== e
              })
            },
            count: function(e, i) {
              return a.data[e] && a.data[e].content ? i ? a.data[e].content.length: a.fetch(e).length: 0
            },
            get: function(i, t, n) {
              var r, l, o = "init_" + t,
                  s = a.data[i],
                  d = s.config[t],
                  c = s.initId + "-" + o,
                  p = " file-preview-initial";
              return n = void 0 === n ? !0 : n,
                  null === s.content[t] ? "": (Z(d) || Z(d.frameClass) || (p += " " + d.frameClass), r = s.template.replace(/\{previewId\}/g, c).replace(/\{frameClass\}/g, p).replace(/\{fileindex\}/g, o).replace(/\{content\}/g, s.content[t]).replace(/\{footer\}/g, a.footer(i, t, n)), s.tags.length && s.tags[t] && (r = K(r, s.tags[t])), Z(d) || Z(d.frameAttr) || (l = e(document.createElement("div")).html(r), l.find(".file-preview-initial").attr(d.frameAttr), r = l.html(), l.remove()), r)
            },
            add: function(i, t, n, r, l) {
              var o, s = e.extend(!0, {},
                  a.data[i]);
              return H(t) || (t = t.split(s.delimiter)),
                  l ? (o = s.content.push(t) - 1, s.config[o] = n, s.tags[o] = r) : (o = t.length, s.content = t, s.config = n, s.tags = r),
                  a.data[i] = s,
                  o
            },
            set: function(i, t, n, r, l) {
              var o, s = e.extend(!0, {},
                  a.data[i]);
              if (H(t) || (t = t.split(s.delimiter)), l) {
                for (o = 0; o < t.length; o++) s.content.push(t[o]);
                for (o = 0; o < n.length; o++) s.config.push(n[o]);
                for (o = 0; o < r.length; o++) s.tags.push(r[o])
              } else s.content = t,
                  s.config = n,
                  s.tags = r;
              a.data[i] = s
            },
            unset: function(e, i) {
              var t = a.count(e);
              if (t) {
                if (1 === t) return a.data[e].content = [],
                    void(a.data[e].config = []);
                a.data[e].content[i] = null,
                    a.data[e].config[i] = null
              }
            },
            out: function(e) {
              var i, t = "",
                  n = a.data[e],
                  r = a.count(e, !0);
              if (0 === r) return {
                content: "",
                caption: ""
              };
              for (var l = 0; r > l; l++) t += a.get(e, l);
              return i = n.msg(a.count(e)),
              {
                content: t,
                caption: i
              }
            },
            footer: function(e, i, t) {
              var n = a.data[e];
              if (t = void 0 === t ? !0 : t, 0 === n.config.length || Z(n.config[i])) return "";
              var r = n.config[i],
                  l = W("caption", r) ? r.caption: "",
                  o = W("width", r) ? r.width: "auto",
                  s = W("url", r) ? r.url: !1,
                  d = W("key", r) ? r.key: null,
                  c = s === !1 && t,
                  p = n.isDelete ? n.actions(!1, !0, c, s, d) : "",
                  u = n.footer.replace(/\{actions\}/g, p);
              return u.replace(/\{caption\}/g, l).replace(/\{width\}/g, o).replace(/\{indicator\}/g, "").replace(/\{indicatorTitle\}/g, "")
            }
          },
          n = function(e, i) {
            return i = i || 0,
                "number" == typeof e ? e: ("string" == typeof e && (e = parseFloat(e)), isNaN(e) ? i: e)
          },
          r = function() {
            return window.File && window.FileReader
          },
          l = function() {
            var e = document.createElement("div");
            return ! i(9) && (void 0 !== e.draggable || void 0 !== e.ondragstart && void 0 !== e.ondrop)
          },
          o = function() {
            return r() && window.FormData
          },
          s = function(e, i) {
            e.removeClass(i).addClass(i)
          },
          d = 'style="width:{width};height:{height};"',
          c = '      <param name="controller" value="true" />\n      <param name="allowFullScreen" value="true" />\n      <param name="allowScriptAccess" value="always" />\n      <param name="autoPlay" value="false" />\n      <param name="autoStart" value="false" />\n      <param name="quality" value="high" />\n',
          p = '<div class="file-preview-other">\n   <span class="{previewFileIconClass}">{previewFileIcon}</span>\n</div>',
          u = {
            removeIcon: '<i class="glyphicon glyphicon-trash text-danger"></i>',
            removeClass: "btn btn-xs btn-default",
            removeTitle: "Remove file",
            uploadIcon: '<i class="glyphicon glyphicon-upload text-info"></i>',
            uploadClass: "btn btn-xs btn-default",
            uploadTitle: "Upload file",
            indicatorNew: '<i class="glyphicon glyphicon-hand-down text-warning"></i>',
            indicatorSuccess: '<i class="glyphicon glyphicon-ok-sign file-icon-lg text-success"></i>',
            indicatorError: '<i class="glyphicon glyphicon-exclamation-sign text-danger"></i>',
            indicatorLoading: '<i class="glyphicon glyphicon-hand-up text-muted"></i>',
            indicatorNewTitle: "Not uploaded yet",
            indicatorSuccessTitle: "Uploaded",
            indicatorErrorTitle: "Upload Error",
            indicatorLoadingTitle: "Uploading ..."
          },
          f = '{preview}\n<div class="kv-upload-progress hide"></div>\n<div class="input-group {class}">\n   {caption}\n   <div class="input-group-btn">\n       {remove}\n       {cancel}\n       {upload}\n       {browse}\n   </div>\n</div>',
          v = '{preview}\n<div class="kv-upload-progress hide"></div>\n{remove}\n{cancel}\n{upload}\n{browse}\n',
          g = '<div class="file-preview {class}">\n    <div class="close fileinput-remove">&times;</div>\n    <div class="{dropClass}">\n    <div class="file-preview-thumbnails">\n    </div>\n    <div class="clearfix"></div>    <div class="file-preview-status text-center text-success"></div>\n    <div class="kv-fileinput-error"></div>\n    </div>\n</div>',
          m = '<span class="glyphicon glyphicon-file kv-caption-icon"></span>',
          h = '<div tabindex="500" class="form-control file-caption {class}">\n   <div class="file-caption-name"></div>\n</div>\n',
          w = '<button type="{type}" tabindex="500" title="{title}" class="{css}"{status}>{icon}{label}</button>',
          b = '<a href="{href}" tabindex="500" title="{title}" class="{css}"{status}>{icon}{label}</a>',
          C = '<div tabindex="500" class="{css}"{status}>{icon}{label}</div>',
          x = '<div id="{id}" class="file-preview-detail-modal modal fade" tabindex="-1">\n  <div class="modal-dialog modal-lg">\n    <div class="modal-content">\n      <div class="modal-header">\n        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\n        <h3 class="modal-title">{heading} <small>{title}</small></h3>\n      </div>\n      <div class="modal-body">\n           <pre>{body}</pre>\n      </div>\n    </div>\n  </div>\n</div>',
          y = '<div class="progress">\n    <div class="{class}" role="progressbar" aria-valuenow="{percent}" aria-valuemin="0" aria-valuemax="100" style="width:{percent}%;">\n        {percent}%\n     </div>\n</div>',
          T = '<div class="file-thumbnail-footer">\n    <div class="file-footer-caption" title="{caption}">{caption}</div>\n    {actions}\n</div>',
          F = '<div class="file-actions">\n    <div class="file-footer-buttons">\n        {upload}{delete}{other}    </div>\n    <div class="file-upload-indicator" title="{indicatorTitle}">{indicator}</div>\n    <div class="clearfix"></div>\n</div>',
          E = '<button type="button" class="kv-file-remove {removeClass}" title="{removeTitle}"{dataUrl}{dataKey}>{removeIcon}</button>\n',
          k = '<button type="button" class="kv-file-upload {uploadClass}" title="{uploadTitle}">   {uploadIcon}\n</button>\n',
          $ = '<button type="button" class="btn btn-default btn-xs btn-block" title="{zoomTitle}: {caption}" onclick="{dialog}">\n   {zoomInd}\n</button>\n',
          I = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}">\n   {content}\n   {footer}\n</div>\n',
          S = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}">\n    <object class="file-object" data="{data}" type="{type}" width="{width}" height="{height}">\n       ' + p + "\n    </object>\n   {footer}\n</div>",
          P = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}">\n   <img src="{data}" class="file-preview-image" title="{caption}" alt="{caption}" ' + d + ">\n   {footer}\n</div>\n",
          D = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}">\n   <pre class="file-preview-text" title="{caption}" ' + d + ">{data}</pre>\n   {zoom}\n   {footer}\n</div>",
          U = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}" title="{caption}" ' + d + '>\n   <video width="{width}" height="{height}" controls>\n       <source src="{data}" type="{type}">\n       ' + p + "\n   </video>\n   {footer}\n</div>\n",
          j = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}" title="{caption}" ' + d + '>\n   <audio controls>\n       <source src="{data}" type="{type}">\n       ' + p + "\n   </audio>\n   {footer}\n</div>",
          A = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}" title="{caption}" ' + d + '>\n   <object class="file-object" type="application/x-shockwave-flash" width="{width}" height="{height}" data="{data}">\n' + c + "       " + p + "\n   </object>\n   {footer}\n</div>\n",
          L = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}" title="{caption}" ' + d + '>\n   <object class="file-object" data="{data}" type="{type}" width="{width}" height="{height}">\n       <param name="movie" value="{caption}" />\n' + c + "         " + p + "\n   </object>\n   {footer}\n</div>",
          O = '<div class="file-preview-frame{frameClass}" id="{previewId}" data-fileindex="{fileindex}" title="{caption}" ' + d + '>\n   <div class="file-preview-other-frame">\n   ' + p + '\n   </div>\n   <div class="file-preview-other-footer">{footer}</div>\n</div>',
          R = {
            main1: f,
            main2: v,
            preview: g,
            zoom: $,
            icon: m,
            caption: h,
            modal: x,
            progress: y,
            footer: T,
            actions: F,
            actionDelete: E,
            actionUpload: k,
            btnDefault: w,
            btnLink: b,
            btnBrowse: C
          },
          z = {
            generic: I,
            html: S,
            image: P,
            text: D,
            video: U,
            audio: j,
            flash: A,
            object: L,
            other: O
          },
          M = ["image", "html", "text", "video", "audio", "flash", "object"],
          B = {
            image: {
              width: "auto",
              height: "160px"
            },
            html: {
              width: "213px",
              height: "160px"
            },
            text: {
              width: "160px",
              height: "136px"
            },
            video: {
              width: "213px",
              height: "160px"
            },
            audio: {
              width: "213px",
              height: "80px"
            },
            flash: {
              width: "213px",
              height: "160px"
            },
            object: {
              width: "160px",
              height: "160px"
            },
            other: {
              width: "160px",
              height: "160px"
            }
          },
          N = {
            image: function(e, i) {
              return void 0 !== e ? e.match("image.*") : i.match(/\.(gif|png|jpe?g)$/i)
            },
            html: function(e, i) {
              return void 0 !== e ? "text/html" === e: i.match(/\.(htm|html)$/i)
            },
            text: function(e, i) {
              return void 0 !== e && e.match("text.*") || i.match(/\.(txt|md|csv|nfo|ini|json|php|js|css)$/i)
            },
            video: function(e, i) {
              return void 0 !== e && e.match(/\.video\/(ogg|mp4|webm|3gp)$/i) || i.match(/\.(og?|mp4|webm|3gp)$/i)
            },
            audio: function(e, i) {
              return void 0 !== e && e.match(/\.audio\/(ogg|mp3|wav)$/i) || i.match(/\.(ogg|mp3|wav)$/i)
            },
            flash: function(e, i) {
              return void 0 !== e && "application/x-shockwave-flash" === e || i.match(/\.(swf)$/i)
            },
            object: function() {
              return ! 0
            },
            other: function() {
              return ! 0
            }
          },
          Z = function(i, t) {
            return null === i || void 0 === i || 0 === i.length || t && "" === e.trim(i)
          },
          H = function(e) {
            return Array.isArray(e) || "[object Array]" === Object.prototype.toString.call(e)
          },
          W = function(e, i) {
            return "object" == typeof i && e in i
          },
          _ = function(i, t, a) {
            return Z(i) || Z(i[t]) ? a: e(i[t])
          },
          q = function() {
            return Math.round((new Date).getTime() + 100 * Math.random())
          },
          V = function(e) {
            return e.replace(/\</g, "&lt;").replace(/\</g, "&gt;").replace(/\&/g, "&amp;").replace(/\"/g, "&quot;").replace(/\'/g, "&apos;")
          },
          K = function(i, t) {
            var a = i;
            return t ? (e.each(t,
                function(e, i) {
                  "function" == typeof i && (i = i()),
                      a = a.split(e).join(i)
                }), a) : a
          },
          X = window.URL || window.webkitURL,
          J = function(t, a) {
            var n = this;
            n.$element = e(t),
            n.validate() && (n.isPreviewable = r(), n.isIE9 = i(9), n.isIE10 = i(10), n.isPreviewable || n.isIE9 ? (n.init(a), n.listen()) : n.$element.removeClass("file-loading"))
          };
      J.prototype = {
        constructor: J,
        validate: function() {
          var e, i = this;
          return "file" === i.$element.attr("type") ? !0 : (e = '<div class="help-block alert alert-warning"><h4>Invalid Input Type</h4>You must set an input <code>type = file</code> for <b>bootstrap-fileinput</b> plugin to initialize.</div>', i.$element.after(e), !1)
        },
        init: function(i) {
          var t, r = this,
              d = r.$element;
          e.each(i,
              function(e, i) {
                switch (e) {
                  case "minFileCount":
                  case "maxFileCount":
                  case "maxFileSize":
                    r[e] = n(i);
                    break;
                  default:
                    r[e] = i
                }
              }),
              r.fileInputCleared = !1,
              r.fileBatchCompleted = !0,
          r.isPreviewable || (r.showPreview = !1),
              r.uploadFileAttr = Z(d.attr("name")) ? "file_data": d.attr("name"),
              r.reader = null,
              r.formdata = {},
              r.filestack = [],
              r.ajaxRequests = [],
              r.isError = !1,
              r.ajaxAborted = !1,
              r.dropZoneEnabled = l() && r.dropZoneEnabled,
              r.isDisabled = r.$element.attr("disabled") || r.$element.attr("readonly"),
              r.isUploadable = o() && !Z(r.uploadUrl),
              r.slug = "function" == typeof i.slugCallback ? i.slugCallback: r.slugDefault,
              r.mainTemplate = r.getLayoutTemplate(r.showCaption ? "main1": "main2"),
              r.captionTemplate = r.getLayoutTemplate("caption"),
              r.previewGenericTemplate = r.getPreviewTemplate("generic"),
          Z(r.$element.attr("id")) && r.$element.attr("id", q()),
              void 0 === r.$container ? r.$container = r.createContainer() : r.refreshContainer(),
              r.$progress = r.$container.find(".kv-upload-progress"),
              r.$btnUpload = r.$container.find(".fileinput-upload"),
              r.$captionContainer = _(i, "elCaptionContainer", r.$container.find(".file-caption")),
              r.$caption = _(i, "elCaptionText", r.$container.find(".file-caption-name")),
              r.$previewContainer = _(i, "elPreviewContainer", r.$container.find(".file-preview")),
              r.$preview = _(i, "elPreviewImage", r.$container.find(".file-preview-thumbnails")),
              r.$previewStatus = _(i, "elPreviewStatus", r.$container.find(".file-preview-status")),
              r.$errorContainer = _(i, "elErrorContainer", r.$previewContainer.find(".kv-fileinput-error")),
          Z(r.msgErrorClass) || s(r.$errorContainer, r.msgErrorClass),
              r.$errorContainer.hide(),
              r.fileActionSettings = e.extend(u, i.fileActionSettings),
              r.previewInitId = "preview-" + q(),
              r.id = r.$element.attr("id"),
              a.init(r),
              r.initPreview(!0),
              r.initPreviewDeletes(),
              r.options = i,
              r.setFileDropZoneTitle(),
              r.uploadCount = 0,
              r.uploadPercent = 0,
              r.$element.removeClass("file-loading"),
              t = r.getLayoutTemplate("progress"),
              r.progressTemplate = t.replace("{class}", r.progressClass),
              r.progressCompleteTemplate = t.replace("{class}", r.progressCompleteClass)
        },
        parseError: function(i, t, a) {
          var n = this,
              r = e.trim(t + ""),
              l = "." === r.slice( - 1) ? "": ".",
              o = void 0 !== i.responseJSON && void 0 !== i.responseJSON.error ? i.responseJSON.error: i.responseText;
          return n.showAjaxErrorDetails && o ? (o = e.trim(o.replace(/\n\s*\n/g, "\n")), o = o.length > 0 ? "<pre>" + o + "</pre>": "", r += l + o) : r += l,
              a ? "<b>" + a + ": </b>" + i: r
        },
        raise: function(i, t) {
          var a = this,
              n = e.Event(i);
          if (void 0 !== t ? a.$element.trigger(n, t) : a.$element.trigger(n), !n.result) return n.result;
          switch (i) {
            case "filebatchuploadcomplete":
            case "filebatchuploadsuccess":
            case "fileuploaded":
            case "fileclear":
            case "filecleared":
            case "filereset":
            case "fileerror":
            case "filefoldererror":
            case "fileuploaderror":
            case "filebatchuploaderror":
            case "filedeleteerror":
            case "filecustomerror":
            case "filesuccessremove":
              break;
            default:
              a.ajaxAborted = n.result
          }
          return ! 0
        },
        getLayoutTemplate: function(e) {
          var i = this,
              t = W(e, i.layoutTemplates) ? i.layoutTemplates[e] : R[e];
          return Z(i.customLayoutTags) ? t: K(t, i.customLayoutTags)
        },
        getPreviewTemplate: function(e) {
          var i = this,
              t = W(e, i.previewTemplates) ? i.previewTemplates[e] : z[e];
          return Z(i.customPreviewTags) ? t: K(t, i.customPreviewTags)
        },
        parseFilePreviewIcon: function(i, t) {
          var a, n = this,
              r = n.previewFileIcon;
          return t && t.indexOf(".") > -1 && (a = t.split(".").pop(), n.previewFileIconSettings && n.previewFileIconSettings[a] && (r = n.previewFileIconSettings[a]), n.previewFileExtSettings && e.each(n.previewFileExtSettings,
              function(e, i) {
                n.previewFileIconSettings[e] && i(a) && (r = n.previewFileIconSettings[e])
              })),
              i.indexOf("{previewFileIcon}") > -1 ? i.replace(/\{previewFileIconClass\}/g, n.previewFileIconClass).replace(/\{previewFileIcon\}/g, r) : i
        },
        getOutData: function(e, i, t) {
          var a = this;
          return e = e || {},
              i = i || {},
              t = t || a.filestack.slice(0) || {},
          {
            form: a.formdata,
            files: t,
            extra: a.getExtraData(),
            response: i,
            reader: a.reader,
            jqXHR: e
          }
        },
        listen: function() {
          var i = this,
              a = i.$element,
              n = i.$captionContainer,
              r = i.$btnFile,
              l = a.closest("form"),
              o = i.$container;
          t(a, "change", e.proxy(i.change, i)),
              t(r, "click",
                  function() {
                    i.raise("filebrowse"),
                    i.isError && !i.isUploadable && i.clear(),
                        n.focus()
                  }),
              t(l, "reset", e.proxy(i.reset, i)),
              t(o.find(".fileinput-remove:not([disabled])"), "click", e.proxy(i.clear, i)),
              t(o.find(".fileinput-cancel"), "click", e.proxy(i.cancel, i)),
          i.isUploadable && i.dropZoneEnabled && i.showPreview && i.initDragDrop(),
          i.isUploadable || t(l, "submit", e.proxy(i.submitForm, i)),
              t(i.$container.find(".fileinput-upload"), "click",
                  function(t) {
                    var a, n = e(this),
                        r = !n.hasClass("disabled") && Z(n.attr("disabled"));
                    return i.isUploadable ? (t.preventDefault(), void(r && i.upload())) : void(r && "submit" !== n.attr("type") && (a = n.closest("form"), a.length && a.trigger("submit"), t.preventDefault()))
                  })
        },
        submitForm: function() {
          var e = this,
              i = e.$element,
              t = i.get(0).files;
          return t && e.minFileCount > 0 && e.getFileCount(t.length) < e.minFileCount ? (e.noFilesError({}), !1) : !e.abort({})
        },
        abort: function(i) {
          var t, a = this;
          return a.ajaxAborted && "object" == typeof a.ajaxAborted && void 0 !== a.ajaxAborted.message ? (t = e.extend(a.getOutData(), i), t.abortData = a.ajaxAborted.data || {},
              t.abortMessage = a.ajaxAborted.message, a.cancel(), a.setProgress(100), a.showUploadError(a.ajaxAborted.message, t, "filecustomerror"), !0) : !1
        },
        noFilesError: function(e) {
          var i = this,
              t = i.minFileCount > 1 ? i.filePlural: i.fileSingle,
              a = i.msgFilesTooLess.replace("{n}", i.minFileCount).replace("{files}", t),
              n = i.$errorContainer;
          n.html(a),
              i.isError = !0,
              i.updateFileDetails(0),
              n.fadeIn(800),
              i.raise("fileerror", [e]),
              i.clearFileInput(),
              s(i.$container, "has-error")
        },
        setProgress: function(e) {
          var i = this,
              t = Math.min(e, 100),
              a = 100 > t ? i.progressTemplate: i.progressCompleteTemplate;
          Z(a) || i.$progress.html(a.replace(/\{percent\}/g, t))
        },
        upload: function() {
          var i, t, a, n = this,
              r = n.getFileStack().length,
              l = {},
              o = !e.isEmptyObject(n.getExtraData());
          if (n.minFileCount > 0 && n.getFileCount(r) < n.minFileCount) return void n.noFilesError(l);
          if (n.isUploadable && !n.isDisabled && (0 !== r || o)) {
            if (n.resetUpload(), n.$progress.removeClass("hide"), n.uploadCount = 0, n.uploadPercent = 0, n.lock(), n.setProgress(0), 0 === r && o) return void n.uploadExtraOnly();
            if (a = n.filestack.length, n.hasInitData = !1, n.uploadAsync && n.showPreview) for (t = n.getOutData(), n.raise("filebatchpreupload", [t]), n.fileBatchCompleted = !1, n.uploadCache = {
              content: [],
              config: [],
              tags: [],
              append: !0
            },
                                                                                                     i = 0; a > i; i += 1) void 0 !== n.filestack[i] && n.uploadSingle(i, n.filestack, !0);
            else n.uploadBatch()
          }
        },
        lock: function() {
          var e = this;
          e.resetErrors(),
              e.disable(),
          e.showRemove && s(e.$container.find(".fileinput-remove"), "hide"),
          e.showCancel && e.$container.find(".fileinput-cancel").removeClass("hide"),
              e.raise("filelock", [e.filestack, e.getExtraData()])
        },
        unlock: function(e) {
          var i = this;
          void 0 === e && (e = !0),
              i.enable(),
          i.showCancel && s(i.$container.find(".fileinput-cancel"), "hide"),
          i.showRemove && i.$container.find(".fileinput-remove").removeClass("hide"),
          e && i.resetFileStack(),
              i.raise("fileunlock", [i.filestack, i.getExtraData()])
        },
        resetFileStack: function() {
          var i = this,
              t = 0,
              a = [];
          i.getThumbs().each(function() {
            var n = e(this),
                r = n.attr("data-fileindex"),
                l = i.filestack[r]; - 1 !== r && (void 0 !== l ? (a[t] = l, n.attr({
              id: i.previewInitId + "-" + t,
              "data-fileindex": t
            }), t += 1) : n.attr({
              id: "uploaded-" + q(),
              "data-fileindex": "-1"
            }))
          }),
              i.filestack = a
        },
        destroy: function() {
          var e = this,
              i = e.$container;
          i.find(".file-drop-zone").off(),
              e.$element.insertBefore(i).off(".fileinput").removeData(),
              i.off().remove()
        },
        refresh: function(i) {
          var t = this,
              a = t.$element;
          i = i ? e.extend(t.options, i) : t.options,
              t.destroy(),
              a.fileinput(i),
          a.val() && a.trigger("change.fileinput")
        },
        initDragDrop: function() {
          var i = this,
              a = i.$container.find(".file-drop-zone"),
              n = "dragenter.fileinput dragover.fileinput drop.fileinput";
          t(a, "dragenter.fileinput dragover.fileinput",
              function(t) {
                var a = e.inArray("Files", t.originalEvent.dataTransfer.types) > -1;
                return t.stopPropagation(),
                    t.preventDefault(),
                    i.isDisabled || !a ? (t.originalEvent.dataTransfer.effectAllowed = "none", void(t.originalEvent.dataTransfer.dropEffect = "none")) : void s(e(this), "highlighted")
              },
              !0),
              t(a, "dragleave",
                  function(t) {
                    t.stopPropagation(),
                        t.preventDefault(),
                    i.isDisabled || e(this).removeClass("highlighted")
                  }),
              t(a, "drop",
                  function(t) {
                    t.preventDefault(),
                    i.isDisabled || Z(t.originalEvent.dataTransfer.files) || (i.change(t, "dragdrop"), e(this).removeClass("highlighted"))
                  }),
              t(e(document), n,
                  function(e) {
                    e.stopPropagation(),
                        e.preventDefault()
                  },
                  !0)
        },
        setFileDropZoneTitle: function() {
          var e = this,
              i = e.$container.find(".file-drop-zone");
          i.find("." + e.dropZoneTitleClass).remove(),
          e.isUploadable && e.showPreview && 0 !== i.length && !(e.getFileStack().length > 0) && e.dropZoneEnabled && (0 === i.find(".file-preview-frame").length && i.prepend('<div class="' + e.dropZoneTitleClass + '">' + e.dropZoneTitle + "</div>"), e.$container.removeClass("file-input-new"), s(e.$container, "file-input-ajax-new"))
        },
        initFileActions: function() {
          var i = this;
          i.$preview.find(".kv-file-remove").each(function() {
            var n, r, l = e(this),
                o = l.closest(".file-preview-frame"),
                s = o.attr("data-fileindex");
            t(l, "click",
                function() {
                  return i.validateMinCount() ? (i.cleanMemory(o), void o.fadeOut("slow",
                      function() {
                        i.filestack[s] = void 0,
                            i.clearObjects(o),
                            o.remove();
                        var e = i.getFileStack(!0),
                            t = e.length,
                            l = a.count(i.id);
                        i.clearFileInput(),
                            0 === t && 0 === l ? i.reset() : (n = l + t, r = n > 1 ? i.getMsgSelected(n) : e[0] ? e[0].name: "", i.setCaption(r))
                      })) : !1
                })
          }),
              i.$preview.find(".kv-file-upload").each(function() {
                var a = e(this);
                t(a, "click",
                    function() {
                      var e = a.closest(".file-preview-frame"),
                          t = e.attr("data-fileindex");
                      i.uploadSingle(t, i.filestack, !1)
                    })
              })
        },
        getMsgSelected: function(e) {
          var i = this,
              t = 1 === e ? i.fileSingle: i.filePlural;
          return i.msgSelected.replace("{n}", e).replace("{files}", t)
        },
        renderFileFooter: function(e, i) {
          var t, a, n = this,
              r = n.fileActionSettings,
              l = n.getLayoutTemplate("footer");
          return n.isUploadable ? (t = l.replace(/\{actions\}/g, n.renderFileActions(!0, !0, !1, !1, !1)), a = t.replace(/\{caption\}/g, e).replace(/\{width\}/g, i).replace(/\{indicator\}/g, r.indicatorNew).replace(/\{indicatorTitle\}/g, r.indicatorNewTitle)) : a = l.replace(/\{actions\}/g, "").replace(/\{caption\}/g, e).replace(/\{width\}/g, i).replace(/\{indicator\}/g, "").replace(/\{indicatorTitle\}/g, ""),
              a = K(a, n.previewThumbTags)
        },
        renderFileActions: function(e, i, t, a, n) {
          if (!e && !i) return "";
          var r = this,
              l = a === !1 ? "": ' data-url="' + a + '"',
              o = n === !1 ? "": ' data-key="' + n + '"',
              s = r.getLayoutTemplate("actionDelete"),
              d = "",
              c = r.getLayoutTemplate("actions"),
              p = r.otherActionButtons.replace(/\{dataKey\}/g, o),
              u = r.fileActionSettings,
              f = t ? u.removeClass + " disabled": u.removeClass;
          return s = s.replace(/\{removeClass\}/g, f).replace(/\{removeIcon\}/g, u.removeIcon).replace(/\{removeTitle\}/g, u.removeTitle).replace(/\{dataUrl\}/g, l).replace(/\{dataKey\}/g, o),
          e && (d = r.getLayoutTemplate("actionUpload").replace(/\{uploadClass\}/g, u.uploadClass).replace(/\{uploadIcon\}/g, u.uploadIcon).replace(/\{uploadTitle\}/g, u.uploadTitle)),
              c.replace(/\{delete\}/g, s).replace(/\{upload\}/g, d).replace(/\{other\}/g, p)
        },
        setThumbStatus: function(e, i) {
          var t = this,
              a = "indicator" + i,
              n = a + "Title",
              r = "file-preview-" + i.toLowerCase(),
              l = e.find(".file-upload-indicator"),
              o = t.fileActionSettings;
          e.removeClass("file-preview-success file-preview-error file-preview-loading"),
              l.html(o[a]),
              l.attr("title", o[n]),
              e.addClass(r)
        },
        clearPreview: function() {
          var e = this,
              i = e.$preview.find(e.showUploadedThumbs ? ".file-preview-frame:not(.file-preview-success)": ".file-preview-frame");
          i.remove(),
          e.$preview.find(".file-preview-frame").length && e.showPreview || e.resetUpload()
        },
        initPreview: function(e) {
          var i, t = this,
              n = t.initialCaption || "";
          return a.count(t.id) ? (i = a.out(t.id), n = e && t.initialCaption ? t.initialCaption: i.caption, t.$preview.html(i.content), t.setCaption(n), void(Z(i.content) || t.$container.removeClass("file-input-new"))) : (t.clearPreview(), void(e ? t.setCaption(n) : t.initCaption()))
        },
        initPreviewDeletes: function() {
          var i = this,
              n = i.deleteExtraData || {},
              r = function() {
                0 === i.$preview.find(".kv-file-remove").length && (i.reset(), i.initialCaption = "")
              };
          i.$preview.find(".kv-file-remove").each(function() {
            var l = e(this),
                o = l.data("url") || i.deleteUrl,
                d = l.data("key");
            if (!Z(o) && void 0 !== d) {
              var c, p, u, f, v = l.closest(".file-preview-frame"),
                  g = a.data[i.id],
                  m = v.data("fileindex");
              m = parseInt(m.replace("init_", "")),
                  u = Z(g.config) && Z(g.config[m]) ? null: g.config[m],
                  f = Z(u) || Z(u.extra) ? n: u.extra,
              "function" == typeof f && (f = f()),
                  p = {
                    id: l.attr("id"),
                    key: d,
                    extra: f
                  },
                  c = e.extend({
                        url: o,
                        type: "POST",
                        dataType: "json",
                        data: e.extend({
                              key: d
                            },
                            f),
                        beforeSend: function(e) {
                          i.ajaxAborted = !1,
                              i.raise("filepredelete", [d, e, f]),
                              i.ajaxAborted ? e.abort() : (s(v, "file-uploading"), s(l, "disabled"))
                        },
                        success: function(e, t, n) {
                          var o, s;
                          return Z(e) || Z(e.error) ? (a.unset(i.id, m), o = a.count(i.id), s = o > 0 ? i.getMsgSelected(o) : "", i.raise("filedeleted", [d, n, f]), i.setCaption(s), v.removeClass("file-uploading").addClass("file-deleted"), void v.fadeOut("slow",
                              function() {
                                i.clearObjects(v),
                                    v.remove(),
                                    r(),
                                o || 0 !== i.getFileStack().length || (i.setCaption(""), i.reset())
                              })) : (p.jqXHR = n, p.response = e, i.showError(e.error, p, "filedeleteerror"), v.removeClass("file-uploading"), l.removeClass("disabled"), void r())
                        },
                        error: function(e, t, a) {
                          var n = i.parseError(e, a);
                          p.jqXHR = e,
                              p.response = {},
                              i.showError(n, p, "filedeleteerror"),
                              v.removeClass("file-uploading"),
                              r()
                        }
                      },
                      i.ajaxDeleteSettings),
                  t(l, "click",
                      function() {
                        return i.validateMinCount() ? void e.ajax(c) : !1
                      })
            }
          })
        },
        clearObjects: function(i) {
          i.find("video audio").each(function() {
            this.pause(),
                e(this).remove()
          }),
              i.find("img object div").each(function() {
                e(this).remove()
              })
        },
        clearFileInput: function() {
          var i, t, a, n = this,
              r = n.$element;
          Z(r.val()) || (n.isIE9 || n.isIE10 ? (i = r.closest("form"), t = e(document.createElement("form")), a = e(document.createElement("div")), r.before(a), i.length ? i.after(t) : a.after(t), t.append(r).trigger("reset"), a.before(r).remove(), t.remove()) : r.val(""), n.fileInputCleared = !0)
        },
        resetUpload: function() {
          var e = this;
          e.uploadCache = {
            content: [],
            config: [],
            tags: [],
            append: !0
          },
              e.uploadCount = 0,
              e.uploadPercent = 0,
              e.$btnUpload.removeAttr("disabled"),
              e.setProgress(0),
              s(e.$progress, "hide"),
              e.resetErrors(!1),
              e.ajaxAborted = !1,
              e.ajaxRequests = []
        },
        cancel: function() {
          var i, t = this,
              a = t.ajaxRequests,
              n = a.length;
          if (n > 0) for (i = 0; n > i; i += 1) a[i].abort();
          t.getThumbs().each(function() {
            var i = e(this),
                a = i.attr("data-fileindex");
            i.removeClass("file-uploading"),
            void 0 !== t.filestack[a] && (i.find(".kv-file-upload").removeClass("disabled").removeAttr("disabled"), i.find(".kv-file-remove").removeClass("disabled").removeAttr("disabled")),
                t.unlock()
          })
        },
        cleanMemory: function(e) {
          var i = e.is("img") ? e.attr("src") : e.find("source").attr("src");
          X.revokeObjectURL(i)
        },
        hasInitialPreview: function() {
          var e = this;
          return ! e.overwriteInitial && a.count(e.id)
        },
        clear: function() {
          var i, t = this;
          t.$btnUpload.removeAttr("disabled"),
              t.getThumbs().find("video,audio,img").each(function() {
                t.cleanMemory(e(this))
              }),
              t.resetUpload(),
              t.filestack = [],
              t.clearFileInput(),
              t.resetErrors(!0),
              t.raise("fileclear"),
              t.hasInitialPreview() ? (t.showFileIcon(), t.resetPreview(), t.initPreviewDeletes(), t.$container.removeClass("file-input-new")) : (t.getThumbs().each(function() {
                t.clearObjects(e(this))
              }), t.isUploadable && (a.data[t.id] = {}), t.$preview.html(""), i = !t.overwriteInitial && t.initialCaption.length > 0 ? t.initialCaption: "", t.setCaption(i), t.$caption.attr("title", ""), s(t.$container, "file-input-new")),
          0 === t.$container.find(".file-preview-frame").length && (t.initCaption() || t.$captionContainer.find(".kv-caption-icon").hide()),
              t.hideFileIcon(),
              t.raise("filecleared"),
              t.$captionContainer.focus(),
              t.setFileDropZoneTitle()
        },
        resetPreview: function() {
          var e, i = this;
          a.count(i.id) ? (e = a.out(i.id), i.$preview.html(e.content), i.setCaption(e.caption)) : (i.clearPreview(), i.initCaption())
        },
        resetPreviewThumbs: function(e) {
          var i, t = this;
          return e ? (t.clearPreview(), void(t.filestack = [])) : void(t.hasInitialPreview() ? (i = a.out(t.id), t.$preview.html(i.content), t.setCaption(i.caption), t.initPreviewDeletes()) : t.clearPreview())
        },
        reset: function() {
          var e = this;
          e.resetPreview(),
              e.$container.find(".fileinput-filename").text(""),
              e.raise("filereset"),
              s(e.$container, "file-input-new"),
          (e.$preview.find(".file-preview-frame").length || e.isUploadable && e.dropZoneEnabled) && e.$container.removeClass("file-input-new"),
              e.setFileDropZoneTitle(),
              e.filestack = [],
              e.formdata = {}
        },
        disable: function() {
          var e = this;
          e.isDisabled = !0,
              e.raise("filedisabled"),
              e.$element.attr("disabled", "disabled"),
              e.$container.find(".kv-fileinput-caption").addClass("file-caption-disabled"),
              e.$container.find(".btn-file, .fileinput-remove, .fileinput-upload, .file-preview-frame button").attr("disabled", !0),
              e.initDragDrop()
        },
        enable: function() {
          var e = this;
          e.isDisabled = !1,
              e.raise("fileenabled"),
              e.$element.removeAttr("disabled"),
              e.$container.find(".kv-fileinput-caption").removeClass("file-caption-disabled"),
              e.$container.find(".btn-file, .fileinput-remove, .fileinput-upload, .file-preview-frame button").removeAttr("disabled"),
              e.initDragDrop()
        },
        getThumbs: function(e) {
          return e = e || "",
              this.$preview.find(".file-preview-frame:not(.file-preview-initial)" + e)
        },
        getExtraData: function(e, i) {
          var t = this,
              a = t.uploadExtraData;
          return "function" == typeof t.uploadExtraData && (a = t.uploadExtraData(e, i)),
              a
        },
        uploadExtra: function(i, t) {
          var a = this,
              n = a.getExtraData(i, t);
          0 !== n.length && e.each(n,
              function(e, i) {
                a.formdata.append(e, i)
              })
        },
        initXhr: function(e, i) {
          var t = this;
          return e.upload && e.upload.addEventListener("progress",
              function(e) {
                var a = 0,
                    n = e.loaded || e.position,
                    r = e.total;
                e.lengthComputable && (a = Math.ceil(n / r * i)),
                    t.uploadPercent = Math.max(a, t.uploadPercent),
                    t.setProgress(t.uploadPercent)
              },
              !1),
              e
        },
        ajaxSubmit: function(i, t, a, n, r, l) {
          var o, s = this;
          s.raise("filepreajax", [r, l]),
              s.uploadExtra(r, l),
              o = e.extend({
                    xhr: function() {
                      var i = e.ajaxSettings.xhr();
                      return s.initXhr(i, 98)
                    },
                    url: s.uploadUrl,
                    type: "POST",
                    dataType: "json",
                    data: s.formdata,
                    cache: !1,
                    processData: !1,
                    contentType: !1,
                    beforeSend: i,
                    success: t,
                    complete: a,
                    error: n
                  },
                  s.ajaxSettings),
              s.ajaxRequests.push(e.ajax(o))
        },
        initUploadSuccess: function(i, t, n) {
          var r, l, o, s, d, c, p, u = this;
          "object" != typeof i || e.isEmptyObject(i) || void 0 !== i.initialPreview && i.initialPreview.length > 0 && (u.hasInitData = !0, d = i.initialPreview || [], c = i.initialPreviewConfig || [], p = i.initialPreviewThumbTags || [], r = void 0 === i.append || i.append ? !0 : !1, u.overwriteInitial = !1, void 0 === t || n ? n ? (u.uploadCache.content.push(d[0]), u.uploadCache.config.push(c[0]), u.uploadCache.tags.push(p[0]), u.uploadCache.append = r) : (a.set(u.id, d, c, p, r), u.initPreview(), u.initPreviewDeletes()) : (o = a.add(u.id, d, c[0], p[0], r), l = a.get(u.id, o, !1), s = e(l).hide(), t.after(s).fadeOut("slow",
              function() {
                s.fadeIn("slow").css("display:inline-block"),
                    u.initPreviewDeletes(),
                    u.clearFileInput(),
                    t.remove()
              })))
        },
        initSuccessThumbs: function() {
          var i = this;
          i.getThumbs(".file-preview-success").each(function() {
            var a = e(this),
                n = a.find(".kv-file-remove");
            n.removeAttr("disabled"),
                t(n, "click",
                    function() {
                      var e = i.raise("filesuccessremove", [a.attr("id"), a.data("fileindex")]);
                      i.cleanMemory(a),
                      e !== !1 && a.fadeOut("slow",
                          function() {
                            a.remove(),
                            i.$preview.find(".file-preview-frame").length || i.reset()
                          })
                    })
          })
        },
        uploadSingle: function(i, t, n) {
          var r, l, o, d, c, p, u, f, v, g = this,
              m = g.getFileStack().length,
              h = new FormData,
              w = g.previewInitId + "-" + i,
              b = e("#" + w + ":not(.file-preview-initial)"),
              C = b.find(".kv-file-upload"),
              x = b.find(".kv-file-remove"),
              y = g.filestack.length > 0 || !e.isEmptyObject(g.uploadExtraData),
              T = {
                id: w,
                index: i
              };
          g.formdata = h,
          0 === m || !y || C.hasClass("disabled") || g.abort(T) || (o = function() {
            var e = g.getThumbs(".file-uploading");
            e.length > 0 || g.fileBatchCompleted || (g.fileBatchCompleted = !0, setTimeout(function() {
                  a.set(g.id, g.uploadCache.content, g.uploadCache.config, g.uploadCache.tags, g.uploadCache.append),
                  g.hasInitData && (g.initPreview(), g.initPreviewDeletes()),
                      g.setProgress(100),
                      g.unlock(),
                      g.clearFileInput(),
                      g.raise("filebatchuploadcomplete", [g.filestack, g.getExtraData()])
                },
                100))
          },
              d = function() { ! n || 0 === m || g.uploadPercent >= 100 || (g.uploadCount += 1, l = 80 + Math.ceil(20 * g.uploadCount / m), g.uploadPercent = Math.max(l, g.uploadPercent), g.setProgress(g.uploadPercent), g.initPreviewDeletes())
              },
              c = function() {
                C.removeAttr("disabled"),
                    x.removeAttr("disabled"),
                    b.removeClass("file-uploading")
              },
              p = function(t) {
                r = g.getOutData(t),
                b.hasClass("file-preview-success") || (g.setThumbStatus(b, "Loading"), s(b, "file-uploading")),
                    C.attr("disabled", !0),
                    x.attr("disabled", !0),
                n || g.lock(),
                    g.raise("filepreupload", [r, w, i]),
                    T = e.extend(T, r),
                g.abort(T) && (t.abort(), g.setProgress(100))
              },
              u = function(t, a, l) {
                r = g.getOutData(l, t),
                    T = e.extend(T, r),
                    setTimeout(function() {
                          Z(t) || Z(t.error) ? (g.setThumbStatus(b, "Success"), C.hide(), g.filestack[i] = void 0, g.raise("fileuploaded", [r, w, i]), g.initUploadSuccess(t, b, n), n || g.resetFileStack()) : (g.setThumbStatus(b, "Error"), g.showUploadError(t.error, T))
                        },
                        100)
              },
              f = function() {
                setTimeout(function() {
                      d(),
                          c(),
                          n ? o() : g.unlock(!1),
                          g.initSuccessThumbs()
                    },
                    100)
              },
              v = function(a, r, l) {
                var o = g.parseError(a, l, n ? t[i].name: null);
                g.setThumbStatus(b, "Error"),
                    T = e.extend(T, g.getOutData(a)),
                    g.showUploadError(o, T)
              },
              h.append(g.uploadFileAttr, t[i]), h.append("file_id", i), g.ajaxSubmit(p, u, f, v, w, i))
        },
        uploadBatch: function() {
          var i, t, a, n, r, l = this,
              o = l.filestack,
              d = o.length,
              c = {},
              p = l.filestack.length > 0 || !e.isEmptyObject(l.uploadExtraData);

          l.formdata = new FormData,
          0 !== d && p && !l.abort(c) && (i = function() {
            e.each(o,
                function(e) {
                  l.filestack[e] = void 0
                }),
                l.clearFileInput()
          },
              t = function(i) {
                l.lock();
                var t = l.getOutData(i);
                l.showPreview && l.getThumbs().each(function() {
                  var i = e(this),
                      t = i.find(".kv-file-upload"),
                      a = i.find(".kv-file-remove");
                  i.hasClass("file-preview-success") || (l.setThumbStatus(i, "Loading"), s(i, "file-uploading")),
                      t.attr("disabled", !0),
                      a.attr("disabled", !0)
                }),
                    l.raise("filebatchpreupload", [t]),
                l.abort(t) && (i.abort(), l.setProgress(100))
              },
              a = function(t, a, n) {
                var r = l.getOutData(n, t),
                    o = l.getThumbs(),
                    s = Z(t.errorkeys) ? [] : t.errorkeys,
                    d = 0;
                Z(t) || Z(t.error) ? (l.raise("filebatchuploadsuccess", [r]), i(), l.showPreview ? (o.each(function() {
                  var i = e(this),
                      t = i.find(".kv-file-upload");
                  i.find(".kv-file-upload").hide(),
                      l.setThumbStatus(i, "Success"),
                      i.removeClass("file-uploading"),
                      t.removeAttr("disabled")
                }), l.initUploadSuccess(t)) : l.reset()) : (l.showPreview && (o.each(function() {
                  var i = e(this),
                      t = i.find(".kv-file-remove"),
                      a = i.find(".kv-file-upload");
                  return i.removeClass("file-uploading"),
                      a.removeAttr("disabled"),
                      t.removeAttr("disabled"),
                      0 === s.length ? void l.setThumbStatus(i, "Error") : ( - 1 !== e.inArray(d, s) ? l.setThumbStatus(i, "Error") : (i.find(".kv-file-upload").hide(), l.setThumbStatus(i, "Success"), l.filestack[d] = void 0), void d++)
                }), l.initUploadSuccess(t)), l.showUploadError(t.error, r, "filebatchuploaderror"))
              },
              n = function() {
                l.setProgress(100),
                    l.unlock(),
                    l.initSuccessThumbs(),
                    l.clearFileInput(),
                    l.raise("filebatchuploadcomplete", [l.filestack, l.getExtraData()])
              },
              r = function(i, t, a) {
                var n = l.getOutData(i),
                    r = l.parseError(i, a);
                l.showUploadError(r, n, "filebatchuploaderror"),
                    l.uploadFileCount = d - 1,
                l.showPreview && (l.getThumbs().each(function() {
                  var i = e(this),
                      t = i.attr("data-fileindex");
                  i.removeClass("file-uploading"),
                  void 0 !== l.filestack[t] && l.setThumbStatus(i, "Error")
                }), l.getThumbs().removeClass("file-uploading"), l.getThumbs(" .kv-file-upload").removeAttr("disabled"), l.getThumbs(" .kv-file-delete").removeAttr("disabled"))
              },
              e.each(o,
                  function(e, i) {
                    Z(o[e]) || l.formdata.append(l.uploadFileAttr, i)
                  }), l.ajaxSubmit(t, a, n, r))
        },
        uploadExtraOnly: function() {
          var e, i, t, a, n = this,
              r = {};
          n.formdata = new FormData,
          n.abort(r) || (e = function(e) {
            n.lock();
            var i = n.getOutData(e);
            n.raise("filebatchpreupload", [i]),
                n.setProgress(50),
                r.data = i,
                r.xhr = e,
            n.abort(r) && (e.abort(), n.setProgress(100))
          },
              i = function(e, i, t) {
                var a = n.getOutData(t, e);
                Z(e) || Z(e.error) ? (n.raise("filebatchuploadsuccess", [a]), n.clearFileInput(), n.initUploadSuccess(e)) : n.showUploadError(e.error, a, "filebatchuploaderror")
              },
              t = function() {
                n.setProgress(100),
                    n.unlock(),
                    n.clearFileInput(),
                    n.raise("filebatchuploadcomplete", [n.filestack, n.getExtraData()])
              },
              a = function(e, i, t) {
                var a = n.getOutData(e),
                    l = n.parseError(e, t);
                r.data = a,
                    n.showUploadError(l, a, "filebatchuploaderror")
              },
              n.ajaxSubmit(e, i, t, a))
        },
        hideFileIcon: function() {
          this.overwriteInitial && this.$captionContainer.find(".kv-caption-icon").hide()
        },
        showFileIcon: function() {
          this.$captionContainer.find(".kv-caption-icon").show()
        },
        resetErrors: function(e) {
          var i = this,
              t = i.$errorContainer;
          i.isError = !1,
              i.$container.removeClass("has-error"),
              t.html(""),
              e ? t.fadeOut("slow") : t.hide()
        },
        showFolderError: function(e) {
          var i = this,
              t = i.$errorContainer;
          e && (t.html(i.msgFoldersNotAllowed.replace(/\{n\}/g, e)), t.fadeIn(800), s(i.$container, "has-error"), i.raise("filefoldererror", [e]))
        },
        showUploadError: function(e, i, t) {
          var a = this,
              n = a.$errorContainer,
              r = t || "fileuploaderror";
          return 0 === n.find("ul").length ? n.html("<ul><li>" + e + "</li></ul>") : n.find("ul").append("<li>" + e + "</li>"),
              n.fadeIn(800),
              a.raise(r, [i]),
              a.$container.removeClass("file-input-new"),
              s(a.$container, "has-error"),
              !0
        },
        showError: function(e, i, t) {
          var a = this,
              n = a.$errorContainer,
              r = t || "fileerror";
          return i = i || {},
              i.reader = a.reader,
              n.html(e),
              n.fadeIn(800),
              a.raise(r, [i]),
          a.isUploadable || a.clearFileInput(),
              a.$container.removeClass("file-input-new"),
              s(a.$container, "has-error"),
              a.$btnUpload.attr("disabled", !0),
              !0
        },
        errorHandler: function(e, i) {
          var t = this,
              a = e.target.error;
          switch (a.code) {
            case a.NOT_FOUND_ERR:
              t.showError(t.msgFileNotFound.replace("{name}", i));
              break;
            case a.SECURITY_ERR:
              t.showError(t.msgFileSecured.replace("{name}", i));
              break;
            case a.NOT_READABLE_ERR:
              t.showError(t.msgFileNotReadable.replace("{name}", i));
              break;
            case a.ABORT_ERR:
              t.showError(t.msgFilePreviewAborted.replace("{name}", i));
              break;
            default:
              t.showError(t.msgFilePreviewError.replace("{name}", i))
          }
        },
        parseFileType: function(e) {
          var i, t, a, n, r = this;
          for (n = 0; n < M.length; n += 1) if (a = M[n], i = W(a, r.fileTypeSettings) ? r.fileTypeSettings[a] : N[a], t = i(e.type, e.name) ? a: "", !Z(t)) return t;
          return "other"
        },
        previewDefault: function(i, t, a) {
          if (this.showPreview) {
            var n = this,
                r = X.createObjectURL(i),
                l = "",
                o = i ? i.name: "",
                s = n.previewSettings.other || B.other,
                d = n.renderFileFooter(i.name, s.width),
                c = t.slice(t.lastIndexOf("-") + 1),
                p = n.parseFilePreviewIcon(n.getPreviewTemplate("other"), o);
            a === !0 && (l = " btn disabled", n.isUploadable || (d += '<div class="file-other-error" title="' + n.fileActionSettings.indicatorErrorTitle + '">' + n.fileActionSettings.indicatorError + "</div>")),
                n.$preview.append("\n" + p.replace(/\{previewId\}/g, t).replace(/\{frameClass\}/g, l).replace(/\{fileindex\}/g, c).replace(/\{caption\}/g, n.slug(i.name)).replace(/\{width\}/g, s.width).replace(/\{height\}/g, s.height).replace(/\{type\}/g, i.type).replace(/\{data\}/g, r).replace(/\{footer\}/g, d)),
            a === !0 && n.isUploadable && n.setThumbStatus(e("#" + t), "Error")
          }
        },
        previewFile: function(e, i, t, a, n) {
          if (this.showPreview) {
            var r, l, o, s = this,
                d = s.parseFileType(i),
                c = i ? i.name: "",
                p = s.slug(c),
                u = s.allowedPreviewTypes,
                f = s.allowedPreviewMimeTypes,
                v = s.getPreviewTemplate(d),
                g = u && u.indexOf(d) >= 0,
                m = W(d, s.previewSettings) ? s.previewSettings[d] : B[d],
                h = f && -1 !== f.indexOf(i.type),
                w = s.renderFileFooter(p, m.width),
                b = "",
                C = a.slice(a.lastIndexOf("-") + 1);
            g || h ? (v = s.parseFilePreviewIcon(v, c.split(".").pop()), "text" === d ? (l = V(t.target.result), o = "text-" + q(), r = v.replace(/\{zoom\}/g, s.getLayoutTemplate("zoom")), b = s.getLayoutTemplate("modal").replace("{id}", o).replace(/\{title\}/g, p).replace(/\{body\}/g, l).replace(/\{heading\}/g, s.msgZoomModalHeading), r = r.replace(/\{previewId\}/g, a).replace(/\{caption\}/g, p).replace(/\{width\}/g, m.width).replace(/\{height\}/g, m.height).replace(/\{frameClass\}/g, "").replace(/\{zoomInd\}/g, s.zoomIndicator).replace(/\{footer\}/g, w).replace(/\{fileindex\}/g, C).replace(/\{type\}/g, i.type).replace(/\{zoomTitle\}/g, s.msgZoomTitle).replace(/\{dialog\}/g, "$('#" + o + "').modal('show')").replace(/\{data\}/g, l) + b) : r = v.replace(/\{previewId\}/g, a).replace(/\{caption\}/g, p).replace(/\{frameClass\}/g, "").replace(/\{type\}/g, i.type).replace(/\{fileindex\}/g, C).replace(/\{width\}/g, m.width).replace(/\{height\}/g, m.height).replace(/\{footer\}/g, w).replace(/\{data\}/g, n), s.$preview.append("\n" + r), s.validateImage(e, a)) : s.previewDefault(i, a)
          }
        },
        slugDefault: function(e) {
          return Z(e) ? "": e.split(/(\\|\/)/g).pop().replace(/[^\w\u00C0-\u017F\-.\\\/ ]+/g, "")
        },
        getFileStack: function(e) {
          var i = this;
          return i.filestack.filter(function(i) {
            return e ? void 0 !== i: void 0 !== i && null !== i
          })
        },
        readFiles: function(i) {
          function t(e) {
            if (Z(n.attr("multiple")) && (u = 1), e >= u) return a.isUploadable && a.filestack.length > 0 ? a.raise("filebatchselected", [a.getFileStack()]) : a.raise("filebatchselected", [i]),
                o.removeClass("loading"),
                void s.html("");
            var m, h, w, b, C, x, y = v + e,
                T = p + "-" + y,
                F = i[e],
                E = a.slug(F.name),
                k = (F.size || 0) / 1e3,
                $ = "",
                I = X.createObjectURL(F),
                S = 0,
                P = a.allowedFileTypes,
                D = Z(P) ? "": P.join(", "),
                U = a.allowedFileExtensions,
                j = Z(U) ? "": U.join(", ");
            if (Z(U) || ($ = new RegExp("\\.(" + U.join("|") + ")$", "i")), k = k.toFixed(2), a.maxFileSize > 0 && k > a.maxFileSize) return b = a.msgSizeTooLarge.replace("{name}", E).replace("{size}", k).replace("{maxSize}", a.maxFileSize),
                void(a.isError = g(b, F, T, e));
            if (!Z(P) && H(P)) {
              for (w = 0; w < P.length; w += 1) C = P[w],
                  h = f[C],
                  x = void 0 !== h && h(F.type, E),
                  S += Z(x) ? 0 : x.length;
              if (0 === S) return b = a.msgInvalidFileType.replace("{name}", E).replace("{types}", D),
                  void(a.isError = g(b, F, T, e))
            }
            return 0 !== S || Z(U) || !H(U) || Z($) || (x = E.match($), S += Z(x) ? 0 : x.length, 0 !== S) ? a.showPreview ? (r.length > 0 && void 0 !== FileReader ? (s.html(d.replace("{index}", e + 1).replace("{files}", u)), o.addClass("loading"), l.onerror = function(e) {
              a.errorHandler(e, E)
            },
                l.onload = function(i) {
                  a.previewFile(e, F, i, T, I),
                      a.initFileActions()
                },
                l.onloadend = function() {
                  b = c.replace("{index}", e + 1).replace("{files}", u).replace("{percent}", 50).replace("{name}", E),
                      setTimeout(function() {
                            s.html(b),
                                a.updateFileDetails(u),
                                t(e + 1)
                          },
                          100),
                      a.raise("fileloaded", [F, T, e, l])
                },
                l.onprogress = function(i) {
                  if (i.lengthComputable) {
                    var t = i.loaded / i.total * 100,
                        a = Math.ceil(t);
                    b = c.replace("{index}", e + 1).replace("{files}", u).replace("{percent}", a).replace("{name}", E),
                        setTimeout(function() {
                              s.html(b)
                            },
                            100)
                  }
                },
                m = W("text", f) ? f.text: N.text, m(F.type, E) ? l.readAsText(F, a.textEncoding) : l.readAsArrayBuffer(F)) : (a.previewDefault(F, T), setTimeout(function() {
                  t(e + 1),
                      a.updateFileDetails(u)
                },
                100), a.raise("fileloaded", [F, T, e, l])), void a.filestack.push(F)) : (a.filestack.push(F), setTimeout(t(e + 1), 100), void a.raise("fileloaded", [F, T, e, l])) : (b = a.msgInvalidFileExtension.replace("{name}", E).replace("{extensions}", j), void(a.isError = g(b, F, T, e)))
          }
          this.reader = new FileReader;
          var a = this,
              n = a.$element,
              r = a.$preview,
              l = a.reader,
              o = a.$previewContainer,
              s = a.$previewStatus,
              d = a.msgLoading,
              c = a.msgProgress,
              p = a.previewInitId,
              u = i.length,
              f = a.fileTypeSettings,
              v = a.filestack.length,
              g = function(t, n, r, l) {
                var o = e.extend(a.getOutData({},
                        {},
                        i), {
                      id: r,
                      index: l
                    }),
                    s = {
                      id: r,
                      index: l,
                      file: n,
                      files: i
                    };
                return a.previewDefault(n, r, !0),
                    a.isUploadable ? a.showUploadError(t, o) : a.showError(t, s)
              };
          t(0),
              a.updateFileDetails(u, !1)
        },
        updateFileDetails: function(e) {
          var i = this,
              t = i.$element,
              n = i.getFileStack(),
              r = t.val() || n.length && n[0].name || "",
              l = i.slug(r),
              o = i.isUploadable ? n.length: e,
              s = a.count(i.id) + o,
              d = o > 1 ? i.getMsgSelected(s) : l;
          i.isError ? (i.$previewContainer.removeClass("loading"), i.$previewStatus.html(""), i.$captionContainer.find(".kv-caption-icon").hide()) : i.showFileIcon(),
              i.setCaption(d, i.isError),
              i.$container.removeClass("file-input-new file-input-ajax-new"),
          1 === arguments.length && i.raise("fileselect", [e, l]),
          a.count(i.id) && i.initPreviewDeletes()
        },
        validateMinCount: function() {
          var e = this,
              i = e.isUploadable ? e.getFileStack().length: e.$element.get(0).files.length;
          return e.validateInitialCount && e.minFileCount > 0 && e.getFileCount(i - 1) < e.minFileCount ? (e.noFilesError({}), !1) : !0
        },
        getFileCount: function(e) {
          var i = this,
              t = 0;
          return i.validateInitialCount && !i.overwriteInitial && (t = a.count(i.id), e += t),
              e
        },
        change: function(i) {
          var t = this,
              n = t.$element;
          if (!t.isUploadable && Z(n.val()) && t.fileInputCleared) return void(t.fileInputCleared = !1);
          t.fileInputCleared = !1;
          var r, l, o, s, d, c, p = arguments.length > 1,
              u = p ? i.originalEvent.dataTransfer.files: n.get(0).files,
              f = Z(n.attr("multiple")),
              v = 0,
              g = 0,
              m = t.filestack.length,
              h = t.isUploadable,
              w = f && m > 0,
              b = function(i, a, n, r) {
                var l = e.extend(t.getOutData({},
                        {},
                        u), {
                      id: n,
                      index: r
                    }),
                    o = {
                      id: n,
                      index: r,
                      file: a,
                      files: u
                    };
                return t.isUploadable ? t.showUploadError(i, l) : t.showError(i, o)
              };
          if (t.reader = null, t.resetUpload(), t.hideFileIcon(), t.isUploadable && t.$container.find(".file-drop-zone ." + t.dropZoneTitleClass).remove(), p) for (r = []; u[v];) s = u[v],
              s.type || s.size % 4096 !== 0 ? r.push(s) : g++,
              v++;
          else r = void 0 === i.target.files ? i.target && i.target.value ? [{
            name: i.target.value.replace(/^.+\\/, "")
          }] : [] : i.target.files;
          if (Z(r) || 0 === r.length) return h || t.clear(),
              t.showFolderError(g),
              void t.raise("fileselectnone");
          if (t.resetErrors(), c = r.length, o = t.isUploadable ? t.getFileStack().length + c: c, o = t.getFileCount(o), t.maxFileCount > 0 && o > t.maxFileCount) {
            if (!t.autoReplace || c > t.maxFileCount) return d = t.autoReplace && c > t.maxFileCount ? c: o,
                l = t.msgFilesTooMany.replace("{m}", t.maxFileCount).replace("{n}", d),
                t.isError = b(l, null, null, null),
                t.$captionContainer.find(".kv-caption-icon").hide(),
                t.setCaption("", !0),
                void t.$container.removeClass("file-input-new file-input-ajax-new");
            o > t.maxFileCount && t.resetPreviewThumbs(h)
          } else ! h || w ? (t.resetPreviewThumbs(!1), w && (t.filestack = [])) : !h || 0 !== m || a.count(t.id) && !t.overwriteInitial || t.resetPreviewThumbs(!0);
          t.isPreviewable ? t.readFiles(r) : t.updateFileDetails(1),
              t.showFolderError(g)
        },
        validateImage: function(e, i) {
          var a, n, r, l = this,
              o = l.$preview,
              s = o.find("#" + i),
              d = "Untitled",
              c = s.find("img");
          c.length && t(c, "load",
              function() {
                n = s.width(),
                    r = o.width(),
                n > r && (c.css("width", "100%"), s.css("width", "97%")),
                    a = {
                      ind: e,
                      id: i
                    },
                    l.checkDimensions(e, "Small", c, s, d, "Width", a),
                    l.checkDimensions(e, "Small", c, s, d, "Height", a),
                    l.checkDimensions(e, "Large", c, s, d, "Width", a),
                    l.checkDimensions(e, "Large", c, s, d, "Height", a),
                    l.raise("fileimageloaded", [i]),
                    X.revokeObjectURL(c.attr("src"))
              })
        },
        checkDimensions: function(e, i, t, a, n, r, l) {
          var o, s, d, c, p = this,
              u = "Small" === i ? "min": "max",
              f = p[u + "Image" + r]; ! Z(f) && t.length && (d = t[0], s = "Width" === r ? d.naturalWidth || d.width: d.naturalHeight || d.height, c = "Small" === i ? s >= f: f >= s, c || (o = p["msgImage" + r + i].replace("{name}", n).replace("{size}", f), p.showUploadError(o, l), p.setThumbStatus(a, "Error"), p.filestack[e] = null))
        },
        initCaption: function() {
          var e = this,
              i = e.initialCaption || "";
          return e.overwriteInitial || Z(i) ? (e.$caption.html(""), !1) : (e.setCaption(i), !0)
        },
        setCaption: function(i, t) {
          var a, n, r = this;
          if (t) a = e("<div>" + r.msgValidationError + "</div>").text(),
              n = '<span class="' + r.msgValidationErrorClass + '">' + r.msgValidationErrorIcon + a + "</span>";
          else {
            if (Z(i) || 0 === r.$caption.length) return;
            a = e("<div>" + i + "</div>").text(),
                n = r.getLayoutTemplate("icon") + a
          }
          r.$caption.html(n),
              r.$caption.attr("title", a),
              r.$captionContainer.find(".file-caption-ellipsis").attr("title", a)
        },
        initBrowse: function(e) {
          var i = this;
          i.$btnFile = e.find(".btn-file"),
              i.$btnFile.append(i.$element)
        },
        createContainer: function() {
          var i = this,
              t = e(document.createElement("div")).attr({
                "class": "file-input file-input-new"
              }).html(i.renderMain());
          return i.$element.before(t),
              i.initBrowse(t),
              t
        },
        refreshContainer: function() {
          var e = this,
              i = e.$container;
          i.before(e.$element),
              i.html(e.renderMain()),
              e.initBrowse(i)
        },
        renderMain: function() {
          var e = this,
              i = e.isUploadable && e.dropZoneEnabled ? " file-drop-zone": "",
              t = e.showPreview ? e.getLayoutTemplate("preview").replace(/\{class\}/g, e.previewClass).replace(/\{dropClass\}/g, i) : "",
              a = e.isDisabled ? e.captionClass + " file-caption-disabled": e.captionClass,
              n = e.captionTemplate.replace(/\{class\}/g, a + " kv-fileinput-caption");
          return e.mainTemplate.replace(/\{class\}/g, e.mainClass).replace(/\{preview\}/g, t).replace(/\{caption\}/g, n).replace(/\{upload\}/g, e.renderButton("upload")).replace(/\{remove\}/g, e.renderButton("remove")).replace(/\{cancel\}/g, e.renderButton("cancel")).replace(/\{browse\}/g, e.renderButton("browse"))
        },
        renderButton: function(e) {
          var i = this,
              t = i.getLayoutTemplate("btnDefault"),
              a = i[e + "Class"],
              n = i[e + "Title"],
              r = i[e + "Icon"],
              l = i[e + "Label"],
              o = i.isDisabled ? " disabled": "",
              s = "button";
          switch (e) {
            case "remove":
              if (!i.showRemove) return "";
              break;
            case "cancel":
              if (!i.showCancel) return "";
              a += " hide";
              break;
            case "upload":
              if (!i.showUpload) return "";
              i.isUploadable && !i.isDisabled ? t = i.getLayoutTemplate("btnLink").replace("{href}", i.uploadUrl) : s = "submit";
              break;
            case "browse":
              t = i.getLayoutTemplate("btnBrowse");
              break;
            default:
              return ""
          }
          return a += "browse" === e ? " btn-file": " fileinput-" + e + " fileinput-" + e + "-button",
              t.replace("{type}", s).replace("{css}", a).replace("{title}", n).replace("{status}", o).replace("{icon}", r).replace("{label}", l)
        }
      },
          e.fn.fileinput = function(t) {
            if (r() || i(9)) {
              var a = Array.apply(null, arguments);
              return a.shift(),
                  this.each(function() {
                    var i, n = e(this),
                        r = n.data("fileinput"),
                        l = "object" == typeof t && t,
                        o = l.language || n.data("language") || "en";
                    r || (i = e.extend({},
                        e.fn.fileinput.defaults), "en" === o || Z(e.fn.fileinputLocales[o]) || (i = e.extend(i, e.fn.fileinputLocales[o])), r = new J(this, e.extend(i, l, n.data())), n.data("fileinput", r)),
                    "string" == typeof t && r[t].apply(r, a)
                  })
            }
          },
          e.fn.fileinput.defaults = {
            language: "en",
            showCaption: !0,
            showPreview: !0,
            showRemove: !0,
            showUpload: !0,
            showCancel: !0,
            showUploadedThumbs: !0,
            autoReplace: !1,
            mainClass: "",
            previewClass: "",
            captionClass: "",
            mainTemplate: null,
            initialCaption: "",
            initialPreview: [],
            initialPreviewDelimiter: "*$$*",
            initialPreviewConfig: [],
            initialPreviewThumbTags: [],
            previewThumbTags: {},
            initialPreviewShowDelete: !0,
            deleteUrl: "",
            deleteExtraData: {},
            overwriteInitial: !0,
            layoutTemplates: R,
            previewTemplates: z,
            allowedPreviewTypes: M,
            allowedPreviewMimeTypes: null,
            allowedFileTypes: null,
            allowedFileExtensions: null,
            customLayoutTags: {},
            customPreviewTags: {},
            previewSettings: B,
            fileTypeSettings: N,
            previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
            previewFileIconClass: "file-icon-4x",
            previewFileIconSettings: {},
            previewFileExtSettings: {},
            browseIcon: '<i class="glyphicon glyphicon-folder-open"></i> &nbsp;',
            browseClass: "btn btn-primary",
            removeIcon: '<i class="glyphicon glyphicon-trash"></i> ',
            removeClass: "btn btn-default",
            cancelIcon: '<i class="glyphicon glyphicon-ban-circle"></i> ',
            cancelClass: "btn btn-default",
            uploadIcon: '<i class="glyphicon glyphicon-upload"></i> ',
            uploadClass: "btn btn-default",
            uploadUrl: null,
            uploadAsync: !0,
            uploadExtraData: {},
            minImageWidth: null,
            minImageHeight: null,
            maxImageWidth: null,
            maxImageHeight: null,
            maxFileSize: 0,
            minFileCount: 0,
            maxFileCount: 0,
            validateInitialCount: !1,
            msgValidationErrorClass: "text-danger",
            msgValidationErrorIcon: '<i class="glyphicon glyphicon-exclamation-sign"></i> ',
            msgErrorClass: "file-error-message",
            progressClass: "progress-bar progress-bar-success progress-bar-striped active",
            progressCompleteClass: "progress-bar progress-bar-success",
            previewFileType: "image",
            zoomIndicator: '<i class="glyphicon glyphicon-zoom-in"></i>',
            elCaptionContainer: null,
            elCaptionText: null,
            elPreviewContainer: null,
            elPreviewImage: null,
            elPreviewStatus: null,
            elErrorContainer: null,
            slugCallback: null,
            dropZoneEnabled: !0,
            dropZoneTitleClass: "file-drop-zone-title",
            fileActionSettings: {},
            otherActionButtons: "",
            textEncoding: "UTF-8",
            ajaxSettings: {},
            ajaxDeleteSettings: {},
            showAjaxErrorDetails: !0
          },
          e.fn.fileinputLocales.en = {
            fileSingle: "file",
            filePlural: "files",
            browseLabel: "选择文件 &hellip;",
            removeLabel: "删除",
            removeTitle: "Clear selected files",
            cancelLabel: "Cancel",
            cancelTitle: "Abort ongoing upload",
            uploadLabel: "Upload",
            uploadTitle: "Upload selected files",
            msgZoomTitle: "View details",
            msgZoomModalHeading: "Detailed Preview",
            msgSizeTooLarge: 'File "{name}" (<b>{size} KB</b>) exceeds maximum allowed upload size of <b>{maxSize} KB</b>.',
            msgFilesTooLess: "You must select at least <b>{n}</b> {files} to upload.",
            msgFilesTooMany: "Number of files selected for upload <b>({n})</b> exceeds maximum allowed limit of <b>{m}</b>.",
            msgFileNotFound: 'File "{name}" not found!',
            msgFileSecured: 'Security restrictions prevent reading the file "{name}".',
            msgFileNotReadable: 'File "{name}" is not readable.',
            msgFilePreviewAborted: 'File preview aborted for "{name}".',
            msgFilePreviewError: 'An error occurred while reading the file "{name}".',
            msgInvalidFileType: 'Invalid type for file "{name}". Only "{types}" files are supported.',
            msgInvalidFileExtension: 'Invalid extension for file "{name}". Only "{extensions}" files are supported.',
            msgValidationError: "File Upload Error",
            msgLoading: "Loading file {index} of {files} &hellip;",
            msgProgress: "Loading file {index} of {files} - {name} - {percent}% completed.",
            msgSelected: "{n} {files} selected",
            msgFoldersNotAllowed: "Drag & drop files only! {n} folder(s) dropped were skipped.",
            msgImageWidthSmall: 'Width of image file "{name}" must be at least {size} px.',
            msgImageHeightSmall: 'Height of image file "{name}" must be at least {size} px.',
            msgImageWidthLarge: 'Width of image file "{name}" cannot exceed {size} px.',
            msgImageHeightLarge: 'Height of image file "{name}" cannot exceed {size} px.',
            dropZoneTitle: "Drag & drop files here &hellip;"
          },
          e.extend(e.fn.fileinput.defaults, e.fn.fileinputLocales.en),
          e.fn.fileinput.Constructor = J,
          e(document).ready(function() {
            var i = e("input.file[type=file]");
            i.length && i.fileinput()
          })
    } (window.jQuery);