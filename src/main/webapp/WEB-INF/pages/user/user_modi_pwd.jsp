<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global_color.css"/>
    <script src="${pageContext.request.contextPath}/resource/js/JQ3.2.1.js"></script>

    <script>
        function showResult() {

            var password = $("#password").val();
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            var boo = check(password, password1, password2);
            if (boo) {
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/admin/modi_pwd",
                    data: {
                        password: password,
                        password1: password1,
                        password2: password2
                    },
                    success: function (result) {
                        $("#save_result_info").html(result.message);
                        showResultDiv(true);
                        window.setTimeout('location.href="/index"', 2000);
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
            location.href = "${pageContext.request.contextPath}/index"
        }
        function checkPwd() {
            var pwd = $("#password").val();
            if (pwd.trim().length > 0) {
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/admin/checkPwd",
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
                $("#pwdErr").html("30长度的字母、数字和下划线")
                $("#pwdErr").css('display','block');
            }else {
                $("#pwdErr").css('display','none');
            }
            if (password1.trim().length == 0 || password1.trim().length > 30) {
                boo = false;
                $("#pwdErr1").html("30长度的字母、数字和下划线")
                $("#pwdErr1").css('display','block');
            }else {
                $("#pwdErr1").css('display','none');
            }
            if (password2.trim().length == 0 || password2.trim().length > 30) {
                boo = false;
                $("#pwdErr2").html("30长度的字母、数字和下划线")
                $("#pwdErr2").css('display','block');
            }else {
                $("#pwdErr2").css('display','none');
            }
            if (password1 != password2) {
                boo = false;
                $("#pwdErr2").html("* 两次输入的密码不一致")
                $("#pwdErr2").css('display','block');
            }else {
                $("#pwdErr2").css('display','none');
            }
            return boo;
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <img src="${pageContext.request.contextPath}/resource/images/logo.png" alt="logo" class="left"/>
    <a href="${pageContext.request.contextPath}/">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="${pageContext.request.contextPath}/index" class="index_off"></a></li>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 1}">
                    <c:if test="${empty a1}">
                        <li><a href="${pageContext.request.contextPath}/admin/role_list" class="role_off"></a></li>
                        <c:set var="a1" value="1"/>
                    </c:if>

                </c:if>
                <c:if test="${module.module_id eq 2}">
                    <c:if test="${empty b1}">
                        <li><a href="${pageContext.request.contextPath}/admin/admin_list" class="admin_off"></a></li>
                        <c:set var="b1" value="2"/>
                    </c:if>
                </c:if>
                <c:if test="${module.module_id eq 3}">
                    <c:if test="${empty c1}">
                        <li><a href="${pageContext.request.contextPath}/cost/cost_list" class="fee_off"></a></li>
                        <c:set var="c1" value="3"/>
                    </c:if>
                </c:if>
                <c:if test="${module.module_id eq 4}">
                    <c:if test="${empty d1}">
                        <li><a href="${pageContext.request.contextPath}/account/account_list" class="account_off"></a></li>
                        <c:set var="d1" value="4"/>
                    </c:if>
                </c:if>
                <c:if test="${module.module_id eq 5}">
                    <c:if test="${empty e1}">
                        <li><a href="${pageContext.request.contextPath}/account/service_list" class="service_off"></a></li>
                        <c:set var="e1" value="5"/>
                    </c:if>
                </c:if>
                <c:if test="${module.module_id eq 6}">
                    <c:if test="${empty f1}">
                        <li><a href="${pageContext.request.contextPath}/account/bill_list" class="bill_off"></a></li>
                        <c:set var="f1" value="6"/>
                    </c:if>
                </c:if>
                <c:if test="${module.module_id eq 7}">
                    <c:if test="${empty g1}">
                        <li><a href="${pageContext.request.contextPath}/account/report_list" class="report_off"></a></li>
                        <c:set var="g1" value="7"/>
                    </c:if>
                </c:if>
            </c:forEach>
        </c:forEach>
        <li><a href="${pageContext.request.contextPath}/user_info" class="information_off"></a></li>
        <li><a href="${pageContext.request.contextPath}/user_modi_pwd" class="password_on"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>旧密码：</span></div>
        <div class="input_info">
            <input onblur="checkPwd()" id="password" type="password" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr" style="display: none" class="validate_msg_short error_msg"></div>
        </div>
        <div class="text_info clearfix"><span>新密码：</span></div>
        <div class="input_info">
            <input id="password1" type="password" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr1" style="display: none" class="validate_msg_short error_msg"></div>
        </div>
        <div class="text_info clearfix"><span>重复新密码：</span></div>
        <div class="input_info">
            <input id="password2" type="password" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="pwdErr2" style="display: none" class="validate_msg_short error_msg"></div>
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
