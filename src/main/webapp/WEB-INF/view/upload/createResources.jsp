<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-13
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>上传文件-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/fileinput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeList.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/fileinput_locale_zh.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
    <style>
        body {
            font-size: 14px;
        }
        ul li {
            list-style: none;
        }
        .UE-container {
            display: block;
            border: 1px solid #CCCCCC;
            overflow: hidden;
            margin: 0;
            padding: 0;
        }
        .myLabel {
            border-radius: 99px;
            transition: all 0.1s ease-in-out;
            display: inline-block;
            padding: 5px 10px;
            line-height: 1;
            margin: 0 5px 5px 0;
            background: #F4F5F5;
            color: #666666;
            font-size: 13px;
            text-decoration: none;
            cursor: pointer;
        }
        .myLabel:hover {
            color: #00B4B3;
            background: #E7E9E9;
        }
        .guanlian_show {
            padding: 4px;
            margin-left: 4px;
            margin-bottom: 4px;
            float: left;
            border: 1px solid #EEEEEE;
            background: #F4F5F5;
        }
        .guanlian_show .cursor {
            cursor: pointer;
            margin-left: 8px;
        }
        .many-upload .kv-fileinput-upload {
            display: none!important;
        }
        .file-footer-buttons button:first-child {
            display: none;
        }
    </style>
    <script>
        function clickShowMenu(temp) {
            var parent = $(temp).parent();
            var next = parent.next();
            var display = $(next).css('display');
            if(display == 'none'){

                $(next).css('display' , 'block');
                $(temp).attr('class' , 'glyphicon glyphicon-chevron-down')
            }else {

                $(next).css('display' , 'none');
                $(temp).attr('class' , 'glyphicon glyphicon-chevron-up')
            }
        }
        function clickGetConent(temp) {
            var html = $(temp).html();
            var jQuery = $(temp).next();
            var html2 = jQuery.html();
            var jQuery2 = $(temp).parent().parent().prev().children('.bigStyle');
            var html3 = jQuery2.html();
            $('#myModal').modal('hide');
            $('.writeContent').attr('value' , html);
            $('.writeContent').next().attr('value' , html2);
            $('.writeContent').next().next().attr('value' , html3);
        }
        function clickShwoInput(temp) {
            var html = $(temp).html();
            input = $("#id").val();
            if(input != "" && input != undefined){
                $("#id").val($("#id").val()+","+html);//填充数据逗号隔开
            }else {
                $("#id").val(html);
            }
        }

        function remove_guanlian(temp) {
            var parent = $(temp).parent();
            $(parent).css('display' , 'none');
            $(parent).html('');
        }

        //显示关联知识
        /*<div class="guanlian_show">
         <span class="glyphicon glyphicon-link"></span>
         <span class="guanlian_name">摔跤吧！爸爸</span>
         <span class="glyphicon glyphicon-search cursor"></span>
         <span class="glyphicon glyphicon-remove cursor"></span>
         </div>*/
        function guanlian_knowledge(temp) {

            var content = "";
            var parent = $(temp).parent().parent();
            var attr = $(parent).attr('id');
            var jQuery = $(parent).children().first();
            var html = jQuery.html();
            content += '<div class="guanlian_show">' +
                '<span class="glyphicon glyphicon-link"></span>' +
                '<span class="guanlian_name">'+ html +'</span>' +
                '<span class="glyphicon glyphicon-search cursor"></span>' +
                '<span class="glyphicon glyphicon-remove cursor" onclick="remove_guanlian(this)"></span>' +
                '<input type="hidden" value="'+ attr +'" name="guanlianId">' +
                '</div>';
            $('#guanlian').append(content);
            $('#myModal_1').modal('hide');
        }
        $(function () {

            $('.backTop').click(function (event) {
                $('html,body').animate({scrollTop:0},500);
                return false;
            });
            $('.backTop').hover(function () {
                $('.backTop a img').attr('src' , '../img/top.png');
            },function () {
                $('.backTop a img').attr('src' , '../img/top_black.png');
            });

            $("#file-3").fileinput({
                showUpload: false, //显示上传按钮
                showCaption: false, //显示Input输入框
                allowedFileExtensions : ['jpg', 'png','gif'],
                browseClass: "btn btn-info",
                fileType: "any",
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
            });

            $("a[title='上传选中文件']").css('display' , 'none');
        });
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="knowledgeGroup">
            <div class="showPath">
                <div class="container">
                    <div class="showPathList">
                        <ol>
                            <li class="itemElement">
                                <a href="${pageContext.request.contextPath}/">
                                    <span>首页</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <li class="itemElement">
                                <a href="#">
                                    <span>上传知识</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row" style="margin-top: 26px;margin-bottom: 60px">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <form action="upload/fileadd" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="form-group many-uplaod">
                                    <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-preview-file-icon="" data-preview-file-type="any" name="file-1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">
                                            标题
                                            <span class="redCharacter">*</span>
                                        </label>
                                        <input type="text" class="form-control" name="knowtitle" placeholder="输入资源知识标题">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">
                                            文档分类
                                            <span class="redCharacter">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control writeContent" placeholder="选择文档分类" name="knowstypeid" readonly="readonly" style="cursor: not-allowed" value="">
                                                    <input type="hidden" name="stypeId" value="">
                                                    <input type="hidden" name="typeBigId" value="">

                                                    <div class="input-group-btn">
                                                        <button class="btn btn-info" data-toggle="modal" data-target="#myModal" type="button">选择分类</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row hidden-xs">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>标签</label>
                                        <input type="text" class="form-control"  name="knowtags" placeholder="输入类别标签,或从下方选择标签,多个标签间用逗号分隔" id="id" value="">
                                    </div>

                                </div>
                            </div>
                            <div class="row hidden-xs">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div>
                                            <span style="font-weight: bold">常用标签：</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">美国</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">纪录片</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">励志</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">足球</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">传记</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">剧情</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">篮球</span>
                                            <span class="myLabel" onclick="clickShwoInput(this)">喜剧</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">预览图</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input id="file-3" type="file" name="imgFile" multiple="false">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-left: 12px;padding-right: 12px">
                                <div class="col-xs-4" style="padding: 2px">
                                    <div class="form-group">
                                        <label for="">发布到小组</label>
                                        <select name="grouptype" id="" class="form-control selectpicker" title="请选择">
                                            <option value="0">否</option>
                                           <c:forEach items="${group}" var="g">

                                               <option value="${g.id}">${g.groupName}</option>
                                           </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4" style="padding: 2px">
                                    <div class="form-group">
                                        <label for="">
                                            编辑权限
                                            <span class="redCharacter">*</span>
                                        </label>
                                        <select name="writetype" id="" class="form-control selectpicker" title="请选择">

                                            <option value="1">创建人</option>
                                            <option value="2">小组</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4" style="padding: 2px">
                                    <div class="form-group">
                                        <label for="">
                                            阅读权限
                                            <span class="redCharacter">*</span>
                                        </label>
                                        <select name="readtype" id="" class="form-control selectpicker" title="请选择">

                                            <option value="1">创建人</option>
                                            <option value="2">小组</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="">
                                        摘要
                                        <span class="redCharacter">*</span>
                                    </label>
                                    <div class="UE-container UE-container-default" style="width: 100%">
                                        <!-- 加载编辑器的容器 -->
                                        <script id="container" name="content" type="text/plain">
        这里写你的摘要
 </script>
                                        <!-- 配置文件 -->
                                        <script type="text/javascript" src="${pageContext.request.contextPath}/statics/UEditor/ueditor.config_1.js"></script>
                                        <!-- 编辑器源码文件 -->
                                        <script type="text/javascript" src="${pageContext.request.contextPath}/statics/UEditor/ueditor.all.js"></script>
                                        <!-- 实例化编辑器 -->
                                        <script type="text/javascript">
                                            var ue = UE.getEditor('container',{
                                                toolbars: [
                                                    [
//                'anchor', //锚点
                                                        'undo', //撤销
//                'redo', //重做
                                                        'bold', //加粗 //y
                                                        'indent', //首行缩进
//                'snapscreen', //截图
                                                        'italic', //斜体 //y
                                                        'underline', //下划线 //y
                                                        'strikethrough', //删除线 //y
//                'subscript', //下标
//                'fontborder', //字符边框
//                'superscript', //上标
//                'formatmatch', //格式刷
                                                        'source', //源代码
//                                                        'blockquote', //引用
//                'pasteplain', //纯文本粘贴模式
                                                        'selectall', //全选
//                'print', //打印
//                                                        'preview', //预览
//                                                        'horizontal', //分隔线 //y
                                                        'removeformat', //清除格式 //y
//                                                        'time', //时间
//                'date', //日期
//                                                        'unlink', //取消链接
//                'insertrow', //前插入行
//                'insertcol', //前插入列
//                'mergeright', //右合并单元格
//                'mergedown', //下合并单元格
//                'deleterow', //删除行
//                'deletecol', //删除列
//                'splittorows', //拆分成行
//                'splittocols', //拆分成列
//                'splittocells', //完全拆分单元格
//                                                        'deletecaption', //删除表格标题
                                                        'inserttitle', //插入标题 //y
//                                                        'mergecells', //合并多个单元格
//                                                        'deletetable', //删除表格
                                                        'cleardoc', //清空文档
//                                                        'insertparagraphbeforetable', //"表格前插入行"
                                                        'insertcode', //代码语言  //y
                                                        'fontfamily', //字体 //y
                                                        'fontsize', //字号 //y
//                                                        'paragraph', //段落格式 //y
//                                                        'simpleupload', //单图上传 //y
//                                                        'insertimage', //多图上传 //y
//                'edittable', //表格属性
//                'edittd', //单元格属性
//                                                        'link', //超链接 //y
//                'emotion', //表情
//                'spechars', //特殊字符
//                'searchreplace', //查询替换
//                'map', //Baidu地图
//                'gmap', //Google地图
//                                                        'insertvideo', //视频 //y
//                'help', //帮助
                                                        'justifyleft', //居左对齐 //y
                                                        'justifyright', //居右对齐 //y
                                                        'justifycenter', //居中对齐 //y
                                                        'justifyjustify', //两端对齐
                                                        'forecolor', //字体颜色 //y
//                                                        'backcolor', //背景色
//                                                        'insertorderedlist', //有序列表 //y
//                                                        'insertunorderedlist', //无序列表 //y
//                                                        'fullscreen', //全屏 //y
//                'directionalityltr', //从左向右输入
//                'directionalityrtl', //从右向左输入
//                                                        'rowspacingtop', //段前距
//                                                        'rowspacingbottom', //段后距
//                                                        'pagebreak', //分页 //y
//                'insertframe', //插入Iframe
//                'imagenone', //默认
//                'imageleft', //左浮动
//                'imageright', //右浮动
//                                                        'attachment', //附件
//                'imagecenter', //居中
//                'wordimage', //图片转存
                                                        'lineheight', //行间距 //y
//                'edittip ', //编辑提示
//                                                        'customstyle', //自定义标题
                                                        'autotypeset', //自动排版 //y
//                'webapp', //百度应用
//                'touppercase', //字母大写
//                'tolowercase', //字母小写
//                'background', //背景
//                                                        'template', //模板
//                'scrawl', //涂鸦
//                                                        'music', //音乐 //y
//                                                        'inserttable', //插入表格 //y
//                                                        'drafts', // 从草稿箱加载 //y
//                                                        'charts' // 图表
                                                    ]
                                                ],
                                                autoHeightEnabled: true,
                                                autoFloatEnabled: true
                                            });

                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 26px;text-align: center">
                                <button type="submit" class="btn btn-info btn-lg">提交</button>

                            </div>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
        </div>
        <%@include file="../common/footer.jsp"%>
        <!--回到顶部-->
        <%@include file="../common/rocket.jsp"%>
    </main>
    <div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-top: 150px">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 id="myModalLabel" class="modal-title">选择分类知识</h4>
                </div>
                <div class="modal-body">
                    <div class="knowledgeList" style="margin-top: 0">
                        <ul class="knowledgeCategory">
                            <!--遍历大小分类-->
                            <c:forEach items="${btypelist}" var="i">
                                <li>
                                    <h5>
                                        <a href="#">${i.name}</a>
                                        <span class="bigStyle" style="display: none">${i.id}</span>
                                        <span class="redFont">${i.knums}</span>
                                        <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-up" onclick="clickShowMenu(this)"></a>
                                    </h5>
                                    <ul class="clickShowMenu" style="display:block">
                                        <!--遍历小标签-->
                                        <c:forEach  items="${i.stypes}" var="t">
                                            <li>
                                                <a class="ul-2-menu" onclick="clickGetConent(this)"><c:out value="${t.name}"></c:out></a>
                                                <span style="display:none;">${t.id}</span>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </li>


                            </c:forEach>

                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade in" id="myModal_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-top: 150px;width: 700px">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 id="" class="modal-title">选择知识</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="input-group" style="max-width: 250px">
                            <input type="text" class="form-control input-sm" placeholder="输入知识名称或者名称查询">
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </div>
                    <div style="height: 300px;overflow: auto">
                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <th>知识名称</th>
                                <th>知识类型</th>
                                <th>分类</th>
                                <th></th>
                            </tr>
                            <tr id="1">
                                <td>Unity引擎与C#脚本简介 - 腾讯云+社区 - 博客园</td>
                                <td>文档知识</td>
                                <td>彩票</td>
                                <td>
                                    <button onclick="guanlian_knowledge(this)" type="button" class="btn btn-primary btn-xs userdemocs">
                                        关联
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    
</div>
</body>
<script>
    $("#file-1").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        overwriteInitial: false,
        uploadAsync: false,
        maxFileSize:0,
        language:'zh',
        maxFilePreviewSize: 1256000000,
        //allowedFileTypes: ['image', 'video', 'flash'],
        enctype:"multipart/form-data"

    });
</script>
</html>
