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
        //保存结果的提示
        function showResult() {
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/cost/costAdd",
                data: {
                    name: $("#name").val(),
                    cost_type: $("input:radio:checked").val(),
                    base_duration: $("#base_duration").val(),
                    base_cost: $("#base_cost").val(),
                    unit_cost: $("#unit_cost").val(),
                    descr: $("#descr").val()
                },
                success: function (result) {
                    if (result.errorCode == 1) {
                        if (result.map["name"] != null){
                            $("#nameErr").css('display','block');
                        }else {
                            $("#nameErr").css('display','none');
                        }
                        if (result.map["base_duration"] != null){
                            $("#base_durationErr").css('display','block');
                        }else {
                            $("#base_durationErr").css('display','none');
                        }
                        if (result.map["base_cost"] != null){
                            $("#base_costErr").css('display','block');
                        }else {
                            $("#base_costErr").css('display','none');
                        }
                        if (result.map["unit_cost"] != null){
                            $("#unit_costErr").css('display','block');
                        }else {
                            $("#unit_costErr").css('display','none');
                        }
                        if (result.map["descr"] != null){
                            $("#descrErr").css('display','block');
                        }else {
                            $("#descrErr").css('display','none');
                        }
                    } else {
                        showResultDiv(true);
                        $("#save_result_info").html(result.message);
                        if (result.errorCode != 2) {
                            window.setTimeout('location.href="/cost/cost_list"', 2000);
                        }
                    }
                }
            })
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag) {
                divResult.style.display = "block";
            } else {
                divResult.style.display = "none";
            }
        }

        //切换资费类型
        function feeTypeChange(type) {
            var inputArray = document.getElementById("main").getElementsByTagName("input");
            if (type == 1) {
                inputArray[4].readOnly = true;
                inputArray[4].value = "";
                inputArray[4].className += " readonly";
                inputArray[5].readOnly = false;
                inputArray[5].className = "width100";
                inputArray[6].readOnly = true;
                inputArray[6].className += " readonly";
                inputArray[6].value = "";
            }
            else if (type == 2) {
                inputArray[4].readOnly = false;
                inputArray[4].className = "width100";
                inputArray[5].readOnly = false;
                inputArray[5].className = "width100";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
            }
            else if (type == 3) {
                inputArray[4].readOnly = true;
                inputArray[4].value = "";
                inputArray[4].className += " readonly";
                inputArray[5].readOnly = true;
                inputArray[5].value = "";
                inputArray[5].className += " readonly";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
            }
        }
        function rollback() {
            location.href = "/cost/cost_list";
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
    <div id="save_result_info" class="save_fail"></div>
    <form id="add_cost" action="${pageContext.request.contextPath}/addCost" method="post" class="main_form">
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info">
            <input type="text" id="name" class="width300"/>
            <%--<span class="required">*</span>--%>
            <div id="nameErr" style="display: none" class="validate_msg_short error_msg">50长度的字母、数字、汉字和下划线的组合</div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="radFeeType" value="1" id="monthly" onclick="feeTypeChange(1);"/>
            <label for="monthly">包月</label>
            <input type="radio" name="radFeeType" value="2" checked="checked" id="package" onclick="feeTypeChange(2);"/>
            <label for="package">套餐</label>
            <input type="radio" name="radFeeType" value="3" id="timeBased" onclick="feeTypeChange(3);"/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input type="text" id="base_duration" class="width100" placeholder="1-600之间的整数"/>
            <span class="info">小时</span>
            <%--<span class="required">*</span>--%>
            <div id="base_durationErr" style="display: none" class="validate_msg_short error_msg">1-600之间的整数</div>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input type="text" id="base_cost" class="width100" placeholder="0-99999.99之间的数值"/>
            <span class="info">元</span>
            <%--<span class="required">*</span>--%>
            <div id="base_costErr" style="display: none" class="validate_msg_short error_msg">0-99999.99之间的数值</div>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input type="text" id="unit_cost" class="width100" placeholder="0-99999.99之间的数值"/>
            <span class="info">元/小时</span>
            <%--<span class="required">*</span>--%>
            <div id="unit_costErr" style="display: none" class="validate_msg_long error_msg">0-99999.99之间的数值</div>
        </div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea id="descr" class="width300 height70"></textarea>
            <div id="descrErr" style="display: none" class="validate_msg_short error_msg">100长度的字母、数字、汉字和下划线的组合</div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save" onclick="rollback()"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)云科技有限公司 </span>
</div>
</body>
</html>
