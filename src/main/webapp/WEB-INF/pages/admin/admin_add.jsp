<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global_color.css"/>
    <script src="${pageContext.request.contextPath}/resource/js/JQ3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
        function showResult() {
            var cbValue = "";
            $(":checkbox:checked").each(function () {
                cbValue += $(this).val() + ","
            });

            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/admin/adminAdd",
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
                        if (result.map["name"] != null){
                            $("#nameErr").css('display','block');
                        }else {
                            $("#nameErr").css('display','none');
                        }
                        if (result.map["admin_code"] != null){
                            $("#codeErr").css('display','block');
                        }else {
                            $("#codeErr").css('display','none');
                        }
                        if (result.map["admin_codeErr"] != null){
                            $("#codeErr").css('display','block');
                            $("#codeErr").html(result.map["admin_codeErr"])
                        }else {
                            $("#codeErr").css('display','none');
                            $("#codeErr").html("30长度以内的字母、数字和下划线的组合")
                        }
                        if (result.map["password"] != null){
                            $("#passErr").css('display','block');
                        }else {
                            $("#passErr").css('display','none');
                        }
                        if (result.map["passErr"] != null){
                            $("#repassErr").css('display','block');
                        }else {
                            $("#repassErr").css('display','none');
                        }
                        if (result.map["telephone"] != null){
                            $("#telErr").css('display','block');
                        }else {
                            $("#telErr").css('display','none');
                        }
                        if (result.map["email"] != null){
                            $("#emailErr").css('display','block');
                        }else {
                            $("#emailErr").css('display','none');
                        }
                        if (result.map["cbValue"] != null){
                            $("#moduleErr").css('display','block');
                        }else {
                            $("#moduleErr").css('display','none');
                        }
                    } else {
                        showResultDiv(result.success);
                        window.setTimeout('location.href="/admin/admin_list"', 2000);
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
            location.href = "${pageContext.request.contextPath}/admin/admin_list";
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
                        <li><a href="${pageContext.request.contextPath}/admin/admin_list" class="admin_on"></a></li>
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
        <li><a href="${pageContext.request.contextPath}/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_success">保存成功！
        <img src="${pageContext.request.contextPath}/resource/images/close.png" onclick="rollback()"/>
    </div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input id="name" type="text"/>
            <%--<span class="required">*</span>--%>
            <div id="nameErr" style="display: none" class="validate_msg_long error_msg">20长度以内的汉字、字母、数字的组合</div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info">
            <input id="admin_code" type="text"/>
            <%--<span class="required">*</span>--%>
            <div id="codeErr" style="display: none" class="validate_msg_long error_msg">30长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input id="password" type="password"/>
            <%--<span class="required">*</span>--%>
            <div id="passErr" style="display: none" class="validate_msg_long error_msg">30长度以内的字母、数字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input id="password1" type="password"/>
            <%--<span class="required">*</span>--%>
            <div id="repassErr" style="display: none" class="validate_msg_long error_msg">两次密码必须相同</div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input id="telephone" type="text" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="telErr" style="display: none" class="validate_msg_medium error_msg">正确的电话号码格式：手机或固话</div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input id="email" type="text" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="emailErr" style="display: none" class="validate_msg_medium error_msg">50长度以内，正确的 email 格式</div>
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
            <div id="moduleErr" style="display: none" class="validate_msg_tiny error_msg">至少选择一个</div>
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
