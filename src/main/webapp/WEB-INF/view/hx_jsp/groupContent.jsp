<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/4/14
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小组内容-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/groupContent.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
    <script>
        function addOrRemove(temp) {

            var val =$(temp).html();


            if(val === "加入小组"){


                $(temp).html("<span class='glyphicon glyphicon-remove'></span> <span class='removeGroup'>退出小组</span>");
                $('.character').css('display' , 'block');
            }else if($(temp).children('.removeGroup').html() === "退出小组"){

                if(confirm("确定要退出小组吗？"))
                {
                    $(temp).html('加入小组')
                    $('.character').css('display' , 'none');
                }
                else
                {
                    return false;
                }

            }
        }
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="groupContent">
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
                                    <span>小组内容</span>
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container"  style="margin-bottom: 60px">
                <div class="row" style="margin-top: 26px">
                    <div class="col-md-3 hidden-xs hidden-sm">
                        <div class="group-box shadow-box">
                            <div class="title">
                                <h3 >
                                    <i class="glyphicon glyphicon-user"></i>
                                    管理员
                                </h3>
                            </div>
                            <div class="group-member">
                                <div class="group-mem-img" style="padding: 4px">
                                    <div style="float: left">
                                        <a href="#" target="_blank" title="系统管理员" style="font-size: 14px;margin: auto 4px;font-weight: bold">
                                            <img src="/upload${createUser.userImgid}" alt="waiting" style="width: 36px;height: 36px;margin: 4px">
                                            <span>${createUser.userName}</span>
                                        </a>
                                    </div>
                                    <div style="clear: both;min-height: 29px"></div>
                                </div>
                            </div>
                        </div>

                        <div class="group-box shadow-box">
                            <div class="title">
                                <h3>
                                    <i class="glyphicon glyphicon-user"></i>
                                    小组成员
                                </h3>
                            </div>
                            <div class="group-member">
                                <div class="group-mem-img" style="padding: 4px">
                                    <c:forEach items="${groupuser.user}" var="item">
                                        <div style="float: left;margin-bottom: 15px;margin-left: 5px">
                                            <a href="#" target="_blank" title="系统管理员" style="font-size: 13px;font-weight: bold">
                                                <img src="/upload${item.userImgid}" alt="waiting" style="width: 33px;height: 33px;margin: 4px">
                                                <div style="margin-left: 7px">${item.userName}</div>
                                            </a>
                                        </div>
                                    </c:forEach>
                                    <div style="float: left;margin-bottom: 15px;margin-left: 5px;display:none" class="character">
                                        <a href="#" target="_blank"  style="font-size: 13px;font-weight: bold">
                                            <img src="${pageContext.request.contextPath}/statics/img/girl.png" alt="waiting" style="width: 33px;height: 33px;margin: 4px">
                                            <div style="margin-left: 2px">高小妹</div>
                                        </a>
                                    </div>
                                    <div style="clear: both;min-height: 20px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="group-box shadow-box">
                            <div style="background: #F4F5F5">
                                <div class="stream-list" style="min-height: 135px;padding-left: 16px;padding-right: 16px">
                                    <div class="media">
                                        <div class="pull-left hidden-xs group-intro">
                                            <img src="/upload${groupuser.groupHeadimg}" alt="waiting" style="width: 100%">
                                        </div>
                                        <div class="media-body">
                                            <h3 class="media-heading" style="font-size: 18px;font-weight: bold">
                                                <a href="#" style="color: #605f5f">${groupuser.groupName}</a>
                                            </h3>
                                            <div class="bg-success" style="background: inherit">
                                                <small>小组成立于</small>
                                                <strong>
                                                    <fmt:formatDate value="${groupuser.groupTime}" pattern="yyyy-MM-dd hh:ss"/>
                                                </strong>
                                                <small>有成员</small>
                                                <strong>${groupuser.groupNums}</strong>
                                                <small>人,共发布文档</small>
                                                <strong>${groupuser.groupDocnum}</strong>
                                                <small>篇</small>
                                                <div style="border-top: 1px dotted #ddd;padding-top: 4px;margin-top: 4px;font-size: 14px">${groupuser.groupDescirate}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="margin-bottom: 2px;background: #F4F5F5">
                            <div class=" hidden-xs hidden-sm" style="padding-right: 8px;padding-top: 8px">
                                <div style="float: right">
                                    <a href="javascript:void(0);" class="btn btn-info btn-sm" onclick="addOrRemove(this)">加入小组</a>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            <div class="stream-item" style="padding: 8px">
                                <div style="padding-top: 5px"></div>
                                <div class="group-logo">
                                    <p>
                                        <img src="${pageContext.request.contextPath}/statics/img/timg.jpg" alt="wating" style="max-width: 100%">
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="group-discuss-content" style="background: #F4F5F5">
                            <c:forEach items="${groupdoc}" var="item" varStatus="i">
                                <div class="user-discuss-content">
                                    <div class="media">
                                        <a href="#" class="user-img">
                                            <img src="/upload${item.user.userImgid}" alt="waiting">
                                            <p class="user-name">guest</p>
                                        </a>
                                        <div class="pull-right media-img-intro hidden-xs">
                                            <img src="/upload${item.previewurl}" alt="waiting">
                                        </div>
                                        <div class="media-body">
                                            <div class="pull-left" style="margin-left: 4px">
                                                <div class="media-body-title">
                                                    <a href="#" class="media-tit">
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
                                                    <p class="media-body-info">
                                                        ${item.summary}...
                                                    </p>
                                                </div>
                                                <div class="media-pop">
                                                    技能培训(
                                                    <img src="${pageContext.request.contextPath}/statics/img/dianzan.png" alt="">
                                                    ${item.favers}
                                                    <img src="${pageContext.request.contextPath}/statics/img/liuyan.png" alt="">
                                                    ${item.comments}) <fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd hh-ss"></fmt:formatDate>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <%--没有分页--%>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="paging" style="margin-top: 20px">
                                        <button type="submit" class="btn btn-info">1</button>
                                        <button type="submit" class="btn btn-info">2</button>
                                        <button type="submit" class="btn btn-info">3</button>
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
</div>
</body>
</html>


