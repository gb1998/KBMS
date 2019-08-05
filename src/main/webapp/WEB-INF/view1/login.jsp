<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <%@include file="common/head.jsp"%>
    <style type="text/css">
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }

        .get {
            background: #1E5B94;
            color: #fff;
            text-align: center;
            padding: 100px 0;
        }

        .get-title {
            font-size: 200%;
            border: 2px solid #fff;
            padding: 20px;
            display: inline-block;
        }

        .get-btn {
            background: #fff;
        }

        .detail {
            background: #fff;
        }

        .detail-h2 {
            text-align: center;
            font-size: 150%;
            margin: 40px 0;
        }

        .detail-h3 {
            color: #1f8dd6;
        }

        .detail-p {
            color: #7f8c8d;
        }

        .detail-mb {
            margin-bottom: 30px;
        }

        .hope {
            background: #0bb59b;
            padding: 50px 0;
        }

        .hope-img {
            text-align: center;
        }

        .hope-hr {
            border-color: #149C88;
        }

        .hope-title {
            font-size: 140%;
        }

        .about {
            background: #fff;
            padding: 40px 0;
            color: #7f8c8d;
        }

        .about-color {
            color: #34495e;
        }

        .about-title {
            font-size: 180%;
            padding: 30px 0 50px 0;
            text-align: center;
        }

        .footer p {
            color: #7f8c8d;
            margin: 0;
            padding: 15px 0;
            text-align: center;
            background: #2d3e50;
        }
    </style>
</head>
<body>
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-container">
        <h1 class="am-topbar-brand">
            <a>SOKLIB - 知识库管理系统</a>
        </h1>

        <div class="am-collapse am-topbar-collapse" id="collapse-head">

            <div class="am-topbar-right">
                <a href="registerUI" class="am-btn am-btn-secondary am-topbar-btn am-btn-sm">
                    <span class="am-icon-pencil"></span> 注册
                </a>
            </div>

            <div class="am-topbar-right">
                <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" onclick="loginWindow()">
                    <span class="am-icon-user"></span> 登录
                </button>
            </div>
        </div>
    </div>
</header>
<div class="get">
    <div class="am-g">
        <div class="am-u-lg-12" id="adver">
            <h1 class="get-title">SOKLIB - 知识库管理系统</h1>

            <h2 class="detail-h2">Intelligent 智能、Convenient 便捷、Effective 有效</h2>
            <p>将来自工作中、生活中、培训中、组织内的各类资料和领域知识进行管理维护并提供关联分析和综合查询服务</p>


            <p>特色：智能提取演绎、清晰的知识网络、多格式在线浏览、智能推荐</p>
            <p>
                <a class="am-btn am-btn-sm get-btn" onclick="loginWindow()">立即登录</a>
            </p>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <form class="form-signin" role="form" id="loginFormId"
                      action="login/websubmit" method="post">
                    <div class="form-group">
                        <label >
                            登录名
                        </label>
                        <input type="text" class="form-control" placeholder="请录入登录名" value="${loginname}"
                               style="margin-top: 4px;" id="loginNameId" name="username" required
                               autofocus>
                    </div>
                    <div class="form-group">
                        <label >
                            登录密码
                        </label>
                        <input type="password" class="form-control" placeholder="请录入密码"
                               style="margin-top: 4px;" id="loginPassWId" name="password"
                               required>
                    </div>
                    <input type="hidden" name="url" id="loginUrlId">
                    <div>
                        <button  type="submit" class="btn  btn-primary text-left" id="loginButtonId"
                                style="margin-top: 4px;" type="button">
                            登录
                        </button>
                        <PF:IfParameterEquals key="config.sys.registable" val="true">
                            <a
                                    style="float: right; text-decoration: underline; margin-top: 12px; margin-right: 8px;"
                                    type="button" href="webuser/PubRegist.do"> 注册 </a>
                        </PF:IfParameterEquals>
                    </div>
                </form>
            </div>
        </div>



    </div>
</div>

    <div class="alert alert-danger" style="margin-top: 4px;">
        这是打印出催我信息
        <span class="glyphicon glyphicon-exclamation-sign"></span>
            ${map.get("loginfail")}

        <script>
            alert( ${map.get("loginfail")})
        </script>
    </div>

<div id="alertMessageErrorId" class="alert alert-danger"
     style="margin-top: 4px;">
</div>
<footer class="footer">
    <p>©2016 中国软件杯，垃圾堆</p>
</footer>



</body>


</html>