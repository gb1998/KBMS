<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-04-18
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>创建问题-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-fileinput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeList.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap-fileinput.js"></script>
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
    </style>
    <script>
        $(function () {

            $('.backTop').click(function (event) {
                $('html,body').animate({scrollTop:0},500);
                return false;
            });
            $('.backTop').hover(function () {
                $('.backTop a img').attr('src' , '../img/top.png');
            },function () {
                $('.backTop a img').attr('src' , '../img/top_black.png');
            })
        });
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
            var smallTag = $(temp).next().html();
            var bigTag = $(temp).parent().parent().prev().html();
            $('#myModal').modal('hide');
            $('.writeContent').attr('value' , html);
            $('#SmallTag').attr('value' , smallTag);
            $('#BigTag').attr('value' , bigTag);
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
                                    <span>创建问题</span>
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
                        <form action="" class="">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">
                                            标题
                                            <span class="redCharacter">*</span>
                                        </label>
                                        <input type="text" class="form-control" placeholder="输入问题标题">
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
                                                    <input type="text" class="form-control writeContent" placeholder="选择文档分类" readonly="readonly" style="cursor: not-allowed" value="">
                                                    <input id="BigTag" type="hidden" name="BigTag" value="">
                                                    <input id="SmallTag" type="hidden" name="SmallTag" value="">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-info" data-toggle="modal" data-target="#myModal" type="button">选择分类</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="UE-container UE-container-default" style="width: 100%">
                                        <!-- 加载编辑器的容器 -->
                                        <script id="container" name="content" type="text/plain">
        这里写你的问题内容
 </script>
                                        <!-- 配置文件 -->
                                        <script type="text/javascript" src="${pageContext.request.contextPath}/statics/UEditor/ueditor.config_2.js"></script>
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
                                                        'blockquote', //引用
//                'pasteplain', //纯文本粘贴模式
                                                        'selectall', //全选
//                'print', //打印
                                                        'preview', //预览
                                                        'horizontal', //分隔线 //y
                                                        'removeformat', //清除格式 //y
                                                        'time', //时间
//                'date', //日期
                                                        'unlink', //取消链接
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
                                                        'deletetable', //删除表格
                                                        'cleardoc', //清空文档
//                                                        'insertparagraphbeforetable', //"表格前插入行"
                                                        'insertcode', //代码语言  //y
                                                        'fontfamily', //字体 //y
                                                        'fontsize', //字号 //y
                                                        'paragraph', //段落格式 //y
                                                        'simpleupload', //单图上传 //y
                                                        'insertimage', //多图上传 //y
//                'edittable', //表格属性
//                'edittd', //单元格属性
                                                        'link', //超链接 //y
//                'emotion', //表情
//                'spechars', //特殊字符
//                'searchreplace', //查询替换
//                'map', //Baidu地图
//                'gmap', //Google地图
                                                        'insertvideo', //视频 //y
//                'help', //帮助
                                                        'justifyleft', //居左对齐 //y
                                                        'justifyright', //居右对齐 //y
                                                        'justifycenter', //居中对齐 //y
                                                        'justifyjustify', //两端对齐
                                                        'forecolor', //字体颜色 //y
                                                        'backcolor', //背景色
                                                        'insertorderedlist', //有序列表 //y
                                                        'insertunorderedlist', //无序列表 //y
//                                                        'fullscreen', //全屏 //y
//                'directionalityltr', //从左向右输入
//                'directionalityrtl', //从右向左输入
                                                        'rowspacingtop', //段前距
                                                        'rowspacingbottom', //段后距
                                                        'pagebreak', //分页 //y
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
                                                        'charts' // 图表
                                                    ]
                                                ],
                                                autoHeightEnabled: true,
                                                autoFloatEnabled: true
                                            });

                                        </script>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 26px">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">上传预览图</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                                                    <div style="text-align: left;margin-bottom: 10px">
                                                    <span class="btn btn-info btn-file">
                                                        <span class="fileinput-new">选择文件</span>
                                                        <span class="fileinput-exists">换一张</span>
                                                        <input type="file" name="pic1" id="picID" accept="image/gif,image/jpeg,image/x-png"/>

                                                    </span>

                                                        <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                                                    </div>

                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 210px;max-height: 400px;"></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 26px;text-align: center">
                                <button type="submit" class="btn btn-info btn-lg">发布问题</button>

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
                            <li>
                                <h5>
                                    <a href="#">搞笑</a>
                                    <span class="redFont">4</span>
                                    <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-up" onclick="clickShowMenu(this)"></a>
                                </h5>
                                <!--大标签-->
                                <span style="display: none;">6</span>
                                <ul class="clickShowMenu" style="display: block;">
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">美食</a>
                                        <!--小标签-->
                                        <span style="display: none;">1</span>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">宠物</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">家庭</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">购物</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">服饰</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">家居</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">出行</a>
                                        <span class="redFont">1</span>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">美容</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">鲜花礼品</a>
                                    </li>
                                    <li>
                                        <a class="ul-2-menu" onclick="clickGetConent(this)">IT知识</a>
                                        <span class="redFont">3</span>
                                    </li>
                                </ul>
                            </li>
                        </ul>
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
</html>
