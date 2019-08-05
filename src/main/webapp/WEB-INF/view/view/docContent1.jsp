<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-09
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${doc.title}</title>
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
    <!--引入Jq和cookie的js-->
    <script src="${pageContext.request.contextPath}/statics/js/jquery.cookie.js"></script>
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
    </style>
    <script type="text/javascript">
       var editor;
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
//未登录情况
//
//
            //是否登录
            <c:choose>
            <c:when  test="${ not empty user}">
            editor.create();
            </c:when>
            <c:otherwise>

            editor.$textElem.attr('contenteditable' , false);
            </c:otherwise>

            </c:choose>

            //自动生成目录
//            <a href="#first" onclick="catelogClick(this)" class="tryTry">why choose knowAll</a>
            var padding=[10,20,30,40,50];
            $('#findH').find('h1,h2,h3,h4,h5').each(function(index,item){
                $(this).css('position' , 'relative');
                $(this).prepend( $('<a name="c'+index+'" style="position: absolute; top: -106px"></a>'));
                var headerText=$(this).text();
                var tagName=$(this)[0].tagName.toLowerCase();
                var tagIndex=parseInt(tagName.charAt(1))-1;
                //设置不同等级header的排列及缩进样式
                $('#category').append($('<a href="#c'+index+'" style="padding-left:'+padding[tagIndex]+'px;display:block;" onclick=catelogClick(this) class="tryTry">'+headerText+'</a>'));
            });

            //判断是否有标题，如果没有标题，将目录隐藏掉
            var html = $('#category').children().length;

            if(html === 0) {
                var parent = $('#category').parent();
                parent.css('display' , 'none');
            }

            //是页面保持在顶部
            $("html, body").scrollTop(0).animate({scrollTop: $("#scroll").offset().top});


        });
       //回复的实现
       function floorReply()
       {
           alert("你已经登录可以回复")
       }
            /* <!--ajax cookie 实现点赞和文章浏览记录的功能-->*/
            //评论功能的实现
            function comment() {


                var url="${pageContext.request.contextPath}/comment/add";
                var params={
                    content : editor.txt.html(),

                    did:'${doc.id}',
                    uid:'${user.userId}'
                };
                $.post(url, params, function(data) {
                    alert(data.data);
                    location.href="${pageContext.request.contextPath}/doc/view/${doc.id}";
                }, "json");
            }
        function increaseViewCount() {
            if ($.cookie("viewId")!=${doc.id}){
                $.ajax({
                    async:false,
                    type:"POST",
                    url:"${pageContext.request.contextPath}/doc/lookadd",
                    data:{
                        docId:${doc.id}
                    },
                    dataType:"text",
                    success:function (data) {
                        $(".viewCount").html(data)
                        $.cookie(
                            "viewId",
                            ${doc.id},
                            {
                                "path":"/",//cookie的路径
                            }
                        );

                    },
                    error:function()
                    {
                        alert("获取数据出错")

                    },

                });
            }
        }
        increaseViewCount();
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
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>



    <main class="cd-main-content" id="scroll">
        <div  class="knowledgeContent">
            <!--具体知识去掉路径导航-->
          <%--  <div class="showPath">
                <div class="container">
                    <div class="showPathList">
                        <ol>
                            <li class="itemElement">
                                <a href="${pageContext.request.contextPath}/index">
                                    <span>首页</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <li class="itemElement">
                                <a href="#">
                                    <span>${doc.title}</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>--%>
            <div class="article">
                <div class="container">
                    <div class="col-md-9">
                        <div class="article-tit">
                            ${doc.title}
                        </div>
                        <div class="article-intro">
                            作者:
                            <span class="author">
                                ${doc.user.userName}
                            </span>
                            于<fmt:formatDate  value="${doc.createtime}" pattern="yyyy年MM月dd日"></fmt:formatDate>
                            <b>发布在分类</b>
                            /
                            <a href="#">${doc.btype.name}</a>
                            /
                            <a href="#">${doc.stype.name}</a>
                            <span style="margin-left: 10px" class>
                                <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting"  style="width: 15px;height: 15px">
                                 <i class="viewCount">${doc.visitnums}</i>
                            </span>
                            <span style="margin-left: 10px">

                                <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="waiting"  style="width: 12px;height: 12px">
                                <!--点赞成功-->
                                <!--<img src="./img/zan_blue.png" alt="waiting"  style="width: 12px;height: 12px">-->
                                ${doc.favers}
                            </span>

                        </div>
                        <hr>
                        <div class="row" id="findH">
                            <div class="col-md-12">
                                ${doc.content}
                                <img src="${pageContext.request.contextPath}/statics/img/baba.jpg" alt="预览图" class="center-block img-thumbnail">
                                <span class="articleTags">
                                    Tagged:
                                    <!--遍历标签-->
                                    <c:forEach items="${tagsList}" var="i">
                                        <a href="#">${i.name}</a>
                                    </c:forEach>
                                   <%-- <a href="#">美国</a>
                                    <a href="#">纪录片</a>
                                    <a href="#">励志</a>
                                    <a href="#">足球</a>
                                    <a href="#">传记</a>
                                    <a href="#">剧情</a>
                                    <a href="#">篮球</a>
                                    <a href="#">喜剧</a>
                                    <a href="#">英国</a>--%>
                                </span>

                                <div id="social-main" style="margin-top: 50px">
                                        <span class="like">
                                            <a  title="点赞" onclick="dianzan()">
                                                <i class="fa fa-thumbs-up"></i>
                                                赞
                                                <i class="count">${doc.favers}</i>
                                            </a>
                                            <script>
                                                function dianzan() {
                                                    <c:choose>
                                                    <c:when test="${! empty user}">
                                                    alert('用户名不为空，可以点赞')
                                                    var url="${pageContext.request.contextPath}/doc/zanadd";
                                                    var params={

                                                        did:'${doc.id}',
                                                        uid:'${user.userId}'
                                                    };
                                                    $.post(url, params, function(data) {
                                                       // alert(data.data);
                                                        $(".count").html(data);

                                                    }, "json");

                                                    </c:when>
                                                    <c:otherwise>
                                                    alert('请你先登录')
                                                    window.location.href="${pageContext.request.contextPath}/login/webPage"
                                                    </c:otherwise>
                                                    </c:choose>
                                                }
                                            </script>
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
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row setMagin">
                                    <div class="col-md-12">
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
                                <!--判断是否登录-->
                                <c:choose>
                                    <c:when test="${not empty user}">
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
                                                <button type="button" class="submitComment" onclick="comment()">发表评论</button>
                                                <!--未登录情况-->
                                                <!--<button type="button" class="submitComment">登录后评论</button>-->
                                            </div>
                                        </div>

                                    </c:when>
                                    <c:otherwise>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <hr class="hr-split">
                                            </div>
                                            <div class="col-md-12">
                                                <div id="wangEditorToolbar" class="wangEditorToolbar hidden-xs"></div>

                                                <!--未登录情况-->
                                                <div id="wangEditorText" class="wangEditorText">请登陆后发表评论</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-center">

                                                <!--未登录情况-->

                                                <button type="submit" class="submitComment" disabled="disabled" style="cursor: not-allowed;background: #8D8D8D
