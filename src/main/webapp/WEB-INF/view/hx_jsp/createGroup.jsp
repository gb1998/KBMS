<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/4/14
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>创建小组-基本信息-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-fileinput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap-fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/knowledgeContent.js"></script>
    <style>
        .specialFont {
            margin-top: 8px;
            color: #cb2c33;
            font-size: 12px;
        }
        #idcode div {
            cursor: pointer;
            height: 35px;
            width: 100px;
            float: right;
            border: none;
            font-size: 20px;
            text-align: center;
        }
        .widget-box {
            margin-bottom: 2px;
            overflow: hidden;
        }
        .shadow-box {
            background-color: #F4F5F5;
            border: 1px solid #dddddd;
            box-shadow: 0 1px 1px rgba(209 , 212 , 221 , 0.15);
        }
        .widget-box .title h3 {
            font-size: 16px;
            line-height: 46px;
            margin: 9px 15px;
            color: #d9534f;
            font-weight: bold;
        }
        .submitComment {
            font-size: 14px;
            text-transform: uppercase;
            background: #00b4b3;
            border-radius: 99px;
            border: 0;
            padding: 12px 28px;
            font-weight: bold;
            color: #ffffff;
            text-shadow: none;
            cursor: pointer;
            display: inline-block;
            outline: 0;
            overflow: visible;
            margin: 20px 0 0 0;
            text-decoration: none;
            vertical-align: middle;
            width: auto;
            transition: all 0.3s ease-in-out;
        }
        .submitComment:hover {
            background: #00A8A8;
        }
        .thumbnail img {
            border-radius: 50%;
            width: 200px;
            height: 200px;
        }
        .error {
            color: #ff4e00;
            font-weight: normal;
            font-size: 14px;
        }
    </style>
    <script>

    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="createGroup" style="margin-bottom: 60px">
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
                                <a href="${pageContext.request.contextPath}/groupall">
                                    <span>小组</span>
                                    <img src="${pageContext.request.contextPath}/statics/img/zhixiang.png" alt="waiting">
                                </a>
                            </li>
                            <li class="itemElement">
                                <a href="#">
                                    <span>创建小组</span>
                                </a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="container" style="font-size: 14px">
                <div class="row" style="margin-top: 26px;margin-bottom: 30px">
                    <div class="col-md-3 visible-lg visible-md"></div>
                    <div class="col-md-6">
                        <form action="${pageContext.request.contextPath}/group/add" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="groupName">
                                            小组名称
                                            <span class="specialFont">*</span>
                                        </label>
                                        <input type="text" class="form-control" name="groupName" value="" placeholder="输入小组名字" id="groupName">
                                    </div>
                                    <div class="form-group">
                                        <label for="groupPower">
                                            小组权限
                                            <span class="specialFont">*</span>
                                        </label>
                                        <select name="groupPower"  class="form-control selectpicker" title="请选择" id="groupPower">
                                            <option value="1">自由加入</option>
                                            <option value="2">小组权限</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6" style="text-align: center;">
                                    <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                                        <div style="text-align: center;margin-bottom: 10px">
                                                    <span class="btn btn-info btn-file">
                                                        <span class="fileinput-new">选择图片文件</span>
                                                        <span class="fileinput-exists">换一张</span>
                                                        <input type="file" name="imageFile" id="picID"  accept="image/gif,image/jpeg,image/x-png" />
                                                    </span>
                                            <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                                        </div>
                                        <div class="fileinput-new thumbnail" style="max-width: 210px;max-height: 400px;text-align: center;border-radius: 50%">
                                            <img id='picImg' style="max-width: 200px;max-height: 400px;border-radius: 50%" src="${pageContext.request.contextPath}/statics/img/default.png" alt="waiting" />
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 210px;max-height: 400px;border-radius: 50%"></div>

                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 15px">
                                <div class="col-md-12">
                                    <label for="groupTag">
                                        小组标签
                                    </label>
                                    <input type="text" class="form-control" name="groupTag" value="" placeholder="输入小组标签,如：科技、技术...,多个标签间用逗号或空格分隔" id="groupTag">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="groupNote">
                                            小组介绍
                                            <span class="specialFont">*</span>
                                        </label>
                                        <textarea name="indounces" id="groupNote" rows="3" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="text-align: center">
                                <button class="submitComment" type="submit">提交</button>
                            </div>
                        </form >
                    </div>
                    <div class="col-md-3 visible-lg visible-md"></div>
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