<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>云科技</title>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="/resource/styles/global_color.css"/>
    <script src="/resource/js/JQ3.2.1.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if ($.trim($('#telephone').val()).length == 0) {
                $("#telErr").html('手机号没有输入\n');
                $('#idcard_no').focus();
            } else {
                if(isPhoneNo($.trim($('#telephone').val()) == false)) {
                    $("#telErr").html('手机号码不正确\n');
                    $('#telephone').focus();
                }
            }
            function isPhoneNo(phone) {
                var pattern = /^1[34578]\d{9}$/;
                return pattern.test(phone);
            }
            // 验证身份证
            if($.trim($('#idcard_no').val()).length == 0) {
                $("#incard_noErr").html("身份证号码没有输入")
                $('#idcard_no').focus();
            }

            $("#idcard_no").blur(function () {
                var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                var iIdNo = $("#idcard_no").val();
                iIdNo = $.trim(iIdNo);
                if (iIdNo.length > 0) {
                    if (pattern.test(iIdNo)) {
                        $("#incard_noErr").html("")
                    }else {
                        $("#incard_noErr").html("身份证格式不正确")
                    }
                }else {
                    $("#incard_noErr").html("")
                }
            });

            $("#re_idcard").blur(function () {
                var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
                var iIdNo = $("#re_idcard").val();
                iIdNo = $.trim(iIdNo);
                if (iIdNo.length > 0) {
                    var tmpStr = "";
                    var birthday = $("#birthdate");
                    if (pattern.test(iIdNo)) {
                        if (iIdNo.length == 15) {
                            tmpStr = iIdNo.substring(6, 12);
                            tmpStr = "19" + tmpStr;
                            tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);
                            birthday.val(tmpStr);
                        } else {
                            tmpStr = iIdNo.substring(6, 14);
                            tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6);
                            birthday.val(tmpStr);
                        }
                        $("#re_idcardErr").html("")
                    } else {
                        $("#re_idcardErr").html("身份证格式不正确")
                        birthday.val("");
                    }
                } else {
                    $("#birthdate").val("");
                    $("#re_idcardErr").html("")
                }


            })
        })
        ;
        //保存成功的提示信息
        function showResult() {
            $.ajax({
                type: "get",
                url: "/account/accountAdd",
                data: {
                    real_name: $("#real_name").val(),
                    idcard_no: $("#idcard_no").val(),
                    login_name: $("#login_name").val(),
                    login_passwd: $("#login_passwd").val(),
                    login_passwd1: $("#login_passwd1").val(),
                    telephone: $("#tel").val(),
                    re_idcard: $("#re_idcard").val(),
                    birthdate: $("#birthdate").val(),
                    email: $("#email").val(),
                    occupation: $("#select").val(),
                    gender: $(":input:radio:checked").val(),
                    mailaddress: $("#mailaddress").val(),
                    zipcode: $("#zipcode").val(),
                    qq: $("#qq").val()
                },
                success: function (result) {
                    $("#save_result_info").val(result.message)
                    showResultDiv(result.success);
                    window.setTimeout("showResultDiv(false);", 3000);
                }
            });
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";

        }
        //显示选填的信息项
        function showOptionalInfo(imgObj) {
            var div = document.getElementById("optionalInfo");
            if (div.className == "hide") {
                div.className = "show";
                imgObj.src = "/resource/images/hide.png";
            }
            else {
                div.className = "hide";
                imgObj.src = "/resource/images/show.png";
            }
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
        <c:forEach items="${applicationScope.admin.roles}" var="role">
            <c:forEach items="${role.modules}" var="module">
                <c:if test="${module.module_id eq 1}">
                    <li><a href="/admin/role_list" class="role_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 2}">
                    <li><a href="/admin/admin_list" class="admin_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 3}">
                    <li><a href="/cost/cost_list" class="fee_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 4}">
                    <li><a href="/account/account_list" class="account_on"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 5}">
                    <li><a href="/account/service_list" class="service_off"></a></li>
                </c:if>
                <c:if test="${module.module_id eq 6}">
                    <li><a href="/account/bill_list" class="bill_off"></a></li>
                </c:if>
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
    <!--保存成功或者失败的提示消息-->
    <div id="save_result_info" class="save_fail"></div>
    <form action="" method="" class="main_form">
        <!--必填项-->
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input id="real_name" type="text" placeholder="20长度以内的汉字、字母和数字的组合"/>
            <%--<span class="required">*</span>--%>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input id="idcard_no" type="text"/>
            <%--<span class="required">*</span>--%>
            <div id="incard_noErr" class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>登录账号：</span></div>
        <div class="input_info">
            <input id="login_name" type="text" placeholder="30长度以内的字母、数字和下划线的组合"/>
            <%--<span class="required">*</span>--%>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input id="login_passwd" type="password" placeholder="30长度以内的字母、数字和下划线的组合"/>
            <%--<span class="required">*</span>--%>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input id="login_passwd1" type="password" placeholder="30长度以内的字母、数字和下划线的组合"/>
            <%--<span class="required">*</span>--%>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>手机：</span></div>
        <div class="input_info">
            <input id="tel" type="text" class="width200"/>
            <%--<span class="required">*</span>--%>
            <div id="telErr" class="validate_msg_medium"></div>
        </div>
        <!--可选项-->
        <div class="text_info clearfix"><span>可选项：</span></div>
        <div class="input_info">
            <img src="/resource/images/show.png" alt="展开" onclick="showOptionalInfo(this);"/>
        </div>
        <div id="optionalInfo" class="hide">
            <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
            <div class="input_info">
                <input id="re_idcard" type="text"/>
                <div id="re_idcardErr" class="validate_msg_long"></div>
            </div>
            <div class="text_info clearfix"><span>生日：</span></div>
            <div class="input_info">
                <input id="birthdate" type="text" value="" readonly class="readonly"/>
            </div>
            <div class="text_info clearfix"><span>Email：</span></div>
            <div class="input_info">
                <input id="email" type="text" class="width350"/>
                <div class="validate_msg_tiny"></div>
            </div>
            <div class="text_info clearfix"><span>职业：</span></div>
            <div class="input_info">
                <select id="select">
                    <option value="干部">干部</option>
                    <option value="学生">学生</option>
                    <option value="技术人员">技术人员</option>
                    <option value="其他">其他</option>
                </select>
            </div>
            <div class="text_info clearfix"><span>性别：</span></div>
            <div class="input_info fee_type">
                <input type="radio" name="radSex" checked="checked" id="female" value="女"/>
                <label for="female">女</label>
                <input type="radio" name="radSex" id="male" value="男"/>
                <label for="male">男</label>
            </div>
            <div class="text_info clearfix"><span>通信地址：</span></div>
            <div class="input_info">
                <input id="mailaddress" type="text" class="width350" placeholder="50长度以内"/>
                <div class="validate_msg_tiny"></div>
            </div>
            <div class="text_info clearfix"><span>邮编：</span></div>
            <div class="input_info">
                <input id="zipcode" type="text"/>
                <div class="validate_msg_long"></div>
            </div>
            <div class="text_info clearfix"><span>QQ：</span></div>
            <div class="input_info">
                <input id="qq" type="text"/>
                <div class="validate_msg_long"></div>
            </div>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" onclick="showResult();"/>
            <input type="button" value="取消" class="btn_save"/>
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
