<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-03-10
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

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
                <!--登录显示头像-->
                <!--判断用户是否登录-->

                <c:choose>

                    <c:when test="${! empty user}">
                        <li class="fix-menu-item-user">
                                        <span style="color: #fff;font-size: 15px;line-height: 1;cursor: pointer" onclick="showDropdownFix()">
                                           <img src="${pageContext.request.contextPath}/statics/img/boy.png" alt="waiting" class="img-rounded" style="width: 40px; height: 40px; margin-bottom: 5px">
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
                                    <a href="#">
                                        <span class="glyphicon glyphicon-book"></span>
                                        创建文档
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
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

                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${pageContext.request.contextPath}/login/webPage">
                                登录/注册
                                <span class="glyphicon glyphicon-user"></span>
                            </a>
                        </li>
                    </c:otherwise>



                </c:choose>

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
