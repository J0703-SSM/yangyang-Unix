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
<div class="login_box">
    <form id="form1" action="/loginAdmin" method="post">
        <table>
            <tr>
                <td class="login_info">账号：</td>
                <td colspan="2"><input id="admin_code" name="admin_code" type="text" class="width150"/></td>
                <td class="login_error_info"><span id="nameErr" class="required">${nameErr.defaultMessage}</span></td>
            </tr>
            <tr>
                <td class="login_info">密码：</td>
                <td colspan="2"><input id="password" name="password" type="password" class="width150"/></td>
                <td><span id="passwordErr" class="required">${passwordErr.defaultMessage}</span></td>
            </tr>
            <tr>
                <td class="login_info">验证码：</td>
                <td class="width70"><input id="code" name="code" type="text" class="width70"/></td>
                <td><img src="/getVerifyCode" alt="验证码" title="点击更换" id="verifyCodeImage"/></td>
                <td><span id="codeErr" class="required">${codeErr}</span></td>
            </tr>
            <tr>
                <td></td>
                <td class="login_button" colspan="2">
                    <a href="javascript:document:form1.submit()"><img src="/resource/images/login_btn.png"/></a>
                </td>
                <td><span id="userErr" class="required">${userErr}</span></td>
            </tr>
        </table>
    </form>
</div>
<script>

    $("#admin_code").blur(function () {
        if ($("#admin_code").val().trim().length > 0){
            $.ajax({
                type: "post",
                url: "/checkadmin",
                data: {
                    admin_code: $("#admin_code").val()
                },
                success: function (result) {
                    $("#nameErr").text(result.message)
                }
            })
        }
    });

    $("#verifyCodeImage").click(function () {
        $("#verifyCodeImage").attr('src', '/getVerifyCode?timestamp=' + genTimestamp());
    });

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

</script>
</body>
</html>
