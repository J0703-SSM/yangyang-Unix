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
        //删除
        function deleteAccount() {
            var r = window.confirm("确定要删除此业务账号吗？删除后将不能恢复。");
            document.getElementById("operate_result_info").style.display = "block";
        }
        //开通或暂停
        function setState() {
            var r = window.confirm("确定要开通此业务账号吗？");
            document.getElementById("operate_result_info").style.display = "block";
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
                        <li><a href="${pageContext.request.contextPath}/account/service_list" class="service_on"></a></li>
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
            <div>OS 账号：<input type="text" value="" class="width100 text_search"/></div>
            <div>服务器 IP：<input type="text" value="" class="width100 text_search"/></div>
            <div>身份证：<input type="text" value="" class="text_search"/></div>
            <div>状态：
                <select class="select_search">
                    <option>全部</option>
                    <option>开通</option>
                    <option>暂停</option>
                    <option>删除</option>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search"/></div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='/account/service_add';"/>
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="${pageContext.request.contextPath}/resource/images/close.png" onclick="this.parentNode.style.display='none';"/>
            删除成功！
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="width50">业务ID</th>
                    <th class="width70">账务账号ID</th>
                    <th class="width150">身份证</th>
                    <th class="width70">姓名</th>
                    <th>OS 账号</th>
                    <th class="width50">状态</th>
                    <th class="width100">服务器 IP</th>
                    <th class="width100">资费</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${pageBean.data}" var="service">

                    <tr>
                        <td><a href="service_detail.jsp" title="查看明细">${service.service_id}</a></td>
                        <td>${service.account_id}</td>
                        <td>${service.account.idcard_no}</td>
                        <td>${service.account.real_name}</td>
                        <td>${service.os_username}</td>
                        <td>
                            <c:if test="${service.status eq 1}">开通</c:if>
                            <c:if test="${service.status eq 2}">暂停</c:if>
                            <c:if test="${service.status eq 3}">删除</c:if>

                        </td>
                        <td>${service.unix_host}</td>
                        <td>
                            <a class="summary" onmouseover="showDetail(true,this);"
                               onmouseout="showDetail(false,this);">${service.cost.name}</a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                                ${service.cost.descr}
                            </div>
                        </td>
                        <td class="td_modi">
                            <c:if test="${service.status ne 3}">

                            <input type="button" value="<c:if test="${service.status eq 2}">开通</c:if><c:if test="${service.status eq 1}">暂停</c:if>" class="btn_pause" onclick="setState();"/>
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='service_modi.jsp';"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();"/>
                            </c:if>
                        </td>
                    </tr>

                </c:forEach>

            </table>
            <%--<p>业务说明：<br/>--%>
                <%--1、创建即开通，记载创建时间；<br/>--%>
                <%--2、暂停后，记载暂停时间；<br/>--%>
                <%--3、重新开通后，删除暂停时间；<br/>--%>
                <%--4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br/>--%>
                <%--5、业务账号不设计修改密码功能，由用户自服务功能实现；<br/>--%>
                <%--6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>--%>
        </div>
        <!--分页-->
        <div id="pages">

            <c:if test="${pageBean.pageNum>1}">
                <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${1}">首页</a>
                <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${pageBean.pageNum-1}">上一页</a>
            </c:if>
            <c:if test="${pageBean.totalPage<=5}">
                <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${i}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.totalPage>5}">
                <c:if test="${pageBean.pageNum <= 3}">
                    <c:forEach var="i" begin="1" end="5">
                        <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                    <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                        <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                    <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${pageBean.pageNum+1}">下一页</a>
                <a href="${pageContext.request.contextPath}/account/service_list?pageNum=${pageBean.totalPage}">尾页</a>
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
