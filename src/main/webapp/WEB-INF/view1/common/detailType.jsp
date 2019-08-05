<%@ page import="java.net.InetAddress" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-01
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeList.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
    <script>
        $(function () {

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
    </script>
</head>
<body>
<div class="nav-index">
    <header class="cd-main-header animate-search">
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
        <div class="knowledgeList">
            <div class="showPath">
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
                                    <span><c:out value="${Bname}"></c:out></span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <c:if test="${not empty Sname}">
                                <li class="itemElement">
                                    <a href="#">
                                        <span><c:out value="${Sname}"></c:out></span>
                                        <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                    </a>
                                </li>

                            </c:if>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container setFooter">
                <div class="row">`
                    <div class="col-md-3">
                        <div class="hot-knowledge">
                            <div class="title">
                                <h3 style="color: #D9534F">
                                    <i class="glyphicon glyphicon-tree-conifer"></i>
                                    知识分类
                                </h3>
                            </div>
                            <ul class="knowledgeCategory">
                                <!--遍历大分类,要让点击的标签标红，要获取来源，而且默认点击的链接要咱开-->
                                <c:forEach items="${Btype}" var ="i">
                                <li>
                                        <!--分类来的标签-->
                                    <c:choose>

                                        <c:when test="${i.id==BId}">
                                      <h5>
                                                <a href="${pageContext.request.contextPath}/type/view/${i.id}" style="color: #D9534F " ><c:out value="${i.name}"></c:out></a>
                                                <span class="redFont"><c:out value="${i.knums}"></c:out></span>
                                                <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-up" onclick="clickShowMenu(this)"></a>
                                      </h5>
                                    <ul class="clickShowMenu" style="display: block">
                                        <!--遍历小分类，要让点击的标签标红，要获取来源-->
                                        <c:forEach items="${i.stypes}" var="t">
                                            <li>
                                                <!--要让小标签变红-->
                                                <c:choose>
                                                    <c:when test="${t.id==Sid}">
                                                        <a class="ul-2-menu" href="${pageContext.request.contextPath}/type/view/${i.id}/?sid=${t.id}"  style="color: #D9534F "><c:out value="${t.name}"></c:out></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="ul-2-menu" href="${pageContext.request.contextPath}/type/view/${i.id}/?sid=${t.id}"><c:out value="${t.name}"></c:out></a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <!--如果个数不为0显示个数-->
                                                <c:if test="${t.kNums>0}">
                                                    <span class="redFont"><c:out value="${t.kNums}"></c:out></span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                            </c:when>
                                        <c:otherwise>
                                                <h5><a href="${pageContext.request.contextPath}/type/view/${i.id}" ><c:out value="${i.name}"></c:out></a>
                                                <span class="redFont"><c:out value="${i.knums}"></c:out></span>
                                                 <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-up" onclick="clickShowMenu(this)"></a></h5>
                                          <ul class="clickShowMenu" style="display: none">
                                        <!--遍历小分类，要让点击的标签标红，要获取来源-->
                                        <c:forEach items="${i.stypes}" var="t">
                                            <li>
                                                <a class="ul-2-menu" href="${pageContext.request.contextPath}/type/view/${i.id}/?sid=${t.id}"><c:out value="${t.name}"></c:out></a>
                                                <!--如果个数不为0显示个数-->
                                                <c:if test="${t.kNums>0}">
                                                    <span class="redFont"><c:out value="${t.kNums}"></c:out></span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                       </ul>
                                      </c:otherwise>

                                </c:choose>
                                </li>
                                </c:forEach>


                            </ul>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="hot-knowledge">
                            <div class="title">
                                <h3 style="color: #D9534F">
                                    <i class="glyphicon glyphicon-fire"></i>
                                    热门知识
                                </h3>
                            </div>
                            <div class="user-discuss-list">
                                <!--列表页面,每一页默认八扁文章,这里涉及分页,高出分页列表-->
                                <c:forEach items="${pageListDoc.docList}" var="i">
                                    <div class="user-discuss-content">
                                        <div class="media">
                                            <a href="#" class="user-img">
                                                <img src="<% InetAddress.getLocalHost().getHostAddress(); %>/upload/${i.user.userImgid}" alt="waiting">
                                                <p class="user-name"><c:out value="${i.user.userName}"></c:out></p>
                                            </a>
                                            <div class="pull-right media-img-intro hidden-xs">
                                                <!--预览图，根据文档知识是否有预览图来显示预览-->
                                                <c:if test="${ not empty i.previewurl}">
                                                    <img src="<% InetAddress.getLocalHost().getHostAddress(); %>/upload/${i.previewurl}" alt="waiting">
                                                </c:if>

                                            </div>
                                            <div class="media-body">
                                                <div class="pull-left" style="margin-left: 4px">
                                                    <div class="media-body-title">
                                                        <!--根据不同的知识类型选择不同的图标-->
                                                        <c:choose>
                                                            <c:when test="${i.typeId==1}">
                                                                <!--资源文件-->
                                                                <a href="#" class="media-tit">资源知识:
                                                                    <c:out value="${i.title}"></c:out>
                                                                    <span class="glyphicon glyphicon-folder-close">

                                            </span>
                                                                </a>

                                                            </c:when>
                                                            <c:when test="${i.typeId==2}">
                                                                <!--文档知识-->

                                                                      <a href="${pageContext.request.contextPath}/doc/view/${i.id}" class="media-tit">
                                                            <c:out value="${i.title}"></c:out>
                                                            <span class="glyphicon">
                                                <img src="${pageContext.request.contextPath}/statics/img/document.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
                                                        </a>

                                                            </c:when>
                                                        </c:choose>
                                                   <%--     <a href="#" class="media-tit">
                                                            <c:out value="${i.title}"></c:out>
                                                            <span class="glyphicon">
                                                <img src="./img/document-black.png" alt="waiting" style="width: 15px; height: 15px; margin-bottom: 7px">
                                            </span>
                                                        </a>--%>
                                                    </div>
                                                    <div>
                                                        <!--知识的摘要知识-->
                                                        <p class="media-body-info"><c:out value="${i.summary}"></c:out> </p>
                                                    </div>
                                                    <div class="media-pop">
                                                        <!--小类型的名字，需要在文档类里面封装Stype小分类-->
                                                        <c:out value="${i.stype.name}"></c:out>
                                                        (
                                                        <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="">
                                                        <c:out value="${i.favers}"></c:out>
                                                        <img src="${pageContext.request.contextPath}/statics/img/liulan.png" alt="">
                                                        <c:out value="${i.visitnums}"></c:out>)
                                                        <span class="news-time"><fmt:formatDate  value="${i.createtime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>

                            </div>
                            <!--计算页面的begin和end,页面的起始位置和最后的位置-->

                            <c:choose>
                                <c:when test="${pageListDoc.totalPage<10}">

                                    <c:set var="begin" value="1"> </c:set>
                                    <c:set var="end" value="${pageListDoc.totalPage}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="begin" value="1"> </c:set>
                                    <c:set var="end" value="${pageListDoc.totalPage}"></c:set>
                                </c:otherwise>
                            </c:choose>
                            <div class="paging">
                                <c:forEach var="i" begin="${begin}" end="${end}">
                                   <%-- <c:out value="${i}"></c:out>
                                    <c:out value="${pageListDoc.currentPage}"></c:out>
                                    <a  class="btn btn-info" href=""><c:out value="${i}"></c:out></a>--%>
                                    <c:choose>
                                   <c:when test="${i == pageListDoc.currentPage }">

                                       <span class="disabled"> <a class="btn btn-info disabled" href=""><c:out value="${i}"></c:out></a></span>
                                    </c:when>
                                    <c:otherwise>
                                       <c:choose>
                                           <c:when test="${empty Sid}">
                                               <a class="btn btn-info " href="${pageContext.request.contextPath}/type/view/${Bid}/?pagenum=${i}"><c:out value="${i}"></c:out></a>
                                           </c:when>
                                           <c:otherwise>
                                               <a class="btn btn-info " href="${pageContext.request.contextPath}/type/view/${Bid}/?sid=${Sid}&pagenum=${i}"><c:out value="${i}"></c:out></a>
                                           </c:otherwise>
                                       </c:choose>

                                    </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                               <%-- <a  class="btn btn-info">1</a>
                                <button type="submit" class="btn btn-info">2</button>
                                <button type="submit" class="btn btn-info">3</button>--%>
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
