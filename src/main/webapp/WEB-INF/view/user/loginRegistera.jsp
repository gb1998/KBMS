<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-01-30
  Time: 20:01
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

            /*表单验证*/
            $('.login-con').validate({
                rules:{
                    "username":{
                        "required":true
                    },
                    "password":{
                        "required":true
                    }
                },
                messages:{
                    "username":{
                        "required":"用户名/邮箱不能为空"
                    },
                    "password":{
                        "required":"密码不能为空"
                    }
                }
            });
            $('.signup-email').validate({
                rules:{
                    "email":{
                        "required":true,
                        "email":true
                    },
                    "yourName":{
                        "required":true
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
                        "email":"邮箱格式不正确"
                    },
                    "yourName":{
                        "required":"用户名不能为空"
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
    </script>
</head>
<body>
<div class="nav-index">
    <header class="cd-main-header animate-search">
        <div class="cd-logo"><a href="index.html"><img src="${pageContext.request.contextPath}/statics/img/logo1%20(3).png" alt="Logo" style="width: 124px; height: 23px"></a></div>

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

                <li>
                    <a href="#">
                        登录/注册
                        <span class="glyphicon glyphicon-user"></span>
                    </a>
                </li>
            </ul> <!-- .cd-main-nav -->
        </nav> <!-- .cd-main-nav-wrapper -->

        <a href="#0" class="cd-nav-trigger cd-text-replace">Menu<span></span></a>
    </header>
    <main class="cd-main-content">
        <div class="login-banner">
            <a href="#" class="admin-logo" >
                <img src="${pageContext.request.contextPath}/statics/img/boy.png" alt="waiting" data-toggle="tooltip"  data-placement="top" title="欢迎使用BigBang知识库" draggable="false">
            </a>
        </div>
        <div class="login-box" >
            <div class="box-con tran">
                <form class="login-con f-l" method="post" >
                    <div class="form-group">
                        <input name="username" id="username" type="text" placeholder="邮箱/用户名"/>
                        <!--<label class="error" for="username" style="display: none;"></label>-->
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="密码" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <button type="button" class="tran pr" onclick="loginSubmit()">
                            <a href="javascript:viod(0);" class="tran">登录</a>
                            <img class="loading" src="img/loading.gif" style="display:block">
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
                    <div class="signup-email">
                        <div class="form-group">
                            <input type="text" placeholder="邮箱" class="email-mobile" name="email" id="email">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="您的名字" name="yourName" id="yourName">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="密码（字母、数字，至少6位）" name="password" id="password-1">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="确认密码" name="confirmPassword">
                        </div>
                        <div class="form-group">
                            <button class="tran pr" onclick="registersubmit()">
                                <a href="javascript:;" class="tran">注册</a>
                                <img class="loading" src="img/loading.gif">
                            </button>
                        </div>
                        <p class="view-clause">点击注册，即同意我们的 <a href="#">用户隐私条款</a></p>
                    </div><!-- 邮箱注册 -->
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
                    <div class="form-group">
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

                <form class="mimachongzhi f-l">
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
                        <button type="submit" class="tran pr">
                            <a href="javascript:;" class="tran">注册</a>
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
                    © 版权
                    <a href="#">BigBang 知识库</a>
                    by
                    <a href="#">BigBang小队</a>
                </div>
                <div class="nav-footer clearfix hidden-xs">
                    <ul>
                        <li>
                            <a class="#">Features</a>
                        </li>
                        <li>
                            <a href="#">Shortcodes</a>
                        </li>
                        <li>
                            <a href="#">FAQ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </main>
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

<script>

    function registersubmit() {

        var url = "${pageContext.request.contextPath}/user/registerSubmit";
        var params = {
            username: $('#yourName').val(),
            password: $('#password-1').val(),
            email :  $('#email').val()
        };
        $.ajax({
            'url' : url,
            'data' : params,
            'type' : 'POST',
            'success' : function(data) {
                alert(data.data);
                window.location.href="${pageContext.request.contextPath}/login/webPage"
            },
            'error' : function() {
                alert("注册失败了");
            }
        });
    }

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
