﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>云科技</title>
        <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css" />
        <script src="/resource/js/JQ3.2.1.js"></script>
        <script language="javascript" type="text/javascript">
            //删除
            function deleteAccount() {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //开通或暂停
            function setState() {
                var r = window.confirm("确定要开通此账务账号吗？");
                document.getElementById("operate_result_info").style.display = "block";
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
                            <li><a href="/account_list" class="account_on"></a></li>
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
            <form action="" method="">
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input type="text" value="不验证" class="text_search" /></div>                            
                    <div>姓名：<input type="text" class="width70 text_search" value="不验证" /></div>
                    <div>登录名：<input type="text"  value="不验证" class="text_search"" /></div>
                    <div>
                        状态：
                        <select class="select_search">
                            <option>全部</option>
                            <option>开通</option>
                            <option>暂停</option>
                            <option>删除</option>
                        </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='account_add.jsp';" />
                </div>  
                <!--删除等的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="/resource/images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功，且已删除其下属的业务账号！
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
                    <tr>
                        <td>1</td>
                        <td><a href="account_detail.jsp">贾强</a></td>
                        <td>230102197902137862</td>
                        <td>jiaqiang</td>
                        <td>开通</td>
                        <td>2013-01-23</td>
                        <td>2013-02-23 00:00:00</td>                            
                        <td class="td_modi">
                            <input type="button" value="暂停" class="btn_pause" onclick="setState();" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="account_detail.jsp">贾强</a></td>
                        <td>230102197902137862</td>
                        <td>jiaqiang</td>
                        <td>暂停</td>
                        <td>2013-01-23</td>
                        <td>2013-02-23 00:00:00</td>                            
                        <td class="td_modi">
                            <input type="button" value="开通" class="btn_start" onclick="setState();" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="account_detail.jsp">贾强</a></td>
                        <td>230102197902137862</td>
                        <td>jiaqiang</td>
                        <td>删除</td>
                        <td>2013-01-23</td>
                        <td>2013-02-23 00:00:00</td>                            
                        <td class="td_modi">
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><a href="account_detail.jsp">贾强</a></td>
                        <td>230102197902137862</td>
                        <td>jiaqiang</td>
                        <td>开通</td>
                        <td>2013-01-23</td>
                        <td>2013-02-23 00:00:00</td>                            
                        <td class="td_modi">
                            <input type="button" value="暂停" class="btn_pause" onclick="setState();" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><a href="account_detail.jsp">贾强</a></td>
                        <td>230102197902137862</td>
                        <td>jiaqiang</td>
                        <td>暂停</td>
                        <td>2013-01-23</td>
                        <td>2013-02-23 00:00:00</td>                            
                        <td class="td_modi">
                            <input type="button" value="开通" class="btn_start" onclick="setState();" />
                            <input type="button" value="修改" class="btn_modify" onclick="location.href='account_modi.jsp';" />
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAccount();" />
                        </td>
                    </tr>                    
                </table>
                <p>业务说明：<br />
                1、创建则开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、暂停账务账号，同时暂停下属的所有业务账号；<br />                
                6、暂停后重新开通账务账号，并不同时开启下属的所有业务账号，需要在业务账号管理中单独开启；<br />
                7、删除账务账号，同时删除下属的所有业务账号。</p>
                </div>                   
                <!--分页-->
                <div id="pages">
                    <a href="#">首页</a>
        	        <a href="#">上一页</a>
                    <a href="#" class="current_page">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">下一页</a>
                    <a href="#">末页</a>
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
