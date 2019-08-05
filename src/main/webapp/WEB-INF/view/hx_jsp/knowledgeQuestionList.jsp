<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/4/13
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>问答-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/knowledgeQuestion.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
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
    <style>
        /*没有结果时*/
        .search-noresult {
            text-align: center;
            padding: 30px 0;
        }
        .search-noresult .search-noresult-title {
            font-size: 34px;
            line-height: 1.2;
            margin: 0 0 11px;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="knowledgeList knowledgeQuestion">
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
                            <c:if test="${fromIndex == true}">
                                <li class="itemElement">
                                    <a href="#">
                                        <span>问答</span>
                                        <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${empty fromIndex}">
                                <c:if test="${empty param.sname}">
                                    <li class="itemElement">
                                        <a href="#">
                                            <span>${param.bname}</span>
                                            <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${! empty param.sname}">
                                    <li class="itemElement">
                                        <a href="${pageContext.request.contextPath}/questionlist?BtypeId=${param.BtypeId}">
                                            <span>${param.bname}</span>
                                            <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                        </a>
                                    </li>
                                    <li class="itemElement">
                                        <a href="#">
                                            <span>${param.sname}</span>
                                            <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                        </a>
                                    </li>
                                </c:if>
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
                                    问答分类
                                </h3>
                            </div>
                            <%--hx 2018/4/4 有数据就显示数据数，没有就为空 不能为零--%>
                            <ul class="knowledgeCategory">
                                <c:forEach items="${btypelist}" var="item">
                                    <li>
                                        <h5>
                                            <a href="${pageContext.request.contextPath}/questionlist?BtypeId=${item.id}&bname=${item.name}">${item.name}</a>
                                            <span class="redFont">${item.kquestion}</span>
                                            <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-up" onclick="clickShowMenu(this)"></a>
                                        </h5>
                                        <ul class="clickShowMenu" style="display: none">
                                            <c:forEach items="${item.stypes}" var="temp">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/questionlist?BtypeId=${item.id}&sid=${temp.id}&sname=${temp.name}&bname=${item.name}" class="ul-2-menu">${temp.name}</a>

                                                    <%--hx 2018/4/14 无法获取每个小标签的具体问答数--%>
                                                    <%--<span class="redFont">*</span>--%>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                </c:forEach>
                            </ul>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="title">
                            <h3 style="color: #D9534F">
                                <i class="glyphicon glyphicon-question-sign"></i>
                                问答
                            </h3>
                        </div>
                        <c:if test="${! empty noSolveProblem}">
                            <div class="hot-knowledge" style="padding-left: 15px">
                                <div class="title">
                                    <h3 style="color: #00B4B3;">
                                        待回答问题
                                    </h3>
                                </div>
                                <div class="noFinishQuestion">
                                    <c:forEach items="${noSolveProblem}" var="item">
                                        <div class="col-md-12 noQuestionItem">
                                            <span class="questionTime"><fmt:formatDate value="${item.posttime}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                                            <i class="glyphicon glyphicon-question-sign"></i>
                                            <a href="${pageContext.request.contextPath}/question/${item.id}">${item.title}</a>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!--分页-->
                                <!-- <div class="paging">
                                     <button type="submit" class="btn btn-info">1</button>
                                     <button type="submit" class="btn btn-info">2</button>
                                     <button type="submit" class="btn btn-info">3</button>
                                 </div>-->
                            </div>
                        </c:if>
                        <div class="hot-knowledge" style="padding-left: 15px">
                            <div class="title">
                                <h3 style="color: #00B4B3;">
                                    <img src="${pageContext.request.contextPath}/statics/img/问题单.png" alt="waiting" class="questionIcon">
                                    所有问题
                                </h3>
                            </div>
                            <c:if test="${! empty pageListQuestion.questionsList}">
                                <div class="allProblem">
                                    <div class="col-sm-12">
                                        <div class="col-sm-12 allProblemContent">
                                                <c:forEach items="${pageListQuestion.questionsList}" var="item">
                                                    <div class="media" style="margin: 20px 5px">
                                                        <a class="pull-right hidden-xs" title="高霸 我儿子!" style="max-width: 200px; text-align: center;margin: 20px 5px">
                                                            <img src="/upload${item.user.userImgid}" alt="wating" class="img-rounded" style="width: 60px; height: 60px">
                                                            <br>
                                                            <span class="adminManage">${item.user.userName}</span>
                                                        </a>
                                                        <div class="media-body">
                                                            <div class="pull-left" style="margin-left: 4px;">
                                                                <div>
                                                                    <span class="finishIcon">
                                                            <img src="${pageContext.request.contextPath}/statics/img/完成勾选2.png" alt="waiting">
                                                        </span>
                                                                    <a href="${pageContext.request.contextPath}/question/${item.id}" class="allProblemTitle">${item.title}</a>
                                                                </div>
                                                                <div class="allProblemContentInfo">
                                                                    <p>${item.content}</p>
                                                                </div>
                                                                <div class="allProblemTime">
                                                                    <a href="${pageContext.request.contextPath}/questionlist?BtypeId=${item.btype}&sid=${item.stype}&sname=${param.sname}" class="allProblemTarget">${param.sname}</a>
                                                                    &nbsp;&nbsp;&nbsp;
                                                                    <span class="glyphicon glyphicon-eye-open"></span>
                                                                    ${item.vistists}人阅读
                                                                    &nbsp;&nbsp;
                                                                    <span class="glyphicon glyphicon-comment"></span>
                                                                    ${item.comments}人回答
                                                                    &nbsp;
                                                                    <fmt:formatDate value="${item.posttime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                                                    &nbsp;
                                                                    <fmt:formatDate value="${item.posttime}" pattern="hh:ss"></fmt:formatDate>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${pageListQuestion.totalPage<10}">

                                        <c:set var="begin" value="1"> </c:set>
                                        <c:set var="end" value="${pageListQuestion.totalPage}"></c:set>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="begin" value="1"> </c:set>
                                        <c:set var="end" value="${pageListQuestion.totalPage}"></c:set>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${fromIndex == true}">
                                    <div class="paging">
                                        <!--分页按钮,分按时间分页按热度分页-->
                                        <c:forEach  var ="i"  begin="${begin}" end="${end}">
                                            <c:choose>
                                                <c:when test="${i == pageListQuestion.currentPage }">

                                                    <span class="disabled"> <a class="btn btn-info disabled" href=""><c:out value="${i}"></c:out></a></span>
                                                </c:when>
                                                <c:otherwise>

                                                    <a class="btn btn-info " href="${pageContext.request.contextPath}/questionall/?pagenum=${i}"><c:out value="${i}"></c:out></a>

                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    </div>
                                </c:if>
                                <c:if test="${empty fromIndex}">
                                    <div class="paging">
                                        <!--分页按钮,分按时间分页按热度分页-->
                                        <c:forEach  var ="i"  begin="${begin}" end="${end}">
                                            <c:choose>
                                                <c:when test="${i == pageListQuestion.currentPage}">

                                                    <span class="disabled"> <a class="btn btn-info disabled" href=""><c:out value="${i}"></c:out></a></span>
                                                </c:when>
                                                <c:otherwise>

                                                    <a class="btn btn-info " href="${pageContext.request.contextPath}/questionlist/?BtypeId=${param.BtypeId}&pagenum=${i}&sid=${param.sid}"><c:out value="${i}"></c:out></a>

                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    </div>
                                </c:if>
                            </c:if>
                            <c:if test="${empty pageListQuestion.questionsList}">
                                <div class="noResource">
                                    <div class="col-md-12">
                                        <div class="row" style="margin-top: 215px;margin-bottom: 215px">
                                            <div class="search-noresult">
                                                <h2 class="search-noresult-title">No Results</h2>
                                                <p style="word-wrap: break-word">
                                                    您找寻的"${param.bname}
                                                    <c:if test="${! empty param.sname}">
                                                        /${param.sname}
                                                    </c:if>"标签下没有内容，您可以尝试其他的?
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
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
