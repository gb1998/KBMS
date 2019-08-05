<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-04-16
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>摔跤吧！爸爸——knowAll</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeContent.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/wangEditor.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
    <style>
        #social-main {
            position: relative;
            margin: 0 auto;
            text-align: center;
            width: 243px;
        }
        #social-main a {
            text-decoration: none;
        }
        #social-main i {
            color: #999999;
            margin: 0 5px 0 0;
        }
        #social-main span {
            float: left;
        }
        .like {
            text-align: center;
        }
        .like a {
            background: #ffffff;
            width: 120px;
            display: block;
            border: 1px solid #DDDDDD;
            float: left;
            padding-right: 15px;
            color: #999999;
            line-height: 36px;
            border-radius: 2px;
        }
        .like a:hover {
            background: #f1f1f1;
            color: #444444;
            transition: all 0.2s ease-in 0s;
        }
        .like a:hover .fa-thumbs-up {

            transition: all 0.2s ease-in 0s;
            color: #d03f42!important;
        }
        .shang-empty {
            position: absolute;
            left: 90px;
            top: 0;
            width: 62px;
            height: 38px;
            overflow: hidden;
        }
        .shang-empty span {
            background: #ffffff;
            width: 60px;
            height: 60px;
            display: block;
            margin: -10px 0 0 0;
            border-radius: 60px;
            border: 1px solid #DDDDDD;
        }
        .shang-s {
            height: 37px;
        }
        .shang-s a {
            position: absolute;
            background: #ffffff;
            left: 96px;
            top: -5px;
            width: 48px;
            font-size: 16px;
            line-height: 45px;
            display: block;
            border: 1px solid #DDDDDD;
            border-radius: 40px;
            color: #999999;
        }
        #social-main .share-sd .share-s {
            margin-top: 25px!important;
        }
        .share-s a {
            margin-top: -25px;
            background: #ffffff;
            width: 120px;
            display: block;
            padding-left: 15px;
            border: 1px solid #DDDDDD;
            text-align: center;
            color: #999999;
            line-height: 36px;
        }
        .share-sd {
            text-align: center;
        }
        .payment-way label {
            cursor: pointer;
            font-weight: 400;
            display: inline-block;
            font-size: 14px;
            margin: 0 15px 0 0;
            padding: 0;
        }
        .payment-way input[type='radio'] {
            vertical-align: middle;
            margin: -2px 5px 0 0;
        }

        .qrcode-border {
            border-radius: 29.97px;
            width: 236.89px;
            height: 236.89px;
            padding: 18.05px;
            margin: 0 auto;
            margin-top: 25.53px;
        }
        .qrode-tip {
            width: 48.13px;
            position: relative;
            margin: 0 auto;
            text-align: center;
            font-size: 12px;
            font-weight: 700;
            background: #ffffff;
            height: 15px;
            line-height: 15px;
            margin-top: -12px;
        }

        /*资源知识*/
        .parent {
            width: 800px;
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }
        .panel-footer a {
            color: #666666;
        }
    </style>
    <script>
        $(function () {
            var wangEditor = window.wangEditor;
            var editor = new wangEditor('#wangEditorToolbar' , '#wangEditorText');
//            隐藏富文本编辑器的一些选项
            editor.customConfig.menus = [
                'head',  // 标题
                'bold',  // 粗体
                'italic',  // 斜体
                'underline',  // 下划线
                'strikeThrough',  // 删除线
                'foreColor',  // 文字颜色
                'backColor',  // 背景颜色
                'justify',  // 对齐方式
                'quote',  // 引用
                'emoticon',  // 表情
                'undo',  // 撤销
                'redo'  // 重复
            ];
//未登录情况
//            editor.$textElem.attr('contenteditable' , false);
            editor.create();


            //是页面保持在顶部
            $("html, body").scrollTop(0).animate({scrollTop: $("#scroll").offset().top});


        });

        /* .like a:hover {
         background: #f1f1f1;
         color: #444444;
         transition: all 0.2s ease-in 0s;
         }
         .like a:hover .fa-thumbs-up {

         transition: all 0.2s ease-in 0s;
         color: #d03f42!important;
         }*/
        //        点赞变红
        function ZanToRed() {
            $('.like a').css({background:'#f1f1f1' , color:'#444444'});
            $('.like .fa-thumbs-up').css('color' , '#d03f42');
            $('.like a .count').html('1');
        }

        function clickChecked(temp) {

            $('.my-payment-img').each(function () {
                $(this).css('display' , 'none');
            });
            var attr = $(temp).attr('class');

            if(attr === 'payment-one'){
                $('.payment-one').eq(1).css('display' , 'block');
            }else if(attr === 'payment-two') {
                $('.payment-two').eq(1).css('display' , 'block');
            }else if(attr === 'payment-three') {
                $('.payment-three').eq(1).css('display' , 'block');
            }

        }


        function catelogClick(item) {
            $('.tryTry').css({background:"transparent" , color:"#666"});
            $(item).css({background:"#31C1C0" , color:"#fff"});
        }


        //评论点赞
        function clickBlueZan(temp) {
            if($(temp).attr('src') === './img/dianzan.png'){

                $(temp).attr('src' , './img/好评.png');
            }else {
                $(temp).attr('src' , './img/dianzan.png');
            }
        }

        //大回复
        function clickShowBigReply(temp) {

            if($(temp).attr('src') === './img/liuyan.png') {
                $(temp).attr('src' , './img/liuyan_blue.png');
                $(temp).parent().next('.second-comment').fadeIn('fast')
            }else {
                $(temp).attr('src' , './img/liuyan.png');
                $(temp).parent().next('.second-comment').fadeOut('fast')
            }


        }

        //小回复
        function clickHiddenHuiFU(temp) {


            var next = $(temp).parent()
                .parent().parent()
                .parent().parent()
                .parent().parent()
                .next('.huifu');

            var css = next.css('display');
            if(css === 'block') {
                $(next).fadeOut('fast')
            }else {
                $(next).fadeIn('fast')
            }
        }
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content" id="scroll">
        <div  class="knowledgeContent">
            <div class="showPath">
                <div class="container">
                    <div class="showPathList">
                        <ol>
                            <li class="itemElement">
                                <a href="#">
                                    <span>首页</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <li class="itemElement">
                                <a href="#">
                                    <span>资源知识</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="article">
                <div class="container">
                    <div class="col-md-12">
                        <div class="article-tit">
                           ${doc.title}
                        </div>
                        <div class="article-intro">
                            作者:
                            <span class="author">
                            ${doc.user.userName}
                            </span>
                            <fmt:formatDate  value="${doc.createtime}" pattern="yyyy年MM月dd日"></fmt:formatDate>
                            <b>发布在分类</b>
                            /
                            <a href="#">${doc.btype.name}</a>
                            /
                            <a href="#">${doc.stype.name}</a>
                            <span style="margin-left: 10px">
                                <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting"  style="width: 15px;height: 15px">
                                125
                            </span>
                            <span style="margin-left: 10px">

                                <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="waiting"  style="width: 12px;height: 12px">
                                <!--点赞成功-->
                                <!--<img src="./img/zan_blue.png" alt="waiting"  style="width: 12px;height: 12px">-->
                                125
                            </span>

                        </div>
                        <hr>
                        <div class="row" style="margin-top: 26px;margin-bottom: 15px">
                            <c:forEach items="${filelist}" var="f">

                                    <div class="col-md-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body" style="padding-bottom: 4px">
                                                <div class="parent" style="height: 200px">
                                                    <c:if test="${f.exname eq 'doc' || f.exname eq 'docx'}">
                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/statics/img/802格式_文档docx.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                    </a>
                                </c:if>
                                                    <c:if test="${f.exname eq 'xlsx' || f.exname eq 'xls'}">

                                                    <a href="#">
                                                        <img src="${pageContext.request.contextPath}/statics/img/microsoftexcel.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                    </a>
                                                    </c:if>
                                                    <c:if test="${f.exname eq 'ppt'||f.exname eq 'pptx'}">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/statics/img/806格式_文档pptx.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${f.exname eq 'mp3'}">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/statics/img/820格式_音频mp3.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${f.exname eq 'mp4'}">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/statics/img/840格式_视频mp4.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${f.exname eq 'pdf'}">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/statics/img/807格式_文档pdf.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${f.exname eq 'zip'}">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath}/statics/img/880格式_压缩包zip.png" alt="waiting" style="max-height: 120px;max-width: 176px">
                                                        </a>
                                                    </c:if>
                                                </div>


                                                <div style="white-space: nowrap;color: #666;overflow: hidden;text-overflow: ellipsis;text-align: center;font-size: 14px">
                                                   ${f.title}.${f.exname}
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                                <div style="overflow: hidden;height: 20px;text-align: center;font-size: 14px">

                                                    <a href="#" title="查看文件详情">
                                                <span class="glyphicon glyphicon-info-sign">

                                                </span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/file/download/${f.fileuuid}/${f.exname}" title="下载文件">
                                                        <span class="glyphicon glyphicon-download-alt"></span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/file/${f.fileuuid}" title="预览文件" target="_blank">
                                                        <span class="glyphicon glyphicon-eye-open"></span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                                    <span class="articleTags">
                                    Tagged:
                                     <c:forEach items="${tagsList}" var="i">
                                         <a href="#">${i.name}</a>
                                     </c:forEach>
                                </span>

                            <div id="social-main" style="margin-top: 50px">
                                        <span class="like">
                                            <a href="javascript:;" title="点赞" onclick="ZanToRed()">
                                                <i class="fa fa-thumbs-up"></i>
                                                赞
                                                <i class="count">0</i>
                                            </a>
                                        </span>
                                <div class="shang-p">
                                    <div class="shang-empty">
                                        <span></span>
                                    </div>
                                    <span class="shang-s">
                                                <a href="" data-toggle="modal" data-target="#myModal" type="button">赏</a>
                                            </span>
                                </div>
                                <div class="share-sd">
                                            <span class="share-s">
                                                <a href="" title="分享">
                                                    <i class="fa fa-share-alt"></i>
                                                    分享
                                                </a>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row setMagin">
                                    <div class="col-md-12">
                                        <span class="comment">
                                            <img src="${pageContext.request.contextPath}/statics/img/liuyan_blue.png" alt="waiting">
                                            知识评论
                                        </span>
                                        <span class="commentCount pull-right" style="font-size: 16px; margin-left: 16px">
                                            当前评论数
                                            <span>
                                                <a href="#" style="color: #377bb5; font-weight:bold ">${doc.comments}</a>
                                                条
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <hr class="hr-split">
                                    </div>
                                    <div class="col-md-12">
                                        <div id="wangEditorToolbar" class="wangEditorToolbar hidden-xs"></div>
                                        <div id="wangEditorText" class="wangEditorText"></div>
                                        <!--未登录情况-->
                                        <!--<div id="wangEditorText" class="wangEditorText">请登陆后发表评论</div>-->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <button type="button" class="submitComment">发表评论</button>
                                        <!--未登录情况-->
                                        <!--<button type="submit" class="submitComment" disabled="disabled" style="cursor: not-allowed;background: #8D8D8D">登录后评论</button>-->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="user-discuss hidden-xs">
                                        <div class="user-discuss-list">
                                            <div class="user-discuss-content">
                                                <div class="media">
                                                    <a href="#" class="user-img">
                                                        <img src="./img/default.png" alt="waiting">
                                                        <p class="user-name">guest</p>
                                                    </a>
                                                    <div class="media-body">
                                                        <div class="pull-left" style="margin-left: 4px">
                                                            <div class="media-body-title">
                                                                <a href="#" class="media-tit">

                                                                </a>
                                                            </div>
                                                            <div>
                                                                <p class="media-body-info">该篇文章很具有代表性，写的非常好，立 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores nulla optio similique vitae. Adipisci aliquid, assumenda autem, blanditiis eaque earum error et impedit iure odit, quia sunt tempore vero. Ipsa?</p>
                                                            </div>
                                                            <div class="media-pop" style="width: 100%">
                                                                <img src="${pageContext.request.contextPath}/static/img/dianzan.png" alt="" onclick="clickBlueZan(this)" style="cursor: pointer">
                                                                9
                                                                <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt=""  style="cursor:pointer" onclick="clickShowBigReply(this)">
                                                                0
                                                                <span style="float: right">评论于2018-01-26 06:44</span>
                                                            </div>
                                                            <div class="second-comment"  style="display: none">
                                                                <div class="user-discuss" style="padding-left: 0">
                                                                    <div class="user-discuss-list">
                                                                        <div class="user-discuss-content">
                                                                            <div class="media">
                                                                                <a href="#" class="user-img">
                                                                                    <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting">
                                                                                    <p class="user-name">guest</p>
                                                                                </a>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left" style="margin-left: 4px">
                                                                                        <div class="media-body-title">
                                                                                            <a href="#" class="media-tit">

                                                                                            </a>
                                                                                        </div>
                                                                                        <div>
                                                                                            <p class="media-body-info">该篇文章很具有代表性，写的非常好，立刻有，Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis deleniti dolorem doloremque
                                                                                        </div>
                                                                                        <div class="media-pop" style="width: 100%">
                                                                                            <span style="float: right;cursor: pointer" onclick="clickHiddenHuiFU(this)">回复</span>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <form action="" class="huifu" style="display: none">
                                                                    <div class="form-group">
                                                                        <textarea name="" id="" rows="2" class="form-control" readonly="readonly"></textarea>
                                                                        <div class="col-md-12 text-center">
                                                                            <button type="submit" class="submitComment">回复</button>
                                                                            <!--未登录情况-->
                                                                            <!--<button type="button" class="submitComment">登录后回复</button>-->
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                                <div class="user-discuss" style="padding-left: 0">
                                                                    <div class="user-discuss-list">
                                                                        <div class="user-discuss-content">
                                                                            <div class="media">
                                                                                <a href="#" class="user-img">
                                                                                    <img src="./img/default.png" alt="waiting">
                                                                                    <p class="user-name">guest</p>
                                                                                </a>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left" style="margin-left: 4px">
                                                                                        <div class="media-body-title">
                                                                                            <a href="#" class="media-tit">

                                                                                            </a>
                                                                                        </div>
                                                                                        <div>
                                                                                            <p class="media-body-info">该篇文章很具有代表性，写的非常好，立刻有，Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis deleniti dolorem doloremque
                                                                                        </div>
                                                                                        <div class="media-pop" style="width: 100%">
                                                                                            <span style="float: right;cursor: pointer" onclick="clickHiddenHuiFU(this)">回复</span>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <form action="" class="huifu" style="display: none">
                                                                    <div class="form-group">
                                                                        <textarea name="" id="" rows="2" class="form-control"></textarea>
                                                                        <div class="col-md-12 text-center">
                                                                            <button type="submit" class="submitComment">回复</button>
                                                                            <!--未登录情况-->
                                                                            <!--<button type="button" class="submitComment">登录后回复</button>-->
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-discuss-list">
                                            <div class="user-discuss-content">
                                                <div class="media">
                                                    <a href="#" class="user-img">
                                                        <img src="./img/default.png" alt="waiting">
                                                        <p class="user-name">guest</p>
                                                    </a>
                                                    <div class="media-body">
                                                        <div class="pull-left" style="margin-left: 4px">
                                                            <div class="media-body-title">
                                                                <a href="#" class="media-tit">

                                                                </a>
                                                            </div>
                                                            <div>
                                                                <p class="media-body-info">该篇文章很具有代表性，写的非常好，立 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci amet aut ducimus ea eius enim et excepturi facere, iusto laborum magni quaerat quas repudiandae rerum sequi, sunt temporibus vero voluptate!</p>
                                                            </div>
                                                            <div class="media-pop" style="width: 100%">
                                                                <img src="./img/dianzan.png" alt="" onclick="clickBlueZan(this)" style="cursor: pointer">
                                                                9
                                                                <img src="./img/liuyan.png" alt=""  style="cursor:pointer" onclick="clickShowBigReply(this)">
                                                                0
                                                                <span style="float: right">评论于2018-01-26 06:44</span>
                                                            </div>
                                                            <div class="second-comment"  style="display: none">
                                                                <div class="user-discuss" style="padding-left: 0">
                                                                    <div class="user-discuss-list">
                                                                        <div class="user-discuss-content">
                                                                            <div class="media">
                                                                                <a href="#" class="user-img">
                                                                                    <img src="./img/default.png" alt="waiting">
                                                                                    <p class="user-name">guest</p>
                                                                                </a>
                                                                                <div class="media-body">
                                                                                    <div class="pull-left" style="margin-left: 4px">
                                                                                        <div class="media-body-title">
                                                                                            <a href="#" class="media-tit">

                                                                                            </a>
                                                                                        </div>
                                                                                        <div>
                                                                                            <p class="media-body-info">该篇文章很具有代表性，写的非常好，立刻有，Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis deleniti dolorem doloremque
                                                                                        </div>
                                                                                        <div class="media-pop" style="width: 100%">
                                                                                            <span style="float: right;cursor: pointer" onclick="clickHiddenHuiFU(this)">回复</span>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <form action="" class="huifu" style="display: none">
                                                                    <div class="form-group">
                                                                        <textarea name="" id="" rows="2" class="form-control"></textarea>
                                                                        <div class="col-md-12 text-center">
                                                                            <button type="submit" class="submitComment">回复</button>
                                                                            <!--未登录情况-->
                                                                            <!--<button type="button" class="submitComment">登录后回复</button>-->
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="setMagin">
                                        <div class="col-md-6 addMargin">
                                            <span class="comment">
                                                <img src="./img/知识库.png" alt="waiting">
                                                同类知识
                                            </span>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <hr class="hr-split">
                                                    <div class="knowledgeSM">
                                                        <ol>
                                                            <li>
                                                                <a href="#">摔跤吧！爸爸(豆瓣)</a>
                                                            </li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 addMargin">
                                             <span class="comment">
                                                <img src="./img/快速推荐.png" alt="waiting">
                                                关联知识
                                            </span>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <hr class="hr-split">
                                                    <div class="knowledgeSM">
                                                        <ol>
                                                            <li>
                                                                <a href="#">摔跤吧！爸爸(豆瓣)</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">高霸！我儿子</a>
                                                            </li>
                                                        </ol>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <%@include file="../common/footer.jsp"%>
        <!--回到顶部-->
       <%@include file="../common/rocket.jsp"%>
    </main>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-top: 150px;max-width: 390px">
            <div class="modal-content">
                <div class="modal-header" style="border: none">
                    <button class="close" type="button" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 id="myModalLabel" class="modal-title">选择打赏方式</h4>
                </div>
                <div class="modal-body payment-way">
                    <div class="my-payment">
                        <label for="radio-one" onclick="clickChecked(this)" class="payment-one">
                            <input id="radio-one" type="radio" class="reward-radio " name="payment" checked="checked">
                            微信红包
                        </label>
                        <label for="radio-two" onclick="clickChecked(this)" class="payment-two">
                            <input id="radio-two" type="radio" class="reward-radio " name="payment" >
                            qq钱包
                        </label>
                        <label for="radio-three" onclick="clickChecked(this)" class="payment-three">
                            <input id="radio-three" type="radio" class="reward-radio" name="payment">
                            支付宝
                        </label>
                    </div>
                    <div class="my-payment-img payment-one" style="display: block">
                        <div class="qrcode-border box-size" style="border: 9.02px solid rgb(60 , 175 , 54)">
                            <img src="./img/default.png" alt="waiting" style="display: inline-block">
                        </div>
                        <p class="qrode-tip" style="color: #3caf36;">打赏</p>
                    </div>
                    <div class="my-payment-img payment-two" style="display: none">
                        <div class="qrcode-border box-size" style="border: 9.02px solid rgb(102 , 153 , 204)">
                            <img src="./img/default.png" alt="waiting" style="display: inline-block">
                        </div>
                        <p class="qrode-tip" style="color: #6699cc">打赏</p>
                    </div>
                    <div class="my-payment-img payment-three" style="display: none">
                        <div class="qrcode-border box-size" style="border: 9.02px solid rgb(235 , 95 , 1)">
                            <img src="./img/default.png" alt="waiting" style="display: inline-block">
                        </div>
                        <p class="qrode-tip" style="color: #eb5f01">打赏</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
