<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        //显示角色详细信息
        function showDetail(flag, a) {
            var detailDiv = a.parentNode.getElementsByTagName("div")[0];
            if (flag) {
                detailDiv.style.display = "block";
            }
            else
                detailDiv.style.display = "none";
        }
        //重置密码
        function resetPwd() {
            if ($(":checkbox:checked").length == 0) {
                alert("请至少选择一条数据！");
            } else {
                var cbValue = "";
                $(":checkbox:checked").each(function () {
                    cbValue += $(this).val() + ","
                })
                $.ajax({
                    type: "get",
                    url: "/admin/admin_resetPwd",
                    data: {
                        cbValue: cbValue
                    },
                    success: function (result) {
                        if (result.message.length > 0) {
                            $("#result_info").html(result.message);
                            document.getElementById("operate_result_info").style.display = "block";
                        }
                    }
                })
            }
        }
        //删除
        function deleteAdmin(admin_id) {
            var r = window.confirm("确定要删除此管理员吗？");
            if (r){
                $.ajax({
                    type: "get",
                    url: "/admin/admin_delete",
                    data: {
                        admin_id: admin_id
                    },
                    success: function (result) {
                        $("#result_info").html(result.message);
                        document.getElementById("operate_result_info").style.display = "block";
                    }

                });
            }
        }
        //全选
        function selectAdmins(inputObj) {
            var inputArray = document.getElementById("datalist").getElementsByTagName("input");
            for (var i = 1; i < inputArray.length; i++) {
                if (inputArray[i].type == "checkbox") {
                    inputArray[i].checked = inputObj.checked;
                }
            }
        }
        function flush() {
            location.href = "/admin/admin_list"
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

    <!--查询-->
    <div class="search_add">
        <form action="/admin/admin_list" method="post">
            <div>
                模块：
                <select name="module_id" id="selModules" class="select_search">
                    <option value="-1">全部</option>
                    <c:forEach items="${modules}" var="module">
                        <option
                                <c:if test="${module_id eq module.module_id}">selected</c:if> value="${module.module_id}">${module.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div>角色：<input name="role_name" type="text" value="${role_name}" class="text_search width200"
                           placeholder="请输入角色名称"/></div>
            <div><input type="submit" value="搜索" class="btn_search"/></div>
        </form>
        <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();"/>
        <input type="button" value="增加" class="btn_add" onclick="location.href='/admin/admin_add';"/>
    </div>
    <!--删除和密码重置的操作提示-->
    <div id="operate_result_info" class="operate_fail">
        <img src="/resource/images/close.png" onclick="flush()"/>
        <span id="result_info"></span><!--密码重置失败！数据并发错误。-->
    </div>
    <!--数据区域：用表格展示数据-->
    <div id="data">
        <table id="datalist">
            <tr>
                <th class="th_select_all">
                    <input value="-1" type="checkbox" onclick="selectAdmins(this);"/>
                    <span>全选</span>
                </th>
                <th>管理员ID</th>
                <th>姓名</th>
                <th>登录名</th>
                <th>电话</th>
                <th>电子邮件</th>
                <th>授权日期</th>
                <th class="width100">拥有角色</th>
                <th></th>
            </tr>
            <c:forEach items="${pageBean.data}" var="admin">
                <tr>
                    <td><input value="${admin.admin_id}" type="checkbox"/></td>
                    <td>${admin.admin_id}</td>
                    <td>${admin.name}</td>
                    <td>${admin.admin_code}</td>
                    <td>${admin.telephone}</td>
                    <td>${admin.email}</td>
                    <td>${admin.enrolldate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(admin.roles)>1}">
                                <a class="summary" onmouseover="showDetail(true,this);"
                                   onmouseout="showDetail(false,this);">
                                    <c:forEach items="${admin.roles}" var="role" varStatus="status">
                                        <c:if test="${status.count == 1}">
                                            ${role.name}
                                        </c:if>
                                    </c:forEach>...</a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
                                    <c:forEach items="${admin.roles}" var="role" varStatus="status">
                                        <c:choose>
                                            <c:when test="${status.count eq fn:length(admin.roles)}">
                                                ${role.name}
                                            </c:when>
                                            <c:otherwise>
                                                ${role.name}、
                                            </c:otherwise>
                                        </c:choose>

                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${admin.roles}" var="role">
                                    ${role.name}
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td class="td_modi">
                        <input type="button" value="修改" class="btn_modify"
                               onclick="location.href='/admin/admin_modi?admin_id=${admin.admin_id}';"/>
                        <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(${admin.admin_id});"/>
                    </td>
                </tr>
            </c:forEach>


        </table>
    </div>

    <!--分页-->
    <div id="pages">

            <c:if test="${pageBean.pageNum>1}">
                <a href="/admin/admin_list?pageNum=${1}&&module_id=${module_id}&&role_name=${role_name}">首页</a>
                <a href="/admin/admin_list?pageNum=${pageBean.pageNum-1}&module_id=${module_id}&role_name=${role_name}">上一页</a>
            </c:if>
            <c:if test="${pageBean.totalPage<=5}">
                <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                    <a href="/admin/admin_list?pageNum=${i}&module_id=${module_id}&role_name=${role_name}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.totalPage>5}">
                <c:if test="${pageBean.pageNum <= 3}">
                    <c:forEach var="i" begin="1" end="5">
                        <a href="/admin/admin_list?pageNum=${i}&module_id=${module_id}&role_name=${role_name}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                    <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                        <a href="/admin/admin_list?pageNum=${i}&module_id=${module_id}&role_name=${role_name}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                    <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                        <a href="/admin/admin_list?pageNum=${i}&module_id=${module_id}&role_name=${role_name}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                <a href="/admin/admin_list?pageNum=${pageBean.pageNum+1}&module_id=${module_id}&role_name=${role_name}">下一页</a>
                <a href="/admin/admin_list?pageNum=${pageBean.totalPage}&module_id=${module_id}&role_name=${role_name}">尾页</a>
            </c:if>

    </div>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