">登录后评论</button>

                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                              <%--  <div class="row">
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
                                        <!--<button type="button" class="submitComment">登录后评论</button>-->
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="user-discuss hidden-xs">
                                        <!--评论-->
                                        <c:forEach items="${commentList}" var="c">
                                            <div class="user-discuss-list">
                                                <div class="user-discuss-content">
                                                    <div class="media">
                                                        <a href="#" class="user-img">
                                                            <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting">
                                                            <p class="user-name">${c.user.userName}</p>
                                                        </a>
                                                        <div class="media-body">
                                                            <div class="pull-left" style="margin-left: 4px">
                                                                <div class="media-body-title">
                                                                    <a href="#" class="media-tit">

                                                                    </a>
                                                                </div>
                                                                <div>
                                                                    <p class="media-body-info">${c.content}</p>
                                                                </div>
                                                                <div class="media-pop" style="width: 100%">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="" onclick="clickBlueZan(this)" style="cursor: pointer">
                                                                    9
                                                                    <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt=""  style="cursor:pointer" onclick="clickShowBigReply(this)">
                                                                    0
                                                                    <span style="float: right">评论于 <fmt:formatDate  value="${c.cTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>
                                                                </div>
                                                                <div class="second-comment"  style="display: none">
                                                                    <!--回复-->
                                                                    <c:forEach items="${replyList}" var="r">
                                                                        <c:if test="${r.commentId==c.id}">
                                                                            <div class="user-discuss" style="padding-left: 0">
                                                                                <div class="user-discuss-list">
                                                                                            <div class="user-discuss-content">

                                                                                                <div class="media">
                                                                                                    <a href="#" class="user-img">
                                                                                                        <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting">
                                                                                                        <p class="user-name">${r.user.userName}</p>
                                                                                                    </a>
                                                                                                    <div class="media-body">
                                                                                                        <div class="pull-left" style="margin-left: 4px">
                                                                                                            <div class="media-body-title">
                                                                                                                <a href="#" class="media-tit">

                                                                                                                </a>
                                                                                                            </div>
                                                                                                            <div>
                                                                                                                <p class="media-body-info">${r.content}
                                                                                                            </div>
                                                                                                            <div class="media-pop" style="width: 100%">
                                                                                                                <span style="float: right;cursor: pointer" onclick="clickHiddenHuiFU(this)">回复</span>
                                                                                                            </div>
                                                                                                        </div>

                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>


                                                                                        <%--
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
                                                                                        </div>--%>
                                                                                </div>
                                                                            </div>
                                                                            <form action="" class="huifu" style="display: none">
                                                                                <!--判断用户是否登录-->
                                                                                <c:choose>
                                                                                  <c:when test="${not empty user}">
                                                                                      <div class="form-group">
                                                                                          <textarea name="" id="" rows="2" class="form-control">@${r.user.userName}:</textarea>
                                                                                          <div class="col-md-12 text-center">
                                                                                              <a  type="button" class="submitComment" onclick="floorReply()">回复 </a>
                                                                                              <!--未登录情况-->
                                                                                              <!--<button type="button" class="submitComment">登录后回复</button>-->
                                                                                          </div>
                                                                                      </div>
                                                                                  </c:when>
                                                                                    <c:otherwise>
                                                                                        <div class="form-group">
                                                                                            <textarea name="" id="" rows="2" class="form-control" readonly="readonly">@${r.user.userName}:</textarea>
                                                                                            <div class="col-md-12 text-center">

                                                                                                <!--未登录情况-->
                                                                                                <button type="button" class="submitComment"  disabled="disabled" style="cursor: not-allowed;background: #8D8D8D">
                                                                                                    登录后回复
                                                                                                </button>


                                                                                            </div>
                                                                                        </div>
                                                                                    </c:otherwise>

                                                                                </c:choose>

                                                                            </form>
                                                                         <%--   <div class="user-discuss-content">

                                                                                <div class="media">
                                                                                    <a href="#" class="user-img">
                                                                                        <img src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting">
                                                                                        <p class="user-name">${r.user.userName}</p>
                                                                                    </a>
                                                                                    <div class="media-body">
                                                                                        <div class="pull-left" style="margin-left: 4px">
                                                                                            <div class="media-body-title">
                                                                                                <a href="#" class="media-tit">

                                                                                                </a>
                                                                                            </div>
                                                                                            <div>
                                                                                                <p class="media-body-info">${r.content}
                                                                                            </div>
                                                                                            <div class="media-pop" style="width: 100%">
                                                                                                <span style="float: right;cursor: pointer" onclick="clickHiddenHuiFU(this)">回复</span>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>--%>

                                                                        </c:if>

                                                                    </c:forEach>


                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                        <%--<div class="user-discuss-list">
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
                                                                <p class="media-body-info">该篇文章很具有代表性，写的非常好，立</p>
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
                                                                <p class="media-body-info">该篇文章很具有代表性，写的非常好，立</p>
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
                                                                        <textarea name="" id="1" rows="2" class="form-control"></textarea>
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
                                        </div>--%>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="setMagin">
                                        <div class="col-md-6 addMargin">
                                            <span class="comment">
                                                <img src="${pageContext.request.contextPath}/statics/img/知识库.png" alt="waiting">
                                                同类知识
                                            </span>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <hr class="hr-split">
                                                    <div class="knowledgeSM">
                                                        <ol>

                                                                <!--同类知识-->
                                                                <c:forEach items="${sameDoc}" var="d">
                                                                    <c:if test="${d.id!=doc.id}">
                                                                    <li> <a href="${pageContext.request.contextPath}/doc/view/${d.id}">${d.title}</a></li>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <%--<a href="#">摔跤吧！爸爸(豆瓣)</a>--%>

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
                                                            <c:forEach items="${releadDoc}" var="i">

                                                                <li>
                                                                    <a href="${pageContext.request.contextPath}/doc/view/${i.id}"}>${i.title}</a>
                                                                </li>

                                                            </c:forEach>
                                                           <%-- <li>
                                                                <a href="#">摔跤吧！爸爸(豆瓣)</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">高霸！我儿子</a>
                                                            </li>--%>
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
                    <div class="col-md-3 hidden-xs">
                        <div class="catelog" >
                            <div class="catelogList">
                                <h3>目录</h3>
                                <nav id="category">
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="container">
                <div class="row">

                    <div class="copyright">
                        © 版权
                        <a href="#">BigBang 知识库</a>
                        by
                        <a href="#">BigBang小队</a>
                    </div>
                    <div class="nav-footer clearfix hidden-xs">
                        <ul>
                            <li>
                                <a class="#">Features</a>
                            </li>
                            <li>
                                <a href="#">Shortcodes</a>
                            </li>
                            <li>
                                <a href="#">FAQ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--回到顶部-->
        <div class="backTop hidden-xs hidden-sm">
            <a>
                <img src="${pageContext.request.contextPath}/statics/img/top_black.png" alt="waiting">
            </a>
        </div>
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
