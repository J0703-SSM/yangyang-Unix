<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css"/>
    <script src="/resource/js/JQ3.2.1.js"></script>

    <script>
        function showResult() {

            var password = $("#password").val();
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            var boo = check(password, password1, password2);
            if (boo) {
                $.ajax({
                    type: "get",
                    url: "/admin/modi_pwd",
                    data: {
                        password: password,
                        password1: password1,
                        password2: password2
                    },
                    success: function (result) {
                        $("#save_result_info").html(result.message)
                        showResultDiv(true);
                        window.setTimeout("showResultDiv(false);", 3000);
                    }
                })
            }
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }

        function rollback() {
            location.href = "/index"
        }
        function checkPwd() {
            var pwd = $("#password").val();
            if (pwd.trim().length > 0) {
                $.ajax({
                    type: "get",
                    url: "/admin/checkPwd",
                    data: {
                        password: pwd
                    },
                    success: function (result) {
                        $("#pwdErr").html(result.message)
                        if (result.message.length > 0) {
                            $("#pwdErr").removeClass("validate_msg_medium");
                            $("#pwdErr").addClass("validate_msg_short error_msg");
                        }

                    }
                })
            }
        }
        function check(password, password1, password2) {
            var boo = true;
            if (password.trim().length == 0 || password.trim().length > 30) {
                boo = false;
                $("#pwdErr").removeClass("validate_msg_medium");
                $("#pwdErr").addClass("validate_msg_short error_msg");
                $("#pwdErr").html("* 30长度的字母、数字和下划线")
            }
            if (password1.trim().length == 0 || password1.trim().length > 30) {
                boo = false;
                $("#pwdErr1").removeClass("validate_msg_medium");
                $("#pwdErr1").addClass("validate_msg_short error_msg");
                $("#pwdErr1").html("* 30长度的字母、数字和下划线")
            }
            if (password2.trim().length == 0 || password2.trim().length > 30) {
                boo = false;
                $("#pwdErr2").removeClass("validate_msg_medium");
                $("#pwdErr2").addClass("validate_msg_short error_msg");
                $("#pwdErr2").html("* 30长度的字母、数字和下划线")
            }
            if (password1 != password2) {
                boo = false;
                $("#pwdErr2").removeClass("validate_msg_medium");
                $("#pwdErr2").addClass("validate_msg_short error_msg");
                $("#pwdErr2").html("* 两次输入的密码不一致")
            }
            return boo;
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="/resource/images/logo.png" alt="logo" class="left"/>
    <a href="/">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="/index" class="index_off"></a></li>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 1}">
                    <li><a href="/admin/role_list" class="role_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 2}">
                    <li><a href="/admin/admin_list" class="admin_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 3}">
                    <li><a href="/cost/cost_list" class="fee_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 4}">
                    <li><a href="/account/account_list" class="account_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 5}">
                    <li><a href="/account/service_list" class="service_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 6}">
                    <li><a href="/account/bill_list" class="bill_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 7}">
                    <li><a href="/account/report_list" class="report_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <li><a href="/user_info" class="information_off"></a></li>
        <li><a href="/user_modi_pwd" class="password_on"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>旧密码：</span></div>
        <div class="input_info">
            <input onblur="checkPwd()" id="password" type="password" class="width200" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr" class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>新密码：</span></div>
        <div class="input_info">
            <input id="password1" type="password" class="width200" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr1" class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>重复新密码：</span></div>
        <div class="input_info">
            <input id="password2" type="password" class="width200" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr2" class="validate_msg_medium"></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="rollback()"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司 </p>
</div>
</body>
</html>
