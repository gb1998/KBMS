<%--
  Created by IntelliJ IDEA.
  User: hx
  Date: 2018/3/19
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
        $(function () {
            /*回到顶部*/
            $(window).scroll(function () {
                if($(window).scrollTop()>=100) {
                    $(".backTop a").fadeIn();
                }else {
                    $('.backTop a').fadeOut();
                }
            });

            $('.backTop').click(function (event) {
                $('html,body').animate({scrollTop:0},500);
                return false;
            });
            $('.backTop').hover(function () {
                $('.backTop a img').attr('src' , '${pageContext.request.contextPath}/statics/img/top.png');
            },function () {
                $('.backTop a img').attr('src' , '${pageContext.request.contextPath}/statics/img/top_black.png');
            })
        })
    </script>
<div class="backTop hidden-xs hidden-sm">
    <a>
        <img src="${pageContext.request.contextPath}/statics/img/top_black.png" alt="waiting">
    </a>
</div>
