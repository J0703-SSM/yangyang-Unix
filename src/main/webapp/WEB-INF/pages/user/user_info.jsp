﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css" />
        <script src="/resource/js/JQ3.2.1.js"></script>
        <script language="javascript" type="text/javascript">
            //保存成功的提示信息
            function showResult() {
                $.ajax({
                    type:"get",
                    url:"/admin/modi_user_info",
                    data:{
                        admin_id:$("#admin_id").val(),
                        name:$("#name").val(),
                        telephone:$("#telephone").val(),
                        email:$("#email").val()
                    },
                    success:function (result) {
                        if (result.errorCode == 1){
                          $("#nameErr").html(result.map["name"]);
                           $("#telErr").html(result.map["telephone"]);
                           $("#emailErr").html(result.map["email"]);
                        }else {
                            $("#save_result_info").html(result.message);
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
                location.href="/index";
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
                <li><a href="/user_info" class="information_on"></a></li>
                <li><a href="/user_modi_pwd" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success"></div>
            <form action="" method="" class="main_form">
                <div class="text_info clearfix"><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${applicationScope.admin.admin_code}" /></div>
                <div class="text_info clearfix"><span>角色：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width400" value="<c:forEach items="${applicationScope.admin.roles}" var="role">${role.name}、</c:forEach>" />
                </div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input id="admin_id" type="hidden" value="${applicationScope.admin.admin_id}">
                    <input id="name" type="text" value="${applicationScope.admin.name}" />
                    <span class="required">*</span>
                    <div id="nameErr" class="validate_msg_long error_msg"></div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input id="telephone" type="text" class="width200" value="${applicationScope.admin.telephone}" />
                    <div id="telErr" class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input id="email" type="text" class="width200" value="${applicationScope.admin.email}" />
                    <div id="emailErr" class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${applicationScope.admin.enrolldate}"/></div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="showResult();" />
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
