﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        //排序按钮的点击事件
        function sort(btnObj, column) {
            if (btnObj.className == "sort_desc") {
                btnObj.className = "sort_asc";
                location.href = "${pageContext.request.contextPath}/cost/cost_order?sort=" + btnObj.className + "&column=" + column + ""
            }
            else {
                btnObj.className = "sort_desc";
                location.href = "${pageContext.request.contextPath}/cost/cost_order?sort=" + btnObj.className + "&column=" + column + ""
            }

        }

        //启用
        function startFee(cost_id) {
            var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
            if (r) {
                $.ajax({
                    type: "get",
                    url: "/cost/cost_start",
                    data: {
                        cost_id: cost_id
                    },
                    success: function (map) {
                        var _html = $("#operate_result_info").html();
                        _html += map["msg"];
                        $("#operate_result_info").html(_html);
                        document.getElementById("operate_result_info").style.display = "block";
                        window.setTimeout('location.href = "/cost/cost_list?pageNum=' + ${pageBean.pageNum} + '"', 2000);
                    }
                });
            }
        }
        //删除
        function deleteFee(cost_id) {
            var r = window.confirm("确定要删除此资费吗？");
            if (r) {
                $.ajax({
                    type: "get",
                    url: "/cost/cost_delete",
                    data: {
                        cost_id: cost_id
                    },
                    success: function (map) {
                        var _html = $("#operate_result_info").html();
                        _html += map["msg"];
                        $("#operate_result_info").html(_html);
                        document.getElementById("operate_result_info").style.display = "block";
                        window.setTimeout('location.href = "/cost/cost_list?pageNum=' + ${pageBean.pageNum} + '"', 2000);
                    }
                });
            }
        }
        //刷新
        function flush(pageNum) {
            document.getElementById("operate_result_info").style.display = "none";
            location.href = "/cost/cost_list?pageNum=" + pageNum + ""
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
                        <li><a href="${pageContext.request.contextPath}/cost/cost_list" class="fee_on"></a></li>
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
        <!--排序-->
        <div class="search_add">
            <div>
                <!--<input type="button" value="月租" class="sort_asc" onclick="sort(this);" />-->
                <input type="button" value="基费"
                       <c:if test="${cost_sort eq 'sort_asc'}">class="sort_asc"</c:if>
                       <c:if test="${cost_sort eq 'sort_desc'}">class="sort_desc"</c:if>
                       <c:if test="${empty cost_sort}">class="sort_asc"</c:if>
                       onclick="sort(this,'base_cost');"/>
                <input type="button" value="时长"
                       <c:if test="${date_sort eq 'sort_asc'}">class="sort_asc"</c:if>
                       <c:if test="${date_sort eq 'sort_desc'}">class="sort_desc"</c:if>
                       <c:if test="${empty date_sort}">class="sort_asc"</c:if> class="sort_asc"
                       onclick="sort(this,'base_duration');"/>
            </div>

            <input type="button" value="增加" class="btn_add" onclick="location.href='/cost/cost_add';"/>
        </div>
        <!--启用操作的操作提示-->
        <div id="operate_result_info" class="operate_success">
            <img src="${pageContext.request.contextPath}/resource/images/close.png" onclick="flush(${pageBean.pageNum})"/>
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>资费ID</th>
                    <th class="width100">资费名称</th>
                    <th>基本时长</th>
                    <th>基本费用</th>
                    <th>单位费用</th>
                    <th>创建时间</th>
                    <th>开通时间</th>
                    <th class="width50">状态</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${pageBean.data}" var="cost">
                    <tr>
                        <td>${cost.cost_id}</td>
                        <td><a href="cost_detail.jsp">${cost.name}</a></td>
                        <td>${cost.base_duration} 小时</td>
                        <td>${cost.base_cost} 元</td>
                        <td>${cost.unit_cost} 元/小时</td>
                        <td>${cost.creatime}</td>
                        <td>${cost.startime}</td>
                        <td>
                            <c:choose>
                                <c:when test="${cost.status eq 0}">暂停</c:when>
                                <c:otherwise>已开启</c:otherwise>
                            </c:choose>
                        </td>
                        <td>

                            <c:if test="${cost.status eq 0}">
                                <input type="button" value="启用" class="btn_start" onclick="startFee(${cost.cost_id});"/>
                                <input type="button" value="修改" class="btn_modify"
                                       onclick="location.href='${pageContext.request.contextPath}/cost/costmodi?cost_id=${cost.cost_id}&pageNum=${pageBean.pageNum}';"/>
                                <input type="button" value="删除" class="btn_delete"
                                       onclick="deleteFee(${cost.cost_id});"/>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
            </table>
            <%--<p>业务说明：<br/>--%>
            <%--1、创建资费时，状态为暂停，记载创建时间；<br/>--%>
            <%--2、暂停状态下，可修改，可删除；<br/>--%>
            <%--3、开通后，记载开通时间，且开通后不能修改、不能再停用、也不能删除；<br/>--%>
            <%--4、业务账号修改资费时，在下月底统一触发，修改其关联的资费ID（此触发动作由程序处理）--%>
            <%--</p>--%>
        </div>
        <!--分页-->
        <div id="pages">
            <c:if test="${empty column}">
                <c:if test="${pageBean.pageNum>1}">
                    <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${1}">首页</a>
                    <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${pageBean.pageNum-1}">上一页</a>
                </c:if>
                <c:if test="${pageBean.totalPage<=5}">
                    <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.totalPage>5}">
                    <c:if test="${pageBean.pageNum <= 3}">
                        <c:forEach var="i" begin="1" end="5">
                            <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${i}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                        <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                            <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${i}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                        <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                            <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${i}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${pageBean.pageNum+1}">下一页</a>
                    <a href="${pageContext.request.contextPath}/cost/cost_list?pageNum=${pageBean.totalPage}">尾页</a>
                </c:if>
            </c:if>

            <c:if test="${not empty column}">
                <c:if test="${pageBean.pageNum>1}">
                    <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${1}&sort=${sort}&column=${column}">首页</a>
                    <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${pageBean.pageNum-1}&sort=${sort}&column=${column}">上一页</a>
                </c:if>
                <c:if test="${pageBean.totalPage<=5}">
                    <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                        <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${i}&sort=${sort}&column=${column}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.totalPage>5}">
                    <c:if test="${pageBean.pageNum <= 3}">
                        <c:forEach var="i" begin="1" end="5">
                            <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${i}&sort=${sort}&column=${column}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                        <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                            <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${i}&sort=${sort}&column=${column}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                        <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                            <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${i}&sort=${sort}&column=${column}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                </c:if>
                <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                    <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${pageBean.pageNum+1}&sort=${sort}&column=${column}">下一页</a>
                    <a href="${pageContext.request.contextPath}/cost/cost_order?pageNum=${pageBean.totalPage}&sort=${sort}&column=${column}">尾页</a>
                </c:if>
            </c:if>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
    <p>版权所有(C)云科技有限公司</p>
</div>
</body>
</html>
