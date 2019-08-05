<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-10
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <header class="cd-main-header animate-search" style="display: block">
    <div class="cd-logo"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="Logo" style="width: 124px; height: 23px"></a></div>

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
                                <a href="#">
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
                                <a href="${pageContext.request.contextPath}/goQuestionForm">
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
