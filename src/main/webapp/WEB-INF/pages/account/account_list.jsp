﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        //删除
        function deleteAccount(account_id) {
            var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
            if(r){
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/account/accountDelete",
                    data: {
                        account_id: account_id
                    },
                    success: function (result) {
                        var _html = $("#operate_result_info").html();
                        _html += result.message;
                        $("#operate_result_info").html(_html);
                        document.getElementById("operate_result_info").style.display = "block";
                        window.setTimeout('location.href = "/account/account_list?pageNum=' + ${pageBean.pageNum} + '"', 2000);
                    }
                });
            }
        }
        //开通或暂停
        function setState(status, account_id) {
            var r = "";
            if (status == 1) {
                r = window.confirm("确定要暂停此账务账号吗？");
            } else if (status == 2) {
                r = window.confirm("确定要开通此账务账号吗？");
            }
            if(r){
                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/account/accountSetState",
                    data: {
                        status: status,
                        account_id: account_id
                    },
                    success: function (result) {
                        var _html = $("#operate_result_info").html();
                        _html += result.message;
                        $("#operate_result_info").html(_html);
                        document.getElementById("operate_result_info").style.display = "block";
                        window.setTimeout('location.href = "/account/account_list?pageNum=' + ${pageBean.pageNum} + '"', 2000);
                    }
                });
            }
        }
        function flush(pageNum) {
            document.getElementById("operate_result_info").style.display = "none";
            location.href = "${pageContext.request.contextPath}/account/account_list?pageNum=" + pageNum + ""
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
                        <li><a href="${pageContext.request.contextPath}/account/account_list" class="account_on"></a></li>
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

    <!--查询-->
    <div class="search_add">
        <form action="${pageContext.request.contextPath}/account/account_list" method="post">
            <div>身份证：<input name="idcard_no" value="${idcard_no}" placeholder="请输入正确格式的身份证号码" type="text" class="text_search"/></div>
            <div>姓名：<input name="real_name" value="${real_name}" placeholder="姓名" type="text" class="width70 text_search"/></div>
            <div>登录名：<input name="login_name" value="${login_name}" placeholder="登录名" type="text" class="text_search"/></div>
            <div>
                状态：
                <select class="select_search" name="status">
                    <option <c:if test="${status eq -1}">selected</c:if> value="-1">全部</option>
                    <option <c:if test="${status eq 1}">selected</c:if> value="1">开通</option>
                    <option <c:if test="${status eq 2}">selected</c:if> value="2">暂停</option>
                    <option <c:if test="${status eq 3}">selected</c:if> value="3">删除</option>
                </select>
            </div>
            <div><input type="submit" value="搜索" class="btn_search"/></div>
        </form>
        <input type="button" value="增加" class="btn_add" onclick="location.href='/account/account_add';"/>
    </div>
    <!--删除等的操作提示-->
    <div id="operate_result_info" class="operate_success">
        <img src="${pageContext.request.contextPath}/resource/images/close.png" onclick="flush(${pageBean.pageNum})"/>

    </div>
    <!--数据区域：用表格展示数据-->
    <div id="data">
        <table id="datalist">
            <tr>
                <th>账号ID</th>
                <th>姓名</th>
                <th class="width150">身份证</th>
                <th>登录名</th>
                <th>状态</th>
                <th class="width100">创建日期</th>
                <th class="width150">上次登录时间</th>
                <th class="width200"></th>
            </tr>
            <c:forEach items="${pageBean.data}" var="account">
                <tr>
                    <td>${account.account_id}</td>
                    <td><a href="account_detail.jsp">${account.real_name}</a></td>
                    <td>${account.idcard_no}</td>
                    <td>${account.login_name}</td>
                    <td>
                        <c:if test="${account.status eq 1}">开通</c:if>
                        <c:if test="${account.status eq 2}">暂停</c:if>
                        <c:if test="${account.status eq 3}">删除</c:if>
                    </td>
                    <td>${account.create_date}</td>
                    <td>${account.last_login_time}</td>
                    <td class="td_modi">
                        <c:if test="${account.status ne 3}">
                            <input type="button"
                                   value="<c:if test="${account.status eq 1}">暂停</c:if><c:if test="${account.status eq 2}">开通</c:if>"
                                   class="btn_pause" onclick="setState(${account.status},${account.account_id});"/>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='${pageContext.request.contextPath}/account/account_modi?account_id=${account.account_id}';"/>
                            <input type="button" value="删除" class="btn_delete"
                                   onclick="deleteAccount(${account.account_id});"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <%--<p>业务说明：<br/>--%>
        <%--1、创建则开通，记载创建时间；<br/>--%>
        <%--2、暂停后，记载暂停时间；<br/>--%>
        <%--3、重新开通后，删除暂停时间；<br/>--%>
        <%--4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>--%>
        <%--5、暂停账务账号，同时暂停下属的所有业务账号；<br/>--%>
        <%--6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br/>--%>
        <%--7、删除账务账号，同时删除下属的所有业务账号。</p>--%>
    </div>
    <!--分页-->
    <div id="pages">

        <c:if test="${pageBean.pageNum>1}">
            <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${1}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}">首页</a>
            <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${pageBean.pageNum-1}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}">上一页</a>
        </c:if>
        <c:if test="${pageBean.totalPage<=5}">
            <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${i}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}"
                   <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
            </c:forEach>
        </c:if>
        <c:if test="${pageBean.totalPage>5}">
            <c:if test="${pageBean.pageNum <= 3}">
                <c:forEach var="i" begin="1" end="5">
                    <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${i}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                    <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${i}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${i}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
        </c:if>
        <c:if test="${pageBean.pageNum<pageBean.totalPage}">
            <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${pageBean.pageNum+1}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}">下一页</a>
            <a href="${pageContext.request.contextPath}/account/account_list?pageNum=${pageBean.totalPage}&idcard_no=${idcard_no}&real_name=${real_name}&login_name=${login_name}&status=${status}">尾页</a>
        </c:if>


    </div>

</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司 </p>
</div>
</body>
</html>
