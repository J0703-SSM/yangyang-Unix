﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global.css"/>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/resource/styles/global_color.css"/>
        <script src="${pageContext.request.contextPath}/resource/js/JQ3.2.1.js"></script>
    </head>
    <body onload="initialYearAndMonth();">
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
                                <li><a href="${pageContext.request.contextPath}/account/bill_list" class="bill_on"></a></li>
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
                    <div>账务账号：<span class="readonly width70">admin1</span></div>                            
                    <div>OS 账号：<span class="readonly width100">openlab1</span></div>
                    <div>服务器 IP：<span class="readonly width100">192.168.0.20</span></div>
                    <div>计费时间：<span class="readonly width70">2013年8月</span></div>
                    <div>费用：<span class="readonly width70">34.78</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="location.href='bill_item.jsp';" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width150">客户登录 IP</th>
                            <th class="width150">登入时刻</th>
                            <th class="width150">登出时刻</th>
                            <th class="width100">时长（秒）</th>
                            <th class="width150">费用</th>
                            <th>资费</th>
                        </tr>
                        <tr>
                            <td>192.168.100.100</td>
                            <td>2013/01/01 12:12:12</td>
                            <td>2013/01/01 12:12:22</td>
                            <td>10</td>
                            <td>0</td>
                            <td>包 20 小时</td>
                        </tr>
                        <tr>
                            <td>192.168.100.100</td>
                            <td>2013/01/01 12:12:12</td>
                            <td>2013/01/01 12:12:22</td>
                            <td>10</td>
                            <td>0</td>
                            <td>包 20 小时</td>
                        </tr>
                        <tr>
                            <td>192.168.100.100</td>
                            <td>2013/01/01 12:12:12</td>
                            <td>2013/01/01 12:12:22</td>
                            <td>10</td>
                            <td>0</td>
                            <td>包 20 小时</td>
                        </tr>
                        <tr>
                            <td>192.168.100.100</td>
                            <td>2013/01/01 12:12:12</td>
                            <td>2013/01/01 12:12:22</td>
                            <td>10</td>
                            <td>0.45</td>
                            <td>包 20 小时</td>
                        </tr>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
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
