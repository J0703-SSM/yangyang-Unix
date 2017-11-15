<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css"/>
    <script src="/resource/js/JQ3.2.1.js"></script>
</head>
<body class="index">
<!--导航区域开始-->
<div id="index_navi">
    <ul id="menu">

        <li><a href="/index" class="index_off"></a></li>
        <li><a href="/admin/role_list" class="role_off"></a></li>
        <li><a href="/admin/admin_list" class="admin_off"></a></li>
        <li><a href="/cost/cost_list" class="fee_off"></a></li>
        <li><a href="/account_list" class="account_off"></a></li>
        <li><a href="/service_list" class="service_off"></a></li>
        <li><a href="/bill_list" class="bill_off"></a></li>
        <li><a href="/report_list" class="report_off"></a></li>
        <li><a href="/user_info" class="information_off"></a></li>
        <li><a href="/user_modi_pwd" class="password_on"></a></li>
        <%--<li><a href="/index" class="index_on"></a></li>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 1}">--%>
                    <%--<li><a href="/role_list" class="role_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 2}">--%>
                    <%--<li><a href="/admin_list" class="admin_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 3}">--%>
                    <%--<li><a href="/cost/cost_list" class="fee_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 4}">--%>
                    <%--<li><a href="/account_list" class="account_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 5}">--%>
                    <%--<li><a href="/service_list" class="service_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 6}">--%>
                    <%--<li><a href="/bill_list" class="bill_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<c:forEach items="${sessionScope.admin.roles}" var="role">--%>
            <%--<c:forEach items="${role.modules}" var="module">--%>
                <%--<c:if test="${module.module_id eq 7}">--%>
                    <%--<li><a href="/report_list" class="report_off"></a></li>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</c:forEach>--%>
        <%--<li><a href="/user_info" class="information_off"></a></li>--%>
        <%--<li><a href="/user_modi_pwd" class="password_off"></a></li>--%>
    </ul>
</div>
</body>
</html>
