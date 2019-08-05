<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/2/1
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>index-BigBang知识库</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/img/logo1%20(1).png">
    <link href="${pageContext.request.contextPath}/statics/css/normalize.css-master/normalize.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/loginRegister/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/loginRegister/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <script src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-2.1.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/css/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/main.js"></script>
    <script>
        $(function () {
            var width = $(window).width();
            if(width <= 1280){
                $('.login-banner .admin-logo > img').attr('data-placement' , 'right');
            }else {
                $('.login-banner .admin-logo > img').attr('data-placement' , 'top');
            }
            $('[data-toggle="tooltip"]').tooltip();


            /*增加规则*/
            //自定义校验规则
//            验证邮箱
            $.validator.addMethod(

                //规则的名称
                "checkname",
                //校验的函数
                function (value , element , params) {
                    //value 代表校验对象的内容
                    //element 被校验的元素对象
                    //params 规则名称对应的参数

                    //对username进行校验
                    //注意点：ajax必须改为同步，因为如果是异步的话，ajax相当于新开了一个线程，return !flag可能会先执行，所以就不会先被赋值
                    //设置一个标识变量
                    var flag = false;
                    $.ajax({

                        "async":false,
                        "data":{"checkEmail":value},
                        "dataType":"JSON",
                        "type":"POST",
                        "url":"${pageContext.request.contextPath}/user/is_email",
                        "success":function (data) {
                            flag = data.checkEmail;
                        }
                    });

                    //false代表校验不通过(因为flag = true 代表用户名已经存在)
                    return !flag;
                }
            );
//            验证用户名已经存在
            $.validator.addMethod(

                //规则的名称
                "checkUsername",
                //校验的函数
                function (value , element , params) {
                    //value 代表校验对象的内容
                    //element 被校验的元素对象
                    //params 规则名称对应的参数

                    //对username进行校验
                    //注意点：ajax必须改为同步，因为如果是异步的话，ajax相当于新开了一个线程，return !flag可能会先执行，所以就不会先被赋值
                    //设置一个标识变量
                    var flag = false;
                    $.ajax({

                        "async":false,
                        "data":{"username":value},
                        "dataType":"JSON",
                        "type":"POST",
                        "url":"${pageContext.request.contextPath}/user/check_name",
                        "success":function (data) {
                            flag = data.checkUsername;
                        }
                    });

                    //false代表校验不通过(因为flag = true 代表用户名已经存在)
                    return !flag;
                }
            );
//            验证用户名不存在
            $.validator.addMethod(

                //规则的名称
                "checkNoUsername",
                //校验的函数
                function (value , element , params) {
                    //value 代表校验对象的内容
                    //element 被校验的元素对象
                    //params 规则名称对应的参数

                    //对username进行校验
                    //注意点：ajax必须改为同步，因为如果是异步的话，ajax相当于新开了一个线程，return !flag可能会先执行，所以就不会先被赋值
                    //设置一个标识变量
                    var flag = false;
                    $.ajax({

                        "async":false,
                        "data":{"username":value},
                        "dataType":"JSON",
                        "type":"POST",
                        "url":"${pageContext.request.contextPath}/login/checkusername",
                        "success":function (data) {
                            flag = !data.checkUsername;
                        }
                    });

                    //false代表校验不通过(因为flag = true 代表用户名已经存在)
                    return !flag;
                }
            );
            /*表单验证*/
            $('.login-con').validate({
                rules:{
                    "username":{
                        "required":true,
                        "checkNoUsername":true
                    },
                    "password":{
                        "required":true
                    }
                },
                messages:{
                    "username":{
                        "required":"用户名/邮箱不能为空",
                        "checkNoUsername":"用户名不存在"
                    },
                    "password":{
                        "required":"密码不能为空"
                    }
                }
            });
//		    var valid = $('.login-con').
            /*var form = $('.login-con').validate().form();
             if(form){
             $('#login').attr('disabled' , 'disabled');
             }else {
             $('#login').removeAttr('disabled');
             }*/
            $('.signup-email').validate({
                rules:{
                    "email":{
                        "required":true,
                        "email":true,
                        "checkname":true
                    },
                    "yourName":{
                        "required":true,
                        "checkUsername":true
                    },
                    "password":{
                        "required":true,
                        "maxlength":12,
                        "minlength":6
                    },
                    "confirmPassword":{
                        "required":true,
                        "equalTo":"#password-1"
                    }
                },
                messages:{
                    "email":{
                        "required":"邮箱不能为空",
                        "email":"邮箱格式不正确",
                        "checkname":"邮箱已经存在"
                    },
                    "yourName":{
                        "required":"用户名不能为空",
                        "checkUsername":"用户名已经存在"
                    },
                    "password":{
                        "required":"密码不能为空",
                        "maxlength":"密码输多了",
                        "minlength":"密码输少了"
                    },
                    "confirmPassword":{
                        "required":"确认密码不为空",
                        "equalTo":"密码输入不一致"
                    }
                }
            });
            $(".mimachongzhi").validate({
                rules:{
                    "email":{
                        "required":true,
                        "email":true
                    }
                },
                messages:{
                    "email":{
                        "required":"邮箱不能为空",
                        "email":"邮箱格式不正确"
                    }
                }
            });
        });
        //点击头像显示
        function showDropdown() {
            if($('.user-logo-choice').css('display') == 'block'){
                $('.user-logo-choice').fadeOut('fast');
                $('.showDown > span').attr('class' , 'glyphicon glyphicon-chevron-up');
            }else {
                $('.user-logo-choice').fadeIn('fast');
                $('.showDown > span').attr('class' , 'glyphicon glyphicon-chevron-down');
            }
        }
        //点击头像显示
        function showDropdownFix() {
            if($('.fix-user-logo-choice').css('display') == 'block'){
                $('.fix-user-logo-choice').fadeOut('fast');
                $('.showDownFix > span').attr('class' , 'glyphicon glyphicon-chevron-up');
            }else {
                $('.fix-user-logo-choice').fadeIn('fast');
                $('.showDownFix > span').attr('class' , 'glyphicon glyphicon-chevron-down');
            }
        }
    </script>
