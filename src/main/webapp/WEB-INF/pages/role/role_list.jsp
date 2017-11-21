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
        function deleteRole(role_id) {
            var r = window.confirm("确定要删除此角色吗？");
            if (r){
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/admin/role_delete",
                    data:{
                        role_id:role_id
                    },
                    success:function (result) {
                        var _html = $("#operate_result_info").html();
                        _html += result.message
                        $("#operate_result_info").html(_html);
                        document.getElementById("operate_result_info").style.display = "block";
                        window.setTimeout('location.href = "/admin/role_list?pageNum=' + ${pageBean.pageNum} + '"', 2000);
                    }
                })
            }


        }
        function flush(pageNum) {
            document.getElementById("operate_result_info").style.display = "none";
            location.href = "${pageContext.request.contextPath}/admin/role_list?pageNum=" + pageNum + ""
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
                        <li><a href="${pageContext.request.contextPath}/admin/role_list" class="role_on"></a></li>
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
        <li><a href="${pageContext.request.contextPath}/user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/admin/role_add';"/>
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="${pageContext.request.contextPath}/resource/images/close.png" onclick="flush(${pageBean.pageNum})"/>
        </div> <!--删除错误！该角色被使用，不能删除。-->
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>角色 ID</th>
                    <th>角色名称</th>
                    <th class="width600">拥有的权限</th>
                    <th class="td_modi"></th>
                </tr>
                <c:forEach items="${pageBean.data}" var="role">
                    <tr>
                        <td>${role.role_id}</td>
                        <td>${role.name}</td>
                        <td>
                            <c:forEach items="${role.modules}" var="module" varStatus="status">
                                <c:choose>
                                    <c:when test="${status.count eq fn:length(role.modules)}">
                                        ${module.name}
                                    </c:when>
                                    <c:otherwise>
                                        ${module.name}、
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </td>
                        <td>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='/admin/role_modi?role_id=${role.role_id}&pageNum=${pageBean.pageNum}';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteRole(${role.role_id});"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--分页-->
        <div id="pages">
            <c:if test="${pageBean.pageNum>1}">
                <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${1}">首页</a>
                <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${pageBean.pageNum-1}">上一页</a>
            </c:if>
            <c:if test="${pageBean.totalPage<=5}">
                <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${i}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.totalPage>5}">
                <c:if test="${pageBean.pageNum <= 3}">
                    <c:forEach var="i" begin="1" end="5">
                        <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                    <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                        <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                    <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${pageBean.pageNum+1}">下一页</a>
                <a href="${pageContext.request.contextPath}/admin/role_list?pageNum=${pageBean.totalPage}">尾页</a>
            </c:if>
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
