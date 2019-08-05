<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>index-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/index.js"></script>
</head>
<body>
<div class="nav-index">
    <header class="cd-main-header animate-search" style="display: none">
        <div class="cd-logo"><a href="#"><img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="Logo" style="width: 124px; height: 23px"></a></div>

        <nav class="cd-main-nav-wrapper">
            <a href="#search" class="cd-search-trigger cd-text-replace">Search</a>

            <ul class="cd-main-nav">
                <li>
                    <a href="#">
                        知识
                        <span class="glyphicon glyphicon-book"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        问答
                        <span class="glyphicon glyphicon-question-sign"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        小组
                        <span class="glyphicon glyphicon-tree-conifer"></span>
                    </a>
                </li>
                <li>
                    <a href="loginRegister.html">
                        登录/注册
                        <span class="glyphicon glyphicon-user"></span>
                    </a>
                </li>
            </ul> <!-- .cd-main-nav -->
        </nav> <!-- .cd-main-nav-wrapper -->

        <a href="#0" class="cd-nav-trigger cd-text-replace">Menu<span></span></a>
    </header>
    <main class="cd-main-content">
        <div class="site-header hidden-xs ">
            <div class="site-header_banner hidden-sm">
                <div class="container">
                    <div class="site-logo">
                        <a href="index.html">
                            <img src="./img/logo1%20(3).png" alt="waiting">
                        </a>
                    </div>
                    <div class="nav-header">
                        <ul class="menu-header-menu" >
                            <li class="menu-item menu-item-sp" >
                                <a href="#">
                                    个人信息
                                    <span class="caret"></span>
                                </a>
                                <ul class="sub-menu">
                                    <li class="sanJiao">
                                        <span class="glyphicon glyphicon-user" ></span>
                                        <a href="#">专家</a>
                                    </li>
                                    <li>
                                        <span class="glyphicon glyphicon-stats"></span>
                                        <a href="#">荣誉</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="menu-item">
                                <a href="#">
                                    知识
                                    <span class="glyphicon glyphicon-book"></span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="#">
                                    问答
                                    <span class="glyphicon glyphicon-question-sign"></span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="#">
                                    小组
                                    <span class="glyphicon glyphicon-tree-conifer"></span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="${pageContext.request.contextPath}/login/webPage">
                                    登录/注册
                                    <span class="glyphicon glyphicon-user"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="site-header_search">
                <div class="container">
                    <h2>知识&nbsp;&&nbsp;专注</h2>
                    <form action="" class="kb-search">
                        <input type="text" class="kb-search-file" placeholder="搜你所想...">
                        <img src="./img/loading.svg" alt="searching" class="kb-search-loader">
                        <div class="kb-search-live">
                            <ul class="kb-search-show">
                                <!--<li class="search-item-noResult search-item">
                                    <span>没有结果</span>
                                </li>-->
                                <li class="search-item search-item-result">
                                    <a href="#">
                                        <span class="search-tit">How Does the 14 Day Free Trial Work?</span>
                                        <span class="search-body">This is an example article. It is intended to demonstrate some of the key styling elements for knowAll, the Knowledge...</span>
                                    </a>
                                </li>
                                <li class="search-item search-item-all">
                                    <a href="#">
                                        查看所有信息
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container">
                <div class="col-md-8">
                    <div class="category">
                        <div class="kn-title">
                            <h2>
                                <i class="glyphicon glyphicon-tree-conifer"></i>
                                知识分类
                            </h2>
                        </div>
                        <div class="kn-category">
                            <!--使用foreach一直遍历取得的btype-->
                            <c:forEach items="${kind}" var="i">
                                <div class="col-md-6 one-category">
                                    <h2>
                                        <a href="${pageContext.request.contextPath}/type/view/${i.id}"><c:out value="${i.name}"></c:out></a>
                                        <span>
                                <span class="glyphicon glyphicon-bookmark"></span>
                              <c:out value="${i.knums}"></c:out>
                                <span class="glyphicon glyphicon-question-sign"></span>
                                <c:out value="${i.kquestion}"></c:out>
                            </span>
                                    </h2>
                                    <ul>
                                        <!--小分类-->
                                        <c:forEach items="${i.stypes}" var="t">
                                            <li><a href="${pageContext.request.contextPath}/type/view/${i.id}/?sid=${t.id}"><c:out value="${t.name}"></c:out></a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="new-knowledge">
                        <div class="kn-title">
                            <h2>
                                <i class="glyphicon glyphicon-star"></i>
                                最新知识
                                <a href="#" class="see-more">查看更多</a>
                            </h2>
                        </div>
                        <div class="new-kn-info">
                            <div class="col-md-12">
                                <ul>
                                    <!--最新知识-->
                                    <c:forEach items="${newestDoc}" var="t" >

                                        <li class="col-md-6">
                                         <span class="news-name">
                                           <span class="news-time"><fmt:formatDate  value="${t.createtime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>

                                          <!--根据不同的知识类型选择不同的图标-->
                                              <c:choose>
                                                  <c:when test="${t.typeId==1}">
                                                      <!--资源文件-->
                                                      <span class="glyphicon glyphicon-folder-close"></span>
                                                      <a href="#" target="_blank">资源知识:<c:out value="${t.title}"></c:out></a>
                                                  </c:when>
                                                  <c:when test="${t.typeId==2}">
                                                      <!--文档知识-->
                                                      <span class="glyphicon ">
                                                   <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                                 </span>
                                                      <a href="#" target="_blank"><c:out value="${t.title}"></c:out></a>

                                                  </c:when>
                                              </c:choose>
                                         <%--<img src="./img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">--%>


                                </span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="hot-answer">
                        <div class="kn-title">
                            <h2>
                                <i class="glyphicon glyphicon-question-sign"></i>
                                热门问答
                                <a href="#" class="see-more">查看更多</a>
                            </h2>
                        </div>
                        <div class="hot-answer-info">
                            <div class="col-md-6">
                                <ul class="hot-list">
                                    <li>
                                <span class="one-answer">
                                    <span class="news-time">2017-11-03</span>
                                    <i class="glyphicon glyphicon-ok" style="color:#5cb85c"></i>
                                    <a href="#">请问蒟蒻问答是什么意思?</a>
                                </span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="hot-list">
                                    <li>
                                <span class="one-answer">
                                    <span class="news-time">2017-11-03</span>
                                    <i class="glyphicon glyphicon-ok" style="color:#5cb85c"></i>
                                    <a href="#">谁告诉一些趣味机智问答 附上答案 最好有意义的题目 不要太过于脑筋急转弯 ?</a>
                                </span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="user-discuss hidden-xs">
                        <div class="user-discuss-list">
                            <div class="user-discuss-content">
                                <div class="media">
                                    <a href="#" class="user-img">
                                        <img src="./img/default.png" alt="waiting">
                                        <p class="user-name">guest</p>
                                    </a>
                                    <div class="pull-right media-img-intro hidden-xs">
                                        <img src="./img/baba.jpg" alt="waiting">
                                    </div>
                                    <div class="media-body">
                                        <div class="pull-left" style="margin-left: 4px">
                                            <div class="media-body-title">
                                                <a href="#" class="media-tit">
                                                    系统使用手册一
                                                    <span class="glyphicon">
                                                <img src="./img/document-black.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
                                                </a>
                                            </div>
                                            <div>
                                                <p class="media-body-info">使用方法明细 1 2 4 5 6 </p>
                                            </div>
                                            <div class="media-pop">
                                                技能培训(
                                                <img src="./img/dianzan.png" alt="">
                                                9
                                                <img src="./img/liuyan.png" alt="">
                                                0) 2018-01-26 06:44
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="user-discuss-content">
                                <div class="media">
                                    <a href="#" class="user-img">
                                        <img src="./img/default.png" alt="waiting">
                                        <p class="user-name">guest</p>
                                    </a>
                                    <div class="pull-right media-img-intro hidden-xs">
                                        <img src="./img/baba.jpg" alt="waiting">
                                    </div>
                                    <div class="media-body">
                                        <div class="pull-left" style="margin-left: 4px">
                                            <div class="media-body-title">
                                                <a href="#" class="media-tit">
                                                    系统使用手册一
                                                    <span class="glyphicon">
                                                 <img src="./img/document-black.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
                                                </a>
                                            </div>
                                            <div>
                                                <p class="media-body-info">使用方法明细 1 2 4 5 6 </p>
                                            </div>
                                            <div class="media-pop">
                                                技能培训(
                                                <img src="./img/dianzan.png" alt="waiting">
                                                9
                                                <img src="./img/liuyan.png" alt="waiting">
                                                0) 2018-01-26 06:44
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="user-discuss-content">
                                <div class="media">
                                    <a href="#" class="user-img">
                                        <img src="./img/default.png" alt="waiting">
                                        <p class="user-name">guest</p>
                                    </a>
                                    <div class="pull-right media-img-intro hidden-xs">
                                        <img src="./img/mao.png" alt="waiting">
                                    </div>
                                    <div class="media-body">
                                        <div class="pull-left" style="margin-left: 4px">
                                            <div class="media-body-title">
                                                <a href="#" class="media-tit">
                                                    系统使用手册一
                                                    <span class="glyphicon">
                                                 <img src="./img/document-black.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
                                                </a>
                                            </div>
                                            <div>
                                                <p class="media-body-info">
                                                    内外网集群的时间同步①server端：可以访问外网的机器client端：在内网里的机器一、server端安装ntp校时包，修改独立主机rm-rf/etc/localtime#先清除原有的链接文件ln-...</p>
                                            </div>
                                            <div class="media-pop">
                                                技能培训(
                                                <img src="./img/dianzan.png" alt="">
                                                9
                                                <img src="./img/liuyan.png" alt="">
                                                0) 2018-01-26 06:44
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1 hidden-xs"></div>
                <div class="col-md-3 hidden-xs">
                    <!--热门知识-->
                    <div class="hot-knowledge">
                        <div class="title">
                            <h3 style="color: #D9534F">
                                <i class="glyphicon glyphicon-fire"></i>
                                热门知识
                            </h3>
                        </div>
                        <ul class="hot-knowledge-list">
                            <!--文档类型-->
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>

                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <!--文件夹类型-->
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon glyphicon-folder-close" style="margin-right: 2px"></span>
                                <a href="#" target="_blank">中国科学家研发智能纳米颗粒 可用于肿瘤治疗</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <!--视频类型-->
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/video.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <!--图片类型-->
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/picture.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/picture.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/picture.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/picture.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                            <li>
                                <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="./img/picture.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">摔跤吧！爸爸(豆瓣)</a>
                            </span>
                                    <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="./img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">1</span>
                            </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--最新评论-->
                    <div class="new-comment">
                        <div class="title">
                            <h3>
                                <i class="glyphicon">
                                    <img src="./img/comment.png" alt="waiting" style="width: 17px; height: 17px; margin-bottom: 5px">
                                </i>
                                最新评论
                            </h3>
                        </div>
                        <div class="comment-item">
                            <div class="media">
                                <a href="#" class="pull-left hidden-xs">
                                    <img src="./img/girl.png" alt="waiting" class="img-circle ">
                                </a>
                                <div class="media-body">
                                    <div class="pull-left" style="margin-left: 4px">
                                        <div>
                                            <p class="comment-content">
                                                <a href="#" class="pull-left hidden-xs comment-name">高霸&nbsp;:&nbsp;</a>
                                                小王一边刷牙，一边悠闲的吹着口哨，他是怎么做到的？ 答案：刷的是假牙
                                                <a href="#" class="title-intro">[Linux时间同步(内外网/内网/外网)]</a>
                                                <span class="comment-time">
                                            发布于2017-11-03 18:02
                                            <a href="#" class="comment-zan">
                                                <img src="./img/dianzan.png" alt="waiting">
                                                9
                                                <img src="./img/liuyan.png" alt="waiting">
                                                0
                                            </a>
                                        </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="media">
                                <a href="#" class="pull-left hidden-xs">
                                    <img src="./img/boy.png" alt="waiting" class="img-circle ">
                                </a>
                                <div class="media-body">
                                    <div class="pull-left" style="margin-left: 4px">
                                        <div>
                                            <p class="comment-content">
                                                <a href="#" class="pull-left hidden-xs comment-name">刘建成&nbsp;:&nbsp;</a>
                                                小王一边刷牙，一边悠闲的吹着口哨，他是怎么做到的？ 答案：刷的是假牙
                                                <a href="#" class="title-intro">[Linux时间同步(内外网/内网/外网)]</a>
                                                <span class="comment-time">
                                            发布于2017-11-03 18:02
                                            <a href="#" class="comment-zan">
                                                <img src="./img/dianzan.png" alt="waiting">
                                                9
                                                <img src="./img/liuyan.png" alt="waiting">
                                                0
                                            </a>
                                        </span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--知识小组-->
                    <div class="knowledge-group">
                        <div class="title">
                            <h3>
                                <i class="glyphicon">
                                    <img src="./img/group.png" alt="waiting" style="width: 18px; height: 18px; margin-bottom: 5px">
                                </i>
                                知识小组
                            </h3>
                        </div>
                        <div class="group-item">
                            <div class="group-img">
                                <a href="#" target="_blank">
                                    <img src="./img/yuhangyuan.jpg" alt="waiting" class="img-rounded">
                                </a>
                            </div>
                            <div class="group-intro">
                                <div class="group-intro-tit">
                                    <a href="#">航空航天小组</a>
                                </div>
                                <div class="group-intro-info">
                                    两个成员
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="container">
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
        <!--回到顶部-->
        <div class="backTop hidden-xs hidden-sm">
            <a>
                <img src="./img/top_black.png" alt="waiting">
            </a>
        </div>
    </main>
    <div id="search" class="cd-main-search">
        <form>
            <input type="search" placeholder="Search...">

            <div class="cd-select">
                <span>in</span>
                <select name="select-category">
                    <option value="all-categories">all Categories</option>
                    <option value="category1">Category 1</option>
                    <option value="category2">Category 2</option>
                    <option value="category3">Category 3</option>
                </select>
                <span class="selected-value">all Categories</span>
            </div>
        </form>

        <div class="cd-search-suggestions">
            <div class="news">
                <h3>News</h3>
                <ul>
                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></h4>
                        <time datetime="2016-01-12">Feb 03, 2016</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Incidunt voluptatem adipisci voluptates fugit beatae culpa eum, distinctio, assumenda est ad</a></h4>
                        <time datetime="2016-01-12">Jan 28, 2016</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="img/placeholder.png" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, esse.</a></h4>
                        <time datetime="2016-01-12">Jan 12, 2016</time>
                    </li>
                </ul>
            </div> <!-- .news -->

            <div class="quick-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#0">Find a store</a></li>
                    <li><a href="#0">Accessories</a></li>
                    <li><a href="#0">Warranty info</a></li>
                    <li><a href="#0">Support</a></li>
                    <li><a href="#0">Contact us</a></li>
                </ul>
            </div> <!-- .quick-links -->
        </div> <!-- .cd-search-suggestions -->

        <a href="#" class="close cd-text-replace">Close Form</a>
    </div> <!-- .cd-main-search -->
</div>
</body>
</html>
