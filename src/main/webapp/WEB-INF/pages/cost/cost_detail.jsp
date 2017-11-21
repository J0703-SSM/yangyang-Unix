<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <form action="" method="" class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="1" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="包 20 小时"/></div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                    <select class="readonly" disabled>
                        <option>开通</option>
                        <option>暂停</option>
                        <option>删除</option>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radFeeType" id="monthly" disabled="disabled" />
                    <label for="monthly">包月</label>
                    <input type="radio" name="radFeeType" id="package" disabled="disabled" />
                    <label for="package">套餐</label>
                    <input type="radio" name="radFeeType" checked="checked" id="timeBased" disabled="disabled" />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" class="readonly" readonly value="20"  />
                    <span>小时</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly value="24.5" />
                    <span>元</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly value="3.00" />
                    <span>元/小时</span>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly value="2013/1/1 00:00:00" /></div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly value="2013/1/1 00:00:00" /></div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>包 20 小时，20 小时以内 24.5 元，超出部分 3.00 元/小时</textarea>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='cost_list.jsp';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
            <br />
            <span>版权所有(C)云科技有限公司 </span>
        </div>
    </body>
</html>
