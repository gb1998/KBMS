<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/4/12
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BigBang知识库</title>
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
        .column_title {
            color: #d9534f;
            font-size: 16px;
            font-weight: 700!important;
        }
    </style>
    <script>
        var editor = null;
        $(function () {
            var wangEditor = window.wangEditor;
             editor = new wangEditor('#wangEditorToolbar' , '#wangEditorText');
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
            <c:if test="${sessionScope.user != null}">
                editor.create();
            </c:if>
            <c:if test="${sessionScope.user == null}">
               //未登录情况
               editor.$textElem.attr('contenteditable' , false);
            </c:if>

            //是页面保持在顶部
            $("html, body").scrollTop(0).animate({scrollTop: $("#scroll").offset().top});


        });
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
            if($(temp).attr('src') === '${pageContext.request.contextPath}/statics/img/dianzan.png'){

                $(temp).attr('src' , '${pageContext.request.contextPath}/statics/img/好评.png');
            }else {
                $(temp).attr('src' , '${pageContext.request.contextPath}/statics/img/dianzan.png');
            }
        }

        //大回复
        function clickShowBigReply(temp) {

            if($(temp).attr('src') === '${pageContext.request.contextPath}/statics/img/liuyan.png') {
                $(temp).attr('src' , '${pageContext.request.contextPath}/statics/img/liuyan_blue.png');
                $(temp).parent().next('.second-comment').fadeIn('fast')
            }else {
                $(temp).attr('src' , '${pageContext.request.contextPath}/statics/img/liuyan.png');
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

        //评论功能的实现
        function comment() {

            alert("1");
            var url="${pageContext.request.contextPath}/comment/add";
            var params={
                content : editor.txt.html(),

                did:'${question.id}',
                uid:'${question.user.userId}'
            };
            alert(editor.txt.html());
            $.post(url, params, function(data) {
                alert(data.data);
                location.href="${pageContext.request.contextPath}/question/${question.id}";
            }, "json");
        }
    </script>
</head>
<body>
<div class="nav-index">
    <jsp:include page="../common/head.jsp"></jsp:include>
    <main class="cd-main-content" id="scroll">
        <div  class="knowledgeContent">
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
                                    <span>问答详情</span>
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
                            <span class="glyphicon glyphicon-question-sign"></span>
                            ${requestScope.question.title}
                        </div>
                        <div class="article-intro">
                            作者:
                            <span class="author">
                            ${requestScope.question.user.userName}
                            </span>
                            于<fmt:formatDate value="${requestScope.question.posttime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                            <%--hx 2018/4/12 a标签没有跳转--%>
                            <b>发布在分类</b>
                            /
                            <a href="#">${question.btype.name}</a>
                            /
                            <a href="#">${question.stype.name}</a>
                            <span style="margin-left: 10px">
                                <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting"  style="width: 15px;height: 15px">
                                ${requestScope.question.vistists}
                            </span>
                            <span style="margin-left: 10px">

                                <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="waiting"  style="width: 12px;height: 12px">
                                <!--点赞成功-->
                                <!--<img src="${pageContext.request.contextPath}/statics/img/zan_blue.png" alt="waiting"  style="width: 12px;height: 12px">-->
                                ${requestScope.question.comments}
                            </span>

                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="user-discuss">
                                        <h4 class="column_title">
                                            <span class="glyphicon glyphicon-star-empty">
                                                备选答案
                                            </span>
                                            <hr>
                                        </h4>
                                        <%--采纳的答案--%>
                                        <c:if test="${! empty sureanswer}">
                                            <div class="user-discuss-list">
                                                <div class="user-discuss-content">
                                                    <div class="media">
                                                        <a href="#" class="user-img">
                                                            <img src="/upload${sureanswer.user.userImgid}" alt="waiting">
                                                            <p class="user-name">${sureanswer.user.userName}</p>
                                                        </a>
                                                        <div class="media-body">
                                                            <div class="pull-left" style="margin-left: 4px">
                                                                <div class="media-body-title">
                                                                    <a href="#" class="media-tit">

                                                                    </a>
                                                                </div>
                                                                <div>
                                                                    <p class="media-body-info">${sureanswer.content}</p>
                                                                </div>
                                                                <div class="media-pop" style="width: 100%">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="" onclick="clickBlueZan(this)" style="cursor: pointer">
                                                                    ${sureanswer.favers}
                                                                    <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt=""  style="cursor:pointer" onclick="clickShowBigReply(this)">
                                                                    ${sureanswer.replyNums}
                                                                    <span style="float: right">评论于<fmt:formatDate value="${sureanswer.cTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                                                                </div>
                                                                <div class="second-comment"  style="display: none">
                                                                    <div class="user-discuss" style="padding-left: 0">
                                                                        <div class="user-discuss-list">
                                                                            <div class="user-discuss-content">
                                                                                <div class="media">
                                                                                    <a href="#" class="user-img">
                                                                                        <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting">
                                                                                        <p class="user-name">guest2</p>
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
                                                                                <c:if test="${!empty sessionScope.user}">
                                                                                    <button type="submit" class="submitComment">回复</button>
                                                                                </c:if>
                                                                                <c:if test="${empty sessionScope.user}">
                                                                                    <button type="button" class="submitComment" disabled="disabled">登录后回复</button>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <%--未被采纳答案--%>
                                        <c:forEach items="${requestScope.ucommentsList}" var="temp">
                                            <div class="user-discuss-list">

                                                <div class="user-discuss-content">
                                                    <div class="media">
                                                        <a href="#" class="user-img">
                                                            <img src="/upload${temp.user.userImgid}" alt="waiting">
                                                            <p class="user-name">${temp.user.userName}</p>
                                                        </a>
                                                        <div class="media-body">
                                                            <div class="pull-left" style="margin-left: 4px">
                                                                <div class="media-body-title">
                                                                    <a href="#" class="media-tit">

                                                                    </a>
                                                                </div>
                                                                <div>
                                                                    <p class="media-body-info">
                                                                        ${temp.content}
                                                                    </p>
                                                                </div>
                                                                <div class="media-pop" style="width: 100%">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="" onclick="clickBlueZan(this)" style="cursor: pointer">
                                                                    ${temp.favers}
                                                                    <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt=""  style="cursor:pointer" onclick="clickShowBigReply(this)">
                                                                    ${temp.replyNums}
                                                                    <span style="float: right">评论于<fmt:formatDate value="${temp.cTime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
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
                                                                            <div class="col-md-12 text-center">
                                                                                <c:if test="${!empty sessionScope.user}">
                                                                                    <textarea name="" id="" rows="2" class="form-control"></textarea>
                                                                                    <button type="submit" class="submitComment">回复</button>
                                                                                </c:if>
                                                                                <c:if test="${empty sessionScope.user}">
                                                                                    <textarea name="" id="" rows="2" class="form-control" disabled="disabled" readonly="readonly">请登陆后回复</textarea>
                                                                                    <button type="button" class="submitComment" disabled="disabled" style="cursor: not-allowed;background: #8D8D8D">登录后回复</button>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="row setMagin">
                                    <div class="col-md-12">
                                        <span class="comment">
                                            <img src="${pageContext.request.contextPath}/statics/img/liuyan_blue.png" alt="waiting">
                                            回答问题
                                        </span>
                                        <span class="commentCount pull-right" style="font-size: 16px; margin-left: 16px">
                                            当前回答数
                                            <span>
                                                <a href="#" style="color: #377bb5; font-weight:bold ">${question.comments}</a>
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
                                        <c:if test="${!empty sessionScope.user}">
                                            <div id="wangEditorToolbar" class="wangEditorToolbar hidden-xs"></div>
                                            <div id="wangEditorText" class="wangEditorText"></div>
                                        </c:if>
                                        <c:if test="${empty sessionScope.user}">
                                            <%--未登录情况--%>
                                            <div id="wangEditorText" class="wangEditorText">请登陆后发表回答</div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <c:if test="${!empty sessionScope.user}">
                                            <button type="button" class="submitComment" onclick="comment()">发表答案</button>
                                        </c:if>
                                        <c:if test="${empty sessionScope.user}">
                                            <%--未登录情况--%>
                                            <button disabled="disabled" type="button" class="submitComment" style="cursor: not-allowed;background: #8D8D8D">登录后回答</button>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="setMagin">
                                        <div class="col-md-6 addMargin">
                                            <span class="comment">
                                                <img src="${pageContext.request.contextPath}/statics/img/知识库.png" alt="waiting">
                                                同类问题
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
                                                <img src="${pageContext.request.contextPath}/statics/img/快速推荐.png" alt="waiting">
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
        <jsp:include page="../common/rocket.jsp"></jsp:include>
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
