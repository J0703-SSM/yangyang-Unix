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
        //保存结果的提示
        function showResult() {
            $.ajax({
                type: "get",
                url: "/cost/updateCost",
                data: {
                    cost_id: $("#id1").val(),
                    name: $("#name").val(),
                    cost_type: $("input:radio:checked").val(),
                    base_duration: $("#base_duration").val(),
                    base_cost: $("#base_cost").val(),
                    unit_cost: $("#unit_cost").val(),
                    descr: $("#descr").val()
                },
                success: function (result) {
                    if (result.errorCode == 1){
                        $("#nameErr").html(result.map["name"].defaultMessage);
                        $("#base_durationErr").html(result.map["base_duration"]);
                        $("#base_costErr").html(result.map["base_cost"]);
                        $("#unit_costErr").html(result.map["unit_cost"]);
                        $("#descrErr").html(result.map["descr"].defaultMessage);
                    }else {
                        showResultDiv(result.success);
                        window.setTimeout("showResultDiv(false);", 3000);
                    }
                }
            })
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (!flag) {
                divResult.style.display = "block";
            } else {
                divResult.style.display = "none";
                location.href = "/cost/cost_list"
            }
        }

        //切换资费类型
        function feeTypeChange(type) {
            var inputArray = document.getElementById("main").getElementsByTagName("input");
            if (type == 1) {
                inputArray[5].readOnly = true;
                inputArray[5].value = "";
                inputArray[5].className += " readonly";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
                inputArray[7].readOnly = true;
                inputArray[7].className += " readonly";
                inputArray[7].value = "";
            }
            else if (type == 2) {
                inputArray[5].readOnly = false;
                inputArray[5].className = "width100";
                inputArray[6].readOnly = false;
                inputArray[6].className = "width100";
                inputArray[7].readOnly = false;
                inputArray[7].className = "width100";
            }
            else if (type == 3) {
                inputArray[5].readOnly = true;
                inputArray[5].value = "";
                inputArray[5].className += " readonly";
                inputArray[6].readOnly = true;
                inputArray[6].value = "";
                inputArray[6].className += " readonly";
                inputArray[7].readOnly = false;
                inputArray[7].className = "width100";
            }
        }
        function rollback() {
            location.href="/cost/cost_list";
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
        <li><a href="/admin/role_list" class="role_off"></a></li>
        <li><a href="/admin/admin_list" class="admin_off"></a></li>
        <li><a href="/cost/cost_list" class="fee_off"></a></li>
        <li><a href="/account_list" class="account_off"></a></li>
        <li><a href="/service_list" class="service_off"></a></li>
        <li><a href="/bill_list" class="bill_off"></a></li>
        <li><a href="/report_list" class="report_off"></a></li>
        <li><a href="/user_info" class="information_off"></a></li>
        <li><a href="/user_modi_pwd" class="password_on"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_success">保存失败，资费名称重复！</div>
    <form action="" method="" class="main_form">
        <div class="text_info clearfix"><span>资费ID：</span></div>
        <div class="input_info"><input id="id1" type="text" class="readonly" readonly value="${cost.cost_id}"/></div>
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info">
            <input id="name" type="text" class="width300" value="${cost.name}"/>
            <span class="required">*</span>
            <div id="nameErr" class="validate_msg_short"></div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">

            <input type="radio" name="radFeeType" id="monthly"
                   <c:if test="${cost.cost_type eq 1}">checked="checked"</c:if> value="1" onclick="feeTypeChange(1);"/>
            <label for="monthly">包月</label>
            <input type="radio" name="radFeeType" id="package"
                   <c:if test="${cost.cost_type eq 2}">checked="checked"</c:if> value="2" onclick="feeTypeChange(2);"/>
            <label for="package">套餐</label>
            <input type="radio" name="radFeeType" id="timeBased"
                   <c:if test="${cost.cost_type eq 3}">checked="checked"</c:if> value="3" onclick="feeTypeChange(3);"/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input id="base_duration" type="text" value="${cost.base_duration}" class="width100"/>
            <span class="info">小时</span>
            <span class="required">*</span>
            <div id="base_durationErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input id="base_cost" type="text" value="${cost.base_cost}" class="width100"/>
            <span class="info">元</span>
            <span class="required">*</span>
            <div id="base_costErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input id="unit_cost" type="text" value="${cost.unit_cost}" class="width100"/>
            <span class="info">元/小时</span>
            <span class="required">*</span>
            <div id="unit_costErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea id="descr" class="width300 height70">${cost.descr}</textarea>
            <div id="descrErr" class="validate_msg_short"></div>
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