</head>
<body>
<div class="nav-index">
    <%@include file="../common/head.jsp"%>
    <main class="cd-main-content">
        <div class="login-banner">
            <a href="#" class="admin-logo" >
                <img src="${pageContext.request.contextPath}/statics/img/boy.png" alt="waiting" data-toggle="tooltip"  data-placement="top" title="欢迎使用BigBang知识库" draggable="false">
            </a>
        </div>
        <div class="login-box" >
            <div class="box-con tran">
                <form class="login-con f-l" method="post" id="login"  action="${pageContext.request.contextPath}/login/websubmit" autocomplete="off">
                    <div class="form-group">
                        <input name="username" id="username" type="text" placeholder="邮箱/用户名" onfocus ="qingkong()"/>
                        <!--<label class="error" for="username" style="display: none;"></label>-->
                    </div>
                    <div class="form-group" >
                        <input type="password" placeholder="密码" name="password" id="password" onfocus ="qingkong()">
                        <script>

                            function qingkong (){
                                var warnban=document.getElementById("warnban");
                                //warnban.innerHTML="   ";
                            }

                        </script>
                    </div>

                    <c:if test="${map.code==0 }">
                        <div id="warnban" name="warnban" class="warnban"  style="color:#F00" ></div>
                        <script type="text/javascript">
                            var warnban=document.getElementById("warnban");
                            warnban.innerHTML="密码错误，请重新输入密码";
                        </script>
                        <c:remove var="loginfail" scope="request"/>
                    </c:if>
                    <div class="errorinfo"></div>
                    <div class="form-group">
                        <button type="submit" class="tran pr" id="login" >
                            <a href="#" class="tran" onclick="document.getElementById('login').submit()">登录</a>
                           <%-- <img class="loading" src="img/loading.gif" style="display:block">--%>
                        </button>
                    </div>
                    <div class="from-line"></div>
                    <div class="form-group">
                        <a href="javascript:viod(0);" class="move-signup a-tag tran blue-border">还没有帐号？免费注册<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                    <div class="form-group">
                        <a href="javascript:viod(0);" class="move-reset a-tag tran">忘记密码？重置 <i class="iconfont tran">&#xe606;</i></a>
                    </div>
                    <div class="form-group">
                        <a href="javascript:viod(0);" class="move-other a-tag tran">使用第三方帐号登录<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                </form>
                <!-- 登录 -->

                <div class="signup f-l">
                    <form class="signup-email" method="post" id="reg"   action="${pageContext.request.contextPath}/user/registerSubmit" autocomplete="off">
                        <div class="form-group">
                            <input type="text" placeholder="邮箱" class="email-mobile" name="email" id="email" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="您的名字" name="yourName">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="密码（字母、数字，至少6位）" name="password" id="password-1">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="确认密码" name="confirmPassword">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="tran pr" id ="reg">
                                <a href="#" class="tran" onclick="document.getElementById('reg').submit()">注册</a>
                                <!--<a href="javascript:void (0);" class="tran">注册</a>-->
                                <img class="loading" src="img/loading.gif">
                            </button>
                        </div>
                        <p class="view-clause">点击注册，即同意我们的 <a href="#">用户隐私条款</a></p>
                    </form><!-- 邮箱注册 -->
                    <div class="from-line"></div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-login a-tag tran blue-border">已有帐号？登录<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-other a-tag tran">使用第三方帐号登录<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                </div>
                <!-- 注册 -->

                <div class="other-way f-l">
                    <div class="form-group" >
                        <button type="submit" class="tran pr">
                            <a href="javascript:;" class="tran">QQ帐号登录</a>
                            <img class="loading" src="img/loading.gif">
                        </button>
                    </div>
                    <div class="from-line"></div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-signup a-tag tran blue-border">还没有帐号？免费注册<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-login a-tag tran">已有帐号？登录<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                </div>
                <!-- 第三方登录 -->

                <form class="mimachongzhi f-l" autocomplete="off">
                    <div class="form-group">
                        <input type="text" placeholder="请输入您的邮箱地址" name="email">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="tran pr" onsubmit="true">
                            <a href="javascript:;" class="tran">发送重置密码邮件</a>
                            <img class="loading" src="img/loading.gif">
                        </button>
                    </div>
                    <div class="from-line"></div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-signup	a-tag tran blue-border">还没有帐号？免费注册<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="move-login a-tag tran">已有帐号？登录<i class="iconfont tran">&#xe606;</i></a>
                    </div>
                </form>
                <!-- 密码重置 -->

                <div class="mobile-success f-l">
                    <p>手机号 <span>186****7580</span> 验证成功</p>
                    <p>请完善您的账号信息，您也可以<a href="#">绑定现有账号</a></p>
                    <div class="form-group">
                        <input type="text" placeholder="邮箱" class="email-mobile" onBlur="verify.verifyEmail(this)"/>
                        <span class="error">邮箱格式不正确</span>
                    </div>
                    <div class="form-group">
                        <input type="text" placeholder="您的名字">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="密码（字母、数字，至少6位）" onBlur="verify.PasswordLenght(this)"/>
                        <span class="error">密码长度不够</span>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="tran pr" id="reg1">
                            <a href="#" class="tran" onclick="document.getElementById('reg').submit()">注册</a>
                            <!--<a href="javascript:;" class="tran">注册</a>-->
                            <img class="loading" src="img/loading.gif">
                        </button>
                    </div>
                    <p class="view-clause">点击注册，即同意我们的 <a href="#">用户隐私条款</a></p>
                </div>
                <!-- 手机注册成功添补信息 -->
            </div>
        </div>
        <div style="height:80px;"></div>

        <div class="login-footer">
            <div class="container">
                <div class="copyright">
                    版权
                    <a href="#">BigBang 知识库</a>
                    by
                    <a href="#">BigBang小队</a>
                </div>
                <div class="nav-footer clearfix hidden-xs">
                    <ul>
                        <li>
                            <a class="#">Features</a>
                        <li>
                            <a href="#">Shortcodes</a>
                        <li>
                            <a href="#">FAQ</a>
                    </ul>
                </div>
            </div>
        </div>
    </main>

