<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-01-28
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath=request.getContextPath();%>
<!DOCTYPE html>
<html>

<head>
    <script charset="UTF-8" src="${pageContext.request.contextPath}/text/javascript/jquery-1.8.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/text/lib/bootstrap/css/bootstrap.min.css">

    <script charset="UTF-8" src="${pageContext.request.contextPath}/text/lib/kindEditor/kindeditor-all-min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/text/lib/kindEditor/themes/default/default.css">
    <!--同时引入bootstracp框架样式和jquery.js-->
    <title>利用KindEditor插件来本地上传和预览图片</title>
</head>

<body>
<!--单一处理头像-->
<div class="containerbox">
    <div class="container ">
        <div class="row">
            <div class="col-sm-3  visible-lg visible-md"></div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-12" style="margin-bottom: 8px;">
                        <span style="color: #D9534F;" class="glyphicon glyphicon-user   ">用户注册</span>
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <c:if test="${pageset.commitType=='1'}">
                            <div class="alert alert-danger">${pageset.message}</div>
                        </c:if>
                        <form role="form" action="webuser/PubRegistCommit.do"
                              id="registSubmitFormId" method="post">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label > 登录账户 <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="loginname"
                                                       id="loginnameId" placeholder="输入账户名称" value="${loginname}" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label > 登录密码 <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="password" id="passwordId" class="form-control"
                                                       name="password" placeholder="输入登录密码" value="${password}" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label > 重复密码 <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="password" id="passwordId2"
                                                       class="form-control" placeholder="重新输入登录密码" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label > 姓名 <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="name"
                                                       id="nameid" placeholder="输入真实姓名" value="${name}" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label >邮箱  <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" name="name"
                                                       id="e-mailnumber" placeholder="请输入邮箱账号" value="${name}" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${showOrg }">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label > 组织机构 <span
                                                    class="alertMsgClass">*</span>
                                            </label>
                                            <div class="row">
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" id="orgnameId"
                                                           readonly="readonly" placeholder="选择机构" value="" /> <input
                                                        type="hidden" name="orgid" id="orgid" value="${org.id}" />
                                                </div>
                                                <div class="col-md-3">
                                                    <button class="btn btn-info btn-sm" data-toggle="modal"
                                                            id="openChooseTypeButtonId" data-target="#myModal">
                                                        选择</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label> 头像 <span
                                                class="alertMsgClass">*</span>
                                        </label>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <img id="imgShowBoxId" src="" alt="头像" class=""
                                                     style="width: 60px; height: 60px;" /> <input type="text"
                                                                                                  name="photoid" id="photoid" value="${photoid}"
                                                                                                  style="width: 0px; border: 0px;" readonly="readonly" /> <input
                                                    type="button" id="uploadButton" value="上传头像" />
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <button type="button" id="registSubmitButtonId"
                                            class="btn btn-primary">提交</button>
                                </div>
                                <div class="col-md-10">
                                    <span class="alertMsgClass" id="errormessageShowboxId">${errorMessage }</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
     123
     alert(123)

<!--利用插件上传照片并本地预览-->
$(function () {

    KindEditor
        .ready(function(K) {
            var uploadbutton = K
                .uploadbutton({
                    button : K('#uploadButton'),
                    fieldName : 'imgFile',
                    url :'${pageContext.request.contextPath}'+ '/upload/uploadImg',

                    afterUpload : function(data) {


                        if (data.error === 0) {
                            $('#imgShowBoxId').attr('src',
                                data.url);
                            $('#photoid').val(data.id);
                            $('#photoid').parent().find(
                                ".errorMsgClass").empty();//清空验证消息(临时实现方法)
                        } else {
                            if (data.message == '') {
                                alert("请检查上传文件类型(png、gif、jpg、bmp)以及文件大小不能超过2M");
                            } else {
                                alert(data.message);
                            }
                        }
                    },
                    afterError : function(str) {

                        alert('自定义错误信息: ' + str);
                    }
                });

            uploadbutton.fileBox.change(function(e) {


                uploadbutton.submit();
            });
        });
  // alert("完成");
});

</script>

</body>
</html>
