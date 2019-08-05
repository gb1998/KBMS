<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/4/14
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小组-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeGroup.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
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
                                    <span>小组</span>
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="row groupTitle">
                            <div class="col-sm-12">
                                <div class="pull-right">
                                    <a class="btn btn-success" href="${pageContext.request.contextPath}/goGroupFrom">创建小组</a>
                                </div>
                                <span class="specialGroup">
                                        <img src="${pageContext.request.contextPath}/statics/img/group2.png" alt="waiting">
                                        小组
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <c:forEach items="${groupList}" var="item">
                                <div class="col-md-3">
                                    <div class="panel panel-info">
                                        <div class="panel-body">
                                            <div class="media">
                                                <a href="${pageContext.request.contextPath}/group/${item.id}" class="pull-right">
                                                    <img src="/upload${item.groupHeadimg}" alt="waiting" class="img-rounded panelImage" >
                                                </a>
                                                <div class="media-body">
                                                    <div class="pull-left" style="margin-left: 4px">
                                                        <div class="groupPanelTitle">
                                                            <a href="${pageContext.request.contextPath}/group/${item.id}">${item.groupName}</a>
                                                        </div>
                                                        <div class="groupPanelIntro">
                                                            成员人数(${item.groupNums})
                                                            <br>
                                                            <fmt:formatDate value="${item.groupTime}" pattern="yyyy-MM-dd"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="groupPanelContent">
                                                    <hr style="margin: 4px">
                                                    ${item.groupDescirate}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="paging">
                                    <button type="submit" class="btn btn-info disabled">1</button>
                                    <button type="submit" class="btn btn-info">2</button>
                                    <button type="submit" class="btn btn-info">3</button>
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
</div>
</body>
</html>
