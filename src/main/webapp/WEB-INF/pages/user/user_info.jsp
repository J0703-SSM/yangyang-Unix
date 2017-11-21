<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global_color.css"/>
    <script src="${pageContext.request.contextPath}/resource/js/JQ3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        //保存成功的提示信息
        function showResult() {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/admin/modi_user_info",
                data: {
                    admin_id: $("#admin_id").val(),
                    name: $("#name").val(),
                    telephone: $("#telephone").val(),
                    email: $("#email").val()
                },
                success: function (result) {
                    if (result.errorCode == 1) {
                        if (result.map["name"] != null){
                            $("#nameErr").css('display','block');
                        }else {
                            $("#nameErr").css('display','none');
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
                    } else {
                        $("#save_result_info").html(result.message);
                        showResultDiv(result.success);
                        window.setTimeout('location.href="/index"', 2000);
                    }
                }
            })
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }
        function rollback() {
            location.href = "${pageContext.request.contextPath}/index";
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
        <li><a href="${pageContext.request.contextPath}/user_info" class="information_on"></a></li>
        <li><a href="${pageContext.request.contextPath}/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly"
                                       value="${applicationScope.admin.admin_code}"/></div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info">
            <input type="text" readonly="readonly" class="readonly width400"
                   value="<c:forEach items="${applicationScope.admin.roles}"
                   var="role" varStatus="status"><c:choose><c:when test="${status.count eq fn:length(applicationScope.admin.roles)}">${role.name}</c:when><c:otherwise>${role.name}、</c:otherwise></c:choose></c:forEach>"/>
        </div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input id="admin_id" type="hidden" value="${applicationScope.admin.admin_id}">
            <input id="name" type="text" value="${applicationScope.admin.name}"/>
            <%--<span class="required">*</span>--%>
            <div id="nameErr" style="display: none" class="validate_msg_short error_msg">20长度以内的汉字、字母的组合</div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input id="telephone" type="text" class="width200" value="${applicationScope.admin.telephone}"/>
            <div id="telErr" style="display: none" class="validate_msg_short error_msg">电话号码格式不正确</div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input id="email" type="text" class="width200" value="${applicationScope.admin.email}"/>
            <div id="emailErr" style="display: none" class="validate_msg_short error_msg">50长度以内，符合 email 格式</div>
        </div>
        <div class="text_info clearfix"><span>创建时间：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly"
                                       value="${applicationScope.admin.enrolldate}"/></div>
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
