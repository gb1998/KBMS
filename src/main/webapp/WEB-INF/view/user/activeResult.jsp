<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hncta
  Date: 2018-01-30
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script type="javascript">
    aaasdasaa

    </script>
    <title>邮箱验证结果</title>
</head>
<body>
<c:if test="${count==0}">
 邮箱激活失败
</c:if>
<c:if test="${count==1}">
    邮箱激活成功
</c:if >

</body>
</html>