</div>

<script>

    var _handle='';//储存电话是否填写正确
    $(function(){

        $(".signup-form input").on("focus",function(){
            $(this).parent().addClass("border");
        });
        $(".signup-form input").on("blur",function(){
            $(this).parent().removeClass("border");
        })
        //注册方式切换
        $(".signup-select").on("click",function(){
            var _text=$(this).text();
            var $_input=$(this).prev();
            $_input.val('');
            if(_text=="手机注册"){
                $(".signup-tel").fadeIn(200);
                $(".signup-email").fadeOut(180);
                $(this).text("邮箱注册");
                $_input.attr("placeholder","手机号码");
                $_input.attr("onblur","verify.verifyMobile(this)");
                $(this).parents(".form-group").find(".error").text("手机号码格式不正确")

            }
            if(_text=="邮箱注册"){
                $(".signup-tel").fadeOut(180);
                $(".signup-email").fadeIn(200);
                $(this).text("手机注册");
                $_input.attr("placeholder","邮箱");
                $_input.attr("onblur","verify.verifyEmail(this)");
                $(this).parents(".form-group").find(".error").text("邮箱格式不正确")
            }
        });
        //步骤切换
        var _boxCon=$(".box-con");
        $(".move-login").on("click",function(){
            $(_boxCon).css({
                'marginLeft':0
            })
        });
        $(".move-signup").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-320
            })
        });
        $(".move-other").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-640
            })
        });
        $(".move-reset").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-960
            })
        });
        $("body").on("click",".move-addinf",function(){
            $(_boxCon).css({
                'marginLeft':-1280
            })
        });

        //获取短信验证码
        var messageVerify=function (){
            $(".get-message").on("click",function(){
                if(_handle){
                    $("#message-inf").fadeIn(100)
                    $(this).html('<a href="javascript:;">下一步</a><img class="loading" src="images/loading.gif">').addClass("move-addinf");
                }
            });
        }();
    });

</script>
</body>
</html>
