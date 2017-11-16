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
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
        function showResult() {
            var cbValue = "";
            $(":checkbox:checked").each(function () {
                cbValue += $(this).val() + ","
            });
            $.ajax({
                type: "get",
                url: "/admin/role_update",
                data: {
                    role_id: $("#role_id").val(),
                    name: $("#name").val(),
                    modules: cbValue
                },
                success: function (result) {
                    if (result.errorCode == 1){
                        $("#nameErr").html(result.map["nameErr"]);
                        $("#moduleErr").html(result.map["moduleErr"]);
                    }else {
                        showResultDiv(result.success);
                        window.setTimeout("showResultDiv(false);", 3000);
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
            location.href = "/admin/role_list";
        }
        function flush() {
            document.getElementById("save_result_info").style.display = "none";
            location.href = "/admin/role_list?"
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

        <%--<li><a href="/index" class="index_off"></a></li>--%>
        <%--<li><a href="/admin/role_list" class="role_off"></a></li>--%>
        <%--<li><a href="/admin/admin_list" class="admin_off"></a></li>--%>
        <%--<li><a href="/cost/cost_list" class="fee_off"></a></li>--%>
        <%--<li><a href="/account_list" class="account_off"></a></li>--%>
        <%--<li><a href="/service_list" class="service_off"></a></li>--%>
        <%--<li><a href="/bill_list" class="bill_off"></a></li>--%>
        <%--<li><a href="/report_list" class="report_off"></a></li>--%>
        <%--<li><a href="/user_info" class="information_off"></a></li>--%>
        <%--<li><a href="/user_modi_pwd" class="password_on"></a></li>--%>
        <li><a href="/index" class="index_off"></a></li>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 1}">
                    <li><a href="/admin/role_list" class="role_on"></a></li>
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
                    <li><a href="/service_list" class="service_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 6}">
                    <li><a href="/bill_list" class="bill_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 7}">
                    <li><a href="/report_list" class="report_off"></a></li>
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
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success">
        保存成功！
        <img src="/resource/images/close.png" onclick="flush()"/>
        </div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>角色名称：</span></div>
        <div class="input_info">
            <input id="role_id" type="hidden" value="${role.role_id}">
            <input id="name" type="text" class="width200" value="${role.name}"/>
            <span class="required">*</span>
            <div id="nameErr" class="validate_msg_medium error_msg"></div>
        </div>
        <div class="text_info clearfix"><span>设置权限：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 1}">
                                    checked
                                </c:if>
                            </c:forEach> value="1"/>管理员管理
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 2}">
                                    checked
                                </c:if>
                            </c:forEach> value="2"/>角色管理
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 3}">
                                    checked
                                </c:if>
                            </c:forEach> value="3"/>资费管理
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 4}">
                                    checked
                                </c:if>
                            </c:forEach> value="4"/>账务账号
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 5}">
                                    checked
                                </c:if>
                            </c:forEach> value="5"/>业务账号
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 6}">
                                    checked
                                </c:if>
                            </c:forEach> value="6"/>账单
                    </li>
                    <li><input type="checkbox"
                            <c:forEach items="${role.modules}" var="module">
                                <c:if test="${module.module_id eq 7}">
                                    checked
                                </c:if>
                            </c:forEach> value="7"/>报表
                    </li>
                </ul>
            </div>
            <span class="required">*</span>
            <div class="validate_msg_tiny" id="moduleErr"></div>
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
