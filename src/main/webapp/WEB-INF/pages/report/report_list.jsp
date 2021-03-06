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
        <script language="javascript" type="text/javascript">
            function changeTab(e,ulObj) {                
                var obj = e.srcElement || e.target;
                if (obj.nodeName == "A") {
                    var links = ulObj.getElementsByTagName("a");
                    for (var i = 0; i < links.length; i++) {
                        if (links[i].innerHTML == obj.innerHTML) {
                            links[i].className = "tab_on";
                        }
                        else {
                            links[i].className = "tab_out";
                        }
                    }
                }
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
                                <li><a href="${pageContext.request.contextPath}/account/report_list" class="report_on"></a></li>
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
        <div id="report_main">
        	<div class="tabs">
    	        <ul onclick="changeTab(event,this);">
        	        <li><a href="#####" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a href="#####" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                    <li><a href="#####" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
                </ul>
            </div>            
            <div class="report_box">
                <!--数据区域：用表格展示数据-->
                <div id="report_data">
                    <table id="datalist">
                        <tr>                            
                            <th>账号 ID</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th>电话</th>
                            <th class="width150">月份</th>
                            <th class="width150">累积时长</th>
                        </tr>
                        <c:forEach items="${pageBean.data}" var="bill_code">


                        <tr>
                            <td>${bill_code.bill_id}</td>
                            <td>${bill_code.account.login_name}</td>
                            <td>${bill_code.account.real_name}</td>
                            <td>${bill_code.account.idcard_no}</td>
                            <td>${bill_code.account.telephone}</td>
                            <td>${bill_code.bill.bill_month}</td>
                            <td>${bill_code.bill_month}</td>
                        </tr>
                        </c:forEach>

                    </table>
                    <table id="datalist1" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th class="width150">累积时长</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>106小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.20</td>
                            <td>tony</td>
                            <td>米奇</td>
                            <td>220222020202020202</td>
                            <td>96小时32分</td>
                        </tr><tr>
                            <td>192.168.0.20</td>
                            <td>jecy</td>
                            <td>米妮</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>mary</td>
                            <td>贾强</td>
                            <td>220222020202020202</td>
                            <td>16小时32分</td>
                        </tr>
                    </table>
                    <table id="datalist2" style="display:none;">
                        <tr>                            
                            <th class="width300">Unix 服务器IP</th>
                            <th>包月</th>
                            <th>套餐</th>
                            <th>计时</th>
                        </tr>                      
                        <tr>
                            <td>192.168.0.20</td>
                            <td>345</td>
                            <td>21</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>192.168.0.23</td>
                            <td>32</td>
                            <td>221</td>
                            <td>314</td>
                        </tr>                        
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
                    <c:if test="${pageBean.pageNum>1}">
                        <a href="/account/report_list?pageNum=${1}">首页</a>
                        <a href="/account/report_list?pageNum=${pageBean.pageNum-1}">上一页</a>
                    </c:if>
                    <c:if test="${pageBean.totalPage<=5}">
                        <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                            <a href="/account/report_list?pageNum=${i}"
                               <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageBean.totalPage>5}">
                        <c:if test="${pageBean.pageNum <= 3}">
                            <c:forEach var="i" begin="1" end="5">
                                <a href="/account/report_list?pageNum=${i}"
                                   <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum <= pageBean.totalPage -3}">
                            <c:forEach var="i" begin="${pageBean.pageNum-2}" end="${pageBean.pageNum+2}">
                                <a href="/account/report_list?pageNum=${i}"
                                   <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageBean.pageNum > 3 and pageBean.pageNum > pageBean.totalPage-3}">
                            <c:forEach var="i" begin="${pageBean.totalPage-4}" end="${pageBean.totalPage}">
                                <a href="/account/report_list?pageNum=${i}"
                                   <c:if test="${pageBean.pageNum == i}">class="current_page"</c:if> >${i}</a>
                            </c:forEach>
                        </c:if>
                    </c:if>
                    <c:if test="${pageBean.pageNum<pageBean.totalPage}">
                        <a href="/account/report_list?pageNum=${pageBean.pageNum+1}">下一页</a>
                        <a href="/account/report_list?pageNum=${pageBean.totalPage}">尾页</a>
                    </c:if>
                </div>

            </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)云科技有限公司 </p>
        </div>
    </body>
</html>
