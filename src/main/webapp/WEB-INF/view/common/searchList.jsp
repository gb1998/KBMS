<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-24
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索-BigBang知识库</title>
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
    <style>
        .doc_node {
            padding: 20px 8px;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        .doc_node_title_box {
            font-weight: bold;
            overflow: hidden;
            margin-bottom: 8px;
        }
        .doc_node_title_box a {
            color: #605f5f;
        }
        .doc_node_title_min {
            color: #605f5f;
            font-size: 16px;
            font-weight: 600;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            text-decoration-color: #605f5f;
            text-decoration-line: none;
            text-decoration-style: solid;
        }
        .doc_node_content_box {
            padding: 8px;
            border-left: 5px solid #55d17c;
            width: auto;
        }
        .doc_node_content {
            word-wrap: break-word;
            color: #5b5b5b;
            font-size: 14px;
            line-height: 26px;
            word-break: normal;
        }
        .side_unit_left_box {
            float: left;
            padding-left: 8px;
        }
        .side_unit_left_box a {
            color: #605f5f;
            cursor: pointer;
            text-decoration: none;
        }
        .side_unit_info {
            color: #888888;
            font-size: 12px;
            line-height: 18px;
        }
        .tagsearch  {
            font-size: 14px;
            margin-left: 8px;
        }
        .tagsearch:first-child {
            margin-left: 0;
        }
        .label-default {
            background-color: #999999;
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
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="knowledgeList">
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
                                    <span>搜索</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container setFooter">
                <div class="row" style="margin-top: 26px;">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-sm-12" style="margin-top: 26px">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <form action="${pageContext.request.contextPath}/search/doc">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="搜你所想..."  value="${keywords}" name="keywords">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-info" type="submit">
                                                        <span class="glyphicon glyphicon-search" aria-hidden="true">
                                                            <span>检索</span>
                                                        </span>
                                                    </button>
                                                    <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu dropdown-menu-right">
                                                        <li><a href="#">
                                                            查找
                                                            <b>全部</b>
                                                        </a></li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a href="#">
                                                                查找
                                                                <b>知识</b>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                查找
                                                                <b>问答</b>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#">
                                                                查找
                                                                <b>图片</b>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a href="javascript:;" class="hotWordsearch" style="text-decoration: none">
                                            <span class="label label-warning">java</span>
                                        </a>
                                        <a href="javascript:;" class="hotWordsearch" style="text-decoration: none">
                                            <span class="label label-warning">gaoba</span>
                                        </a>
                                        <a href="javascript:;" class="hotWordsearch" style="text-decoration: none">
                                            <span class="label label-warning">son</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3"></div>
                </div>
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
                                <c:forEach items="${btype}" var ="i">
                                    <li>
                                        <!--分类来的标签-->

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
                                                                    <a class="ul-2-menu" href="${pageContext.request.contextPath}/type/view/${i.id}/?sid=${t.id}"><c:out value="${t.name}"></c:out></a>

                                                            <!--如果个数不为0显示个数-->
                                                            <c:if test="${t.kNums>0}">
                                                                <span class="redFont"><c:out value="${t.kNums}"></c:out></span>
                                                            </c:if>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
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
                                    检索到<c:out value="${searchPage.countDoc}"></c:out>条结果,用时<c:out value="${costTime}"></c:out>毫秒
                                    <span class="choice_sort" style="float: right">
                                    <a style="cursor: pointer" class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/search/doc/?time=1&keywords=${keywords}">按时间</a>
                                    <a style="cursor: pointer" class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/search/doc/?hot=1&keywords=${keywords}">按热度</a>
                                </span>
                                </h3>
                            </div>
                            <div class="user-discuss-list"style="margin-top: 25px">
                                <!--遍历搜索结果页-->
                                <c:forEach items="${searchPage.docList}" var="i">
                                    <div class="col-sm-12 doc_node">
                                        <div class="media">
                                            <div class="media-body">
                                                <div class="pull-left" style="margin-left: 4px">
                                                    <div class="doc_node_title_box">
                                                        <a href="${pageContext.request.contextPath}/doc/view/${i.id}" class="doc_node_title_min" target="_blank" >
                                                            <span class="glyphicon glyphicon-book"></span>
                                                            ${i.title}
                                                        </a>
                                                    </div>
                                                    <div class="doc_node_content_box">
                                                        <p class="doc_node_content">
                                                            ${i.summary}
                                                        </p>
                                                    </div>
                                                    <div class="side_unit_info side_unit_left_box">
                                                        <a href="#" title="guest">
                                                            <span class="side_unit_info">${i.user.userName}</span>
                                                        </a>
                                                        <a href="#">知识来源</a>
                                                      <%--  ${i.createtime}--%>
                                                        <fmt:formatDate  value="${i.createtime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
                                                    </div>
                                                    <br>
                                                    <div class="row">
                                                        <div class="col-md-12 text-left">
                                                            <!--遍历标签页-->

                                                            <c:forEach items="${searchPage.docList}" var="d">
                                                                <c:forEach items="${d.tagsList}" var="t">
                                                                    <span class="label label-default tagsearch" style="cursor: pointer" title="${t.name}">
                                                            ${t.name}
                                                        </span>
                                                                </c:forEach>
                                                            </c:forEach>
                                                      <%--  <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            美国
                                                        </span>
                                                            <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            高霸
                                                        </span>
                                                            <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            我
                                                        </span>
                                                            <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            儿子
                                                        </span>
                                                            <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            耶
                                                        </span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <hr style="margin: 8px">
                                    </div>


                                </c:forEach>
                                <%--<div class="col-sm-12 doc_node">
                                    <div class="media">
                                        <div class="media-body">
                                            <div class="pull-left" style="margin-left: 4px">
                                                <div class="doc_node_title_box">
                                                    <a href="#" class="doc_node_title_min" target="_blank" >
                                                        <span class="glyphicon glyphicon-link"></span>
                                                        <font color="red">
                                                            c1a52b7d67c6f63f3e1ef4d21c
                                                        </font>
                                                        .docx
                                                    </a>
                                                </div>
                                                <div class="doc_node_content_box">
                                                    <p class="doc_node_content">
                                                        〔2007〕5号）同时废止。 － 3 －/
                                                        <font color="red">c1a52b7d67c6f63f3e1ef4d21c</font>
                                                        .doc
                                                    </p>
                                                </div>
                                                <div class="side_unit_info side_unit_left_box">
                                                    <a href="#" title="guest">
                                                        <span class="side_unit_info">guest</span>
                                                    </a>
                                                    <a href="#">知识来源</a>
                                                    2018-03-06 15:33
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-12 text-left">
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            美国
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            高霸
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            我
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            儿子
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            耶
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <hr style="margin: 8px">
                                </div>
                                <div class="col-sm-12 doc_node">
                                    <div class="media">
                                        <div class="media-body">
                                            <div class="pull-left" style="margin-left: 4px">
                                                <div class="doc_node_title_box">
                                                    <a href="#" class="doc_node_title_min" target="_blank" >
                                                        <span class="glyphicon glyphicon-book"></span>
                                                        Unity引擎与
                                                        <font color="red">
                                                            C
                                                        </font>
                                                        #脚本简介 - 腾讯云+社区 - 博客园
                                                    </a>
                                                </div>
                                                <div class="doc_node_content_box">
                                                    <p class="doc_node_content">
                                                        〔云加社区 博客园 首页 新随笔 联系 订阅 管理 随笔 - 206 文章 - 1 评论 - 441 Unity引擎与C#脚本简介 欢迎大家前往腾讯云+
                                                        <font color="red">社区，</font>
                                                        获取更多腾讯海量技术实践干货哦~ 由
                                                    </p>
                                                </div>
                                                <div class="side_unit_info side_unit_left_box">
                                                    <a href="#" title="guest">
                                                        <span class="side_unit_info">guest</span>
                                                    </a>
                                                    <a href="#">知识来源</a>
                                                    2018-03-06 15:33
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-12 text-left">
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            美国
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            高霸
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            我
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            儿子
                                                        </span>
                                                        <span class="label label-default tagsearch" style="cursor: pointer" title="美国">
                                                            耶
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <hr style="margin: 8px">
                                </div>--%>
                            </div>
                            <!--计算页面的begin和end,页面的起始位置和最后的位置-->

                            <c:choose>
                                <c:when test="${searchPage.totalPage<10}">

                                    <c:set var="begin" value="1"> </c:set>
                                    <c:set var="end" value="${searchPage.totalPage}"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="begin" value="1"> </c:set>
                                    <c:set var="end" value="${searchPage.totalPage}"></c:set>
                                </c:otherwise>
                            </c:choose>
                            <div class="paging">
                                <!--分页按钮,分按时间分页按热度分页-->
                                        <c:forEach  var ="i"  begin="${begin}" end="${end}">
                                            <c:choose>
                                                <c:when test="${i == searchPage.currentPage }">

                                                    <span class="disabled"> <a class="btn btn-info disabled" href=""><c:out value="${i}"></c:out></a></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${empty time&& empty hot}">
                                                        <a class="btn btn-info " href="${pageContext.request.contextPath}/search/doc/?keywords=${keywords}&pagenum=${i}"><c:out value="${i}"></c:out></a>
                                                    </c:if>
                                                    <c:if test="${not empty time}">
                                                        <a class="btn btn-info " href="${pageContext.request.contextPath}/search/doc/?keywords=${keywords}&pagenum=${i}&time=1"><c:out value="${i}"></c:out></a>
                                                    </c:if>
                                                    <c:if test="${not empty hot}">
                                                        <a class="btn btn-info " href="${pageContext.request.contextPath}/search/doc/?keywords=${keywords}&pagenum=${i}&hot=1"><c:out value="${i}"></c:out></a>
                                                    </c:if>
                                                   <%-- <c:when test="${not empty time}">
                                                        <a class="btn btn-info " href="${pageContext.request.contextPath}/search/doc/?keywords=${keywords}&pagenum=${i}&time=1"><c:out value="${i}"></c:out></a>
                                                    </c:when>
                                                    <c:when test="${not empty hot}">
                                                        <a class="btn btn-info " href="${pageContext.request.contextPath}/search/doc/?keywords=${keywords}&pagenum=${i}&hot=1"><c:out value="${i}"></c:out></a>

                                                    </c:when>--%>
                                                 <%--   <c:otherwise>--%>

                                                   <%-- </c:otherwise>--%>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

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

</div>
</body>
</html>
