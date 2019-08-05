<%@ page import="com.kbms_module.util.Htmlutil" %>
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
    <script>
        $(function () {
            /*enter键提交信息*/
            $('#kb-search').keydown(function (event) {
                if(event.keyCode == 13) {
                    $('.kb-search').submit();
                }
            });
            /*异步实时显示*/
            $('#kb-search .kb-search-file').bind('keyup' , function () {
                var value = $('.kb-search-file').val();
                $.ajax({
                    "data":{"searchInfo":value},
                    "dataType":"JSON",
                    "type":"POST",
                    "url":"",
                    "success":function (data) {

                    }
                })
            });
        });
    </script>
</head>
<body>
<div class="nav-index">

    <header class="cd-main-header animate-search" style="display: none">
        <div class="cd-logo"><a href="#"><img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="Logo" style="width: 124px; height: 23px"></a></div>

        <nav class="cd-main-nav-wrapper">
            <a href="#search" class="cd-search-trigger cd-text-replace">Search</a>

            <ul class="cd-main-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/user/public/1/1">
                        知识
                        <span class="glyphicon glyphicon-book"></span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/questionall">
                        问答
                        <span class="glyphicon glyphicon-question-sign"></span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/groupall">
                        小组
                        <span class="glyphicon glyphicon-tree-conifer"></span>
                    </a>
                </li>
                <!--登录显示头像-->
                <!--判断用户是否登录-->



                <c:if test="${! empty sessionScope.user}">
                    <li class="fix-menu-item-user">
                                        <span style="color: #fff;font-size: 15px;line-height: 1;cursor: pointer" onclick="showDropdownFix()">
                                           <img src="/upload${sessionScope.user.userImgid}" alt="waiting" class="img-rounded" style="width: 40px; height: 40px; margin-bottom: 5px">
                                            <span class="showDownFix">
                                               ${user.userName}
                                                <span class="glyphicon glyphicon-chevron-up"></span>
                                            </span>
                                        </span>
                        <ul class="fix-user-logo-choice" style="display: none">
                            <li class="sanJiao">
                                <a href="${pageContext.request.contextPath}/user/mySpace">
                                    <span class="glyphicon glyphicon-list-alt"></span>
                                    我的空间
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-cog"></span>
                                    管理控制台
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/goDocFrom">
                                    <span class="glyphicon glyphicon-book"></span>
                                    创建文档
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/uoloadfile">
                                    <span class="glyphicon glyphicon-cloud"></span>
                                    上传知识
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="glyphicon glyphicon-cog"></span>
                                    创建提问
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/exit">
                                    <span class="glyphicon glyphicon-off"></span>
                                    注销
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${empty sessionScope.user}">
                    <li>
                        <a href="${pageContext.request.contextPath}/login/webPage">
                            登录/注册
                            <span class="glyphicon glyphicon-user"></span>
                        </a>
                    </li>
                </c:if>



                <!--<li>
                    <a href="loginRegister.html">
                        登录/注册
                        <span class="glyphicon glyphicon-user"></span>
                    </a>
                </li>-->
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
                            <img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="waiting">
                        </a>
                    </div>
                    <div class="nav-header">
                        <ul class="menu-header-menu" >
                            <li class="menu-item menu-item-sp" >
                                <a href="#">
                                    web信息
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
                                <a href="${pageContext.request.contextPath}/user/public/1/1">
                                    知识
                                    <span class="glyphicon glyphicon-book"></span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="${pageContext.request.contextPath}/questionall">
                                    问答
                                    <span class="glyphicon glyphicon-question-sign"></span>
                                </a>
                            </li>
                            <li class="menu-item">
                                <a href="${pageContext.request.contextPath}/groupall">
                                    小组
                                    <span class="glyphicon glyphicon-tree-conifer"></span>
                                </a>
                            </li>

                            <c:choose>
                                <c:when test="${! empty user}">
                                    <!--登录显示头像-->
                                    <li class="menu-item-user">
                                        <span style="color: #fff;font-size: 15px;line-height: 1;cursor: pointer" onclick="showDropdown()">
                                           <img src="/upload${sessionScope.user.userImgid}" alt="waiting" class="img-rounded" style="width: 40px; height: 40px; margin-bottom: 5px">
                                            <span class="showDown">
                                                ${requestScope.user.userName}
                                                <span class="glyphicon glyphicon-chevron-up"></span>
                                            </span>
                                        </span>
                                        <ul class="user-logo-choice" style="display: none">
                                            <li class="sanJiao">
                                                <a href="./myspace-sumPage.html">
                                                    <span class="glyphicon glyphicon-list-alt"></span>
                                                    我的空间
                                                </a>
                                            </li>
                                            <li>
                                                <a href="./admin/index.html">
                                                    <span class="glyphicon glyphicon-cog"></span>
                                                    管理控制台
                                                </a>
                                            </li>
                                            <li>
                                                <a href="./UEditor/editorKnowledge.html">
                                                    <span class="glyphicon glyphicon-book"></span>
                                                    创建文档
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/uoloadfile">
                                                    <span class="glyphicon glyphicon-cloud"></span>
                                                    上传知识
                                                </a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath}/goQuestionForm">
                                                    <span class="glyphicon glyphicon-cog"></span>
                                                    创建提问
                                                </a>
                                            </li>
                                            <li>
                                                <a href="./loginRegister.html">
                                                    <span class="glyphicon glyphicon-off"></span>
                                                    注销
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <!--未登录-->
                                    <li class="menu-item">
                                        <a href="${pageContext.request.contextPath}/login/webPage">
                                            登录/注册
                                            <span class="glyphicon glyphicon-user"></span>
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="site-header_search">
                <div class="container">
                    <h2>知识&nbsp;&&nbsp;专注</h2>
                    <form action="${pageContext.request.contextPath}/search/doc" class="kb-search" method="post">
                        <input type="text" class="kb-search-file"  name="keywords" placeholder="搜你所想...">
                        <img src="./img/loading.svg" alt="searching" class="kb-search-loader">
                        <div class="kb-search-live">
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
                                <a href="${pageContext.request.contextPath}/doc/view/" class="see-more">查看更多</a>
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
                                                  <c:when test="${t.typeId==3}">
                                                      <!--资源文件-->
                                                      <span class="glyphicon glyphicon-folder-close"></span>
                                                      <a href="${pageContext.request.contextPath}/file/${t.docFuuid}" target="_blank">资源知识:${t.title}.${t.docFextname}</a>
                                                  </c:when>
                                                  <c:when test="${t.typeId==2}">
                                                      <!--文档知识-->
                                                      <span class="glyphicon ">
                                                   <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                                 </span>
                                                      <a href="${pageContext.request.contextPath}/doc/view/${t.id}" target="_blank"><c:out value="${t.title}"></c:out></a>
                                                </c:when>
                                                          <c:when test="${t.typeId==1}">
    <span class="glyphicon ">
                                                   <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                                 </span>
                                                      <a href="${pageContext.request.contextPath}/doc/view/${t.id}" target="_blank"><c:out value="${t.title}"></c:out></a>
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
                                <a href="${te}" class="see-more">查看更多</a>
                            </h2>
                        </div>
                        <div class="hot-answer-info">
                            <c:forEach items="${requestScope.hotques}" var="item" varStatus="count">
                                <c:if test="${count.count%2 != 0}">
                                    <div class="col-md-6">
                                        <ul class="hot-list">
                                            <li>
                                        <span class="one-answer">
                                            <span class="news-time">
                                                 <fmt:formatDate value="${item.posttime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                            </span>
                                            <c:if test="${item.status == 1}">
                                                <i class="glyphicon glyphicon-ok" style="color:#5cb85c"></i>
                                            </c:if>
                                            <c:if test="${item.status == 0}">
                                                <i class="glyphicon glyphicon-question-sign" style="color:#999"></i>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/question/${item.id}">${item.title}</a>
                                        </span>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                                <c:if test="${count.count%2 == 0}">
                                    <div class="col-md-6">
                                        <ul class="hot-list">
                                            <li>
                                        <span class="one-answer">
                                            <span class="news-time">
                                                <fmt:formatDate value="${item.posttime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                            </span>
                                            <c:if test="${item.status == 1}">
                                                <i class="glyphicon glyphicon-ok" style="color:#5cb85c"></i>
                                            </c:if>
                                            <c:if test="${item.status == 0}">
                                                <i class="glyphicon glyphicon-question-sign" style="color:#999"></i>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/question/${item.id}">${item.title}</a>
                                        </span>
                                            </li>
                                        </ul>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="user-discuss hidden-xs">
                        <div class="user-discuss-list">
                            <%--hx 20118/3/19 资源文件为摘要 文档文件为截取内容的前面部分  此处摘取为纯文档,随机推荐--%>
                            <c:forEach items="${randomdoc}" var="item">
                                <div class="user-discuss-content">
                                    <div class="media">
                                        <a href="#" class="user-img">

                                            <img src="/upload${item.user.userImgid}" alt="waiting">
                                            <p class="user-name">${item.user.userName}</p>
                                        </a>
                                        <div class="pull-right media-img-intro hidden-xs">
                                            <c:if test="${ not empty item.previewurl}">
                                            <img src="/upload${item.previewurl}" alt="waiting">
                                            </c:if>
                                        </div>
                                        <div class="media-body">
                                            <div class="pull-left" style="margin-left: 4px">
                                                <div class="media-body-title">
                                                    <a href="${pageContext.request.contextPath}/doc/view/${item.id}" class="media-tit">
                                                            ${item.title}

                                                                <c:if test="${item.typeId==1}">
                                                                    <!--文件夹类型-->
                                                                    <span class="glyphicon glyphicon-folder-close" style="font-size: 14px"></span>
                                                                </c:if>
                                                                <c:if test="${item.typeId==2}">
                                                                    <!--文档类型-->
                                                                    <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/document-black.png" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                </c:if>
                                                                    <%--资源类型--%>
                                                                <c:if test="${item.typeId==3}">
                                                                    <!--视频类型-->
                                                                    <c:if test="${item.docFextname == 'mp4' or item.docFextname == 'flv'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/video-black.png" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <%--docx类型--%>
                                                                    <c:if test="${item.docFextname == 'doc' or item.docFextname == 'docx'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/word.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <%--excel--%>
                                                                    <c:if test="${item.docFextname == 'xls' or item.docFextname == 'xlsx'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/excel.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <%--pdf--%>
                                                                    <c:if test="${item.docFextname == 'pdf'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/pdf.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <c:if test="${item.docFextname == 'pptx' or item.docFextname == 'ppt'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/ppt.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <c:if test="${item.docFextname == 'mp3'}">
                                                                <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/audio.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                    <c:if test="${item.docFextname == 'zip' or item.docFextname == 'rar'}">
                                                               <span class="glyphicon">
                                                                    <img src="${pageContext.request.contextPath}/statics/img/zip.svg" alt="waiting" style="width: 20px; height: 20px; margin-bottom: 7px">
                                                                </span>
                                                                    </c:if>
                                                                </c:if>
                                                    </a>
                                                </div>
                                                <div>
                                                    <p class="media-body-info">${item.summary} </p>
                                                </div>
                                                <div class="media-pop">
                                                    <!--加载一篇doc的小分类-->
                                                    <c:out value="${item.stype.name}"></c:out>(
                                                    <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="waiting">
                                                        ${item.favers}
                                                    <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt="waiting">
                                                        ${item.comments}) <fmt:formatDate  value="${item.createtime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
                            <c:forEach items="${requestScope.hotDoc}" var="item">
                                <c:if test="${item.typeId==2}">
                                    <!--文件夹类型-->
                                    <li>
                                        <div class="li-normal">
                                            <span class="hot-knowledge-name">
                                                <span class="glyphicon glyphicon-folder-close" style="margin-right: 2px"></span>
                                                <a href="${pageContext.request.contextPath}/doc/view/${item.id}" target="_blank">${item.title}</a>
                                            </span>
                                            <span class="brow-num">
                                                <span class="glyphicon">
                                                <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                                </span>
                                                <span class="nums">${item.visitnums}</span>
                                            </span>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${item.typeId==1}">
                                    <!--文档类型-->
                                    <li>
                                        <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="${pageContext.request.contextPath}/doc/view/${item.id}" target="_blank">${item.title}</a>

                            </span>
                                            <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">${item.visitnums}</span>
                            </span>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${item.typeId==3}">
                                    <!--视频类型-->
                                    <li>
                                        <div class="li-normal">
                            <span class="hot-knowledge-name">
                                <span class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/video.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 5px;margin-right: 2px">
                                </span>
                                <a href="#" target="_blank">${item.title}</a>
                            </span>
                                            <span class="brow-num">
                                <span class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 4px">
                                </span>
                                <span class="nums">${item.visitnums}</span>
                            </span>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <!--最新评论-->
                    <div class="new-comment">
                        <div class="title">
                            <h3>
                                <i class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/comment.png" alt="waiting" style="width: 17px; height: 17px; margin-bottom: 5px">
                                </i>
                                最新评论
                            </h3>
                        </div>
                        <div class="comment-item">
                            <%--hx 2018/3/19 所属标题 评论数没有数据--%>
                            <c:forEach items="${requestScope.newComm}" var="item">
                                <div class="media">
                                    <a href="#" class="pull-left hidden-xs">
                                        <img src="/upload${item.user.userImgid}" alt="waiting" class="img-circle ">
                                    </a>
                                    <div class="media-body">
                                        <div class="pull-left" style="margin-left: 4px">
                                            <div>
                                                <p class="comment-content">
                                                    <a href="#" class="pull-left hidden-xs comment-name">${item.user.userName}&nbsp;:&nbsp;</a>
                                                      <c:set scope="request" var="commentContent" value="${item.content}"></c:set>
                                                      <%    String comment= (String) request.getAttribute("commentContent");
                                                             String c=Htmlutil.toHtml(comment);
                                                             out.write(c);

                                                      %>
                                                        <%--      <c:out value="${item.content}" escapeXml="false" >
                                                      </c:out>--%>
                                                         <!--根据comment的id选择出doc的分类以及路径标签-->
                                                    <a href="${pageContext.request.contextPath}/doc/view/${item.doc.id}" class="title-intro">[${item.doc.title}]</a>

                                                  <%--  <a href="#" class="title-intro">[Linux时间同步(内外网/内网/外网)]</a>--%>
                                                    <span class="comment-time">
                                            发布于<fmt:formatDate  value="${item.cTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                                            <a href="#" class="comment-zan">
                                                <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="waiting">
                                                ${item.favers}
                                                <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt="waiting">
                                                ${item.replyNums}
                                            </a>
                                        </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--知识小组-->
                    <%--hx 2018/3/19 需要图片数据--%>
                    <div class="knowledge-group">
                        <div class="title">
                            <h3>
                                <i class="glyphicon">
                                    <img src="${pageContext.request.contextPath}/statics/img/group.png" alt="waiting" style="width: 18px; height: 18px; margin-bottom: 5px">
                                </i>
                                知识小组
                            </h3>
                        </div>
                        <c:forEach items="${requestScope.groups}" var="item">
                            <div class="group-item">
                                <div class="group-img">
                                    <a href="${pageContext.request.contextPath}/group/${item.id}" target="_blank">
                                        <img src="/upload/${item.groupHeadimg}" alt="waiting" class="img-rounded">
                                    </a>
                                </div>
                                <div class="group-intro">
                                    <div class="group-intro-tit">
                                        <a href="${pageContext.request.contextPath}/group/${item.id}">${item.groupName}</a>
                                    </div>
                                    <div class="group-intro-info">
                                        成员数:&nbsp;${item.groupNums}&nbsp;人
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
       <%@include file="../common/footer.jsp"%>
        <!--回到顶部-->
       <jsp:include page="../common/rocket.jsp"></jsp:include>
    </main>
    <div id="search" class="cd-main-search">
        <form>
            <input type="search" placeholder="搜你所想...">

            <div class="cd-select">
                <select name="select-category">
                    <option value="all-categories">查找&nbsp;全部</option>
                    <option value="category1">查找&nbsp;知识</option>
                    <option value="category2">查找&nbsp;问答</option>
                    <option value="category3">查找&nbsp;图片</option>
                </select>
                <span class="selected-value">查找&nbsp;全部</span>
            </div>
        </form>

        <div class="cd-search-suggestions">
            <div class="news">
                <h3>热搜榜</h3>
                <ul>
                    <li>
                        <a class="image-wrapper" href="#0"><img src="https://img.huxiucdn.com/article/cover/201804/17/213544540201.jpg?imageView2/1/w/800/h/600/|imageMogr2/strip/interlace/1/quality/85/format/jpg" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">从设计师到数据控，特赞的to B转型</a></h4>
                        <time datetime="2016-01-12">2018-04-17 21:38</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="https://img.huxiucdn.com/article/cover/201804/17/161854893516.jpg?imageView2/1/w/800/h/600/|imageMogr2/strip/interlace/1/quality/85/format/jpg" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">传阿里百度京东6月回归A股，腾讯缺席</a></h4>
                        <time datetime="2016-01-12">2018-04-17 16:02</time>
                    </li>

                    <li>
                        <a class="image-wrapper" href="#0"><img src="https://img.huxiucdn.com/article/cover/201712/26/110102914736.jpg?imageView2/1/w/800/h/600/|imageMogr2/strip/interlace/1/quality/85/format/jpg" alt="News image"></a>
                        <h4><a class="cd-nowrap" href="#0">贪污爆料，高管互撕，魅族怎么了？</a></h4>
                        <time datetime="2016-01-12">2018-04-17 17:16</time>
                    </li>
                </ul>
            </div> <!-- .news -->

            <div class="quick-links">
                <h3>快速&nbsp;通道</h3>
                <ul>
                    <li></li>
                    <li></li>
                    <li><a href="#0">网站特色</a></li>
                    <li><a href="#0">技术支持</a></li>
                    <li><a href="#0">联系我们</a></li>
                </ul>
            </div> <!-- .quick-links -->
        </div> <!-- .cd-search-suggestions -->

        <a href="#" class="close cd-text-replace">Close Form</a>
    </div> <!-- .cd-main-search -->

</div>
</body>
</html>
