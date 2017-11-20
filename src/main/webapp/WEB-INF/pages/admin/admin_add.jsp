<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css"/>
    <script src="/resource/js/JQ3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
        function showResult() {
            var cbValue = "";
            $(":checkbox:checked").each(function () {
                cbValue += $(this).val() + ","
            });

            $.ajax({
                type: "get",
                url: "/admin/adminAdd",
                data: {
                    admin_code: $("#admin_code").val(),
                    password: $("#password").val(),
                    password1: $("#password1").val(),
                    name: $("#name").val(),
                    telephone: $("#telephone").val(),
                    email: $("#email").val(),
                    cbValue: cbValue
                },
                success: function (result) {
                    if (result.errorCode == 1) {
                        $("#nameErr").html(result.map["name"]);
                        $("#codeErr").html(result.map["admin_code"]);
                        $("#codeErr").html(result.map["admin_codeErr"]);
                        $("#passErr").html(result.map["password"]);
                        $("#repassErr").html(result.map["password1"]);
                        $("#repassErr").html(result.map["passErr"]);
                        $("#telErr").html(result.map["telephone"]);
                        $("#emailErr").html(result.map["email"]);
                        $("#moduleErr").html(result.map["cbValue"]);
                    } else {
                        showResultDiv(result.success);
                        window.setTimeout("showResultDiv(false);", 3000);
                    }
                }
            });

        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }

        function rollback() {
            location.href = "/admin/admin_list";
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
                <c:if test="${module.module_id eq 2}">
                    <li><a href="/admin/admin_list" class="admin_on"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 3}">
                    <li><a href="/cost/cost_list" class="fee_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 4}">
                    <li><a href="/account/account_list" class="account_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 5}">
                    <li><a href="/account/service_list" class="service_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 6}">
                    <li><a href="/account/bill_list" class="bill_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 7}">
                    <li><a href="/account/report_list" class="report_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <li><a href="/user_info" class="information_off"></a></li>
        <li><a href="/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_success">保存成功！
        <img src="/resource/images/close.png" onclick="rollback()"/>
    </div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input id="name" type="text" placeholder="20长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="nameErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info">
            <input id="admin_code" type="text" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="codeErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input id="password" type="password" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="passErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input id="password1" type="password" placeholder="30长度的字母、数字和下划线"/>
            <%--<span class="required">*</span>--%>
            <div id="repassErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input id="telephone" type="text" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="telErr" class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input id="email" type="text" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="emailErr" class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach items="${roles}" var="role">
                        <li><input type="checkbox" value="${role.role_id}"/>${role.name}</li>
                    </c:forEach>
                </ul>
            </div>
            <%--<span class="required">*</span>--%>
            <div id="moduleErr" class="validate_msg_tiny"></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="rollback()"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
