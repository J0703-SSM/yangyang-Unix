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
        //写入下拉框中的年份和月份
        function initialYearAndMonth() {
            //写入最近3年
            var yearObj = document.getElementById("selYears");
            var year = (new Date()).getFullYear();
            for (var i = 0; i <= 2; i++) {
                var opObj = new Option(year - i, year - i);
                yearObj.options[i] = opObj;
            }
            //写入 12 月
            var monthObj = document.getElementById("selMonths");
            var opObj = new Option("全部", "全部");
            monthObj.options[0] = opObj;
            for (var i = 1; i <= 12; i++) {
                var opObj = new Option(i, i);
                monthObj.options[i] = opObj;
            }
        }
    </script>
</head>
<body onload="initialYearAndMonth();">
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
                    <li><a href="/account/service_list" class="service_off"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 6}">
                    <li><a href="/account/bill_list" class="bill_on"></a></li>
                </c:if>
            </c:forEach>
        </c:forEach>
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
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
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>身份证：<input type="text" value="" class="text_search"/></div>
            <div>账务账号：<input type="text" value="" class="width100 text_search"/></div>
            <div>姓名：<input type="text" value="" class="width70 text_search"/></div>
            <div>
                <select class="select_search" id="selYears">
                </select>
                年
                <select class="select_search" id="selMonths">
                </select>
                月
            </div>
            <div><input type="button" value="搜索" class="btn_search"/></div>
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="width50">账单ID</th>
                    <th class="width70">姓名</th>
                    <th class="width150">身份证</th>
                    <th class="width150">账务账号</th>
                    <th>费用</th>
                    <th class="width100">月份</th>
                    <th class="width100">支付方式</th>
                    <th class="width100">支付状态</th>
                    <th class="width50"></th>
                </tr>
                <c:forEach items="${pageBean.data}" var="bill">
                    <tr>
                        <td>${bill.bill_id}</td>
                        <td>${bill.account.real_name}</td>
                        <td>${bill.account.idcard_no}</td>
                        <td>${bill.account.login_name}</td>
                        <td>${bill.cost}</td>
                        <td>${bill.bill_month}</td>
                        <td>
                            <c:if test="${bill.payment_mode eq 1}">支付宝</c:if>
                            <c:if test="${bill.payment_mode eq 2}">现金</c:if>
                            <c:if test="${bill.payment_mode eq 3}">微信</c:if>
                        </td>
                        <td>
                            <c:if test="${bill.pay_state eq 1}">未支付</c:if>
                            <c:if test="${bill.pay_state eq 2}">已支付</c:if>
                        </td>
                        <td><a href="bill_item.jsp" title="账单明细">明细</a></td>
                    </tr>
                </c:forEach>

            </table>

            <%--<p>业务说明：<br/>--%>
                <%--1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br/>--%>
                <%--2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br/>--%>
                <%--3、年和月的数据由 js 代码自动生成；<br/>--%>
                <%--4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>--%>
        </div>
        <!--分页-->
        <div id="pages">
            <c:if test="${pageBean.pageNum>1}">
                <a href="/account/bill_list?pageNum=${1}">首页</a>
                <a href="/account/bill_list?pageNum=${pageBean.pageNum-1}">上一页</a>
            </c:if>
            <c:if test="${pageBean.totalPage<=5}">
                <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                    <a href="/account/bill_list?pageNum=${i}"
                       <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                </c:forEach>
            </c:if>
            <c:if test="${pageBean.totalPage>5}">
                <c:if test="${pageBean.pageNum <= 3}">
                    <c:forEach var="i" begin="1" end="5">
                        <a href="/account/bill_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                    <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                        <a href="/account/bill_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                    <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                        <a href="/account/bill_list?pageNum=${i}"
                           <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                <a href="/account/bill_list?pageNum=${pageBean.pageNum+1}">下一页</a>
                <a href="/account/bill_list?pageNum=${pageBean.totalPage}">尾页</a>
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
