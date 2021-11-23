<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/22
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="v-login" tabindex="-1" aria-labelledby="v-login-label" data-bs-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="v-login-label">登录/注册</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="v-login-form">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="v-phone">手机</span>
                        <input type="number" class="form-control" id="v-login-ph" name="vi_phone" placeholder="Phone" aria-label="Phone" aria-describedby="v-phone">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="v-code">验证码</span>
                        <input type="text" class="form-control" id="v-login-c" name="vi_code" placeholder="Code" aria-label="Code" aria-describedby="v-code">
                        <button type="button" class="btn btn-outline-dark" id="sendCode">发送</button>
                        <script>
                            let popover = {
                                element: null,
                                code: null,
                                timer: null,
                                tFlag: null
                            };
                            let tip = null;
                            function onC(){
                                if(!check(1)){
                                    document.getElementById("sendCode").onclick = function (){
                                        document.getElementById("sendCode").onclick = null;
                                        onC();
                                    }
                                    return null;
                                }
                                //发起POST请求
                                iu.http.res("POST","<%=Api_Url_Users_SMS_Send%>",false,JSON.stringify({
                                    phone: document.forms.namedItem("v-login-form").vi_phone.value
                                }),[
                                    {
                                        "name": "content-type",
                                        "value": "application/json;charset=UTF-8"
                                    }
                                ],function (e){
                                    if(e.status !== 500){
                                        popover.code = JSON.parse(e.responseText).code;
                                    }else {
                                        popover.code = e.status;
                                    }
                                    popover.code === 0 ? v_tip("sendCode","验证码发送成功") : v_tip("sendCode","验证码发送失败",null,function (){
                                        document.getElementById("sendCode").onclick = function (){
                                            document.getElementById("sendCode").onclick = null;
                                            onC();
                                        }
                                    })
                                    if(popover.code !== 0){
                                        popover.timer = 3;
                                        setTimeout(timer,1000);
                                    }else {
                                        popover.timer = 60;
                                        setTimeout(timer,1000);
                                    }
                                });
                            }
                            document.getElementById("sendCode").onclick = function (){
                                document.getElementById("sendCode").onclick = null;
                                onC();
                            }
                            function timer(){
                                if(popover.timer <= 0){
                                    clearTimeout(popover.tFlag);
                                    document.getElementById("sendCode").innerHTML = "发送";
                                    document.getElementById("sendCode").onclick = function (){
                                        document.getElementById("sendCode").onclick = null;
                                        onC();
                                    }
                                    return null;
                                }
                                document.getElementById("sendCode").innerHTML = "发送 (" + popover.timer + ")";
                                popover.timer--;
                                popover.tFlag = setTimeout(timer,1000);
                            }
                        </script>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="v-l-b">登录</button>
                <script>
                    document.getElementById("v-l-b").onclick = function (){
                        //数据验证
                        if(!check()){return null;}
                        //请求部分
                        iu.http.res("POST","<%=Api_Url_Users_SMS_Login%>",false,JSON.stringify({
                            phone: document.forms.namedItem("v-login-form").vi_phone.value.toString(),
                            code: document.forms.namedItem("v-login-form").vi_code.value.toString()
                        }),[
                            {
                                "name": "content-type",
                                "value": "application/json;charset=UTF-8"
                            }
                        ],function (e){
                            if(e.status !== 500){
                                let res_data = JSON.parse(e.responseText);
                                if(res_data.code === 201 || res_data.code === 202){
                                    v_tip("sendCode",res_data.message,5);
                                }else if (res_data.code === 0){
                                    localStorage.setItem("token",res_data.data.token);
                                    //window.location.href = window.location.href + "";
                                }else {
                                    v_tip("v-l-b","登录失败 (" + e.responseText + ")",8);
                                }
                            }else {
                                v_tip("v-l-b","登录失败：服务器返回 (" + e.status + "|" + e.responseText + ")",8);
                            }
                        });
                    }
                </script>
            </div>
        </div>
    </div>
</div>
<script>
    function v_tip(id,tip_text,delay_sec,addon_func){
        let n = new bootstrap.Popover(document.getElementById(id), {
            animation: true,
            container: "body",
            content: tip_text,
            placement: "right",
            trigger: "manual",
            sanitize: true
        });
        n.show();
        setTimeout(function (){
            n.hide();
            if(typeof addon_func === "function"){
                addon_func();
            }
        },(delay_sec ? delay_sec : 3) * 1000);
    }
    function check(i){
        let flag = true;
        if(i){
            if(document.forms.namedItem("v-login-form").vi_phone.value.trim() === ""){
                v_tip("v-login-ph","请输入手机号");
                flag = false;
            }else if(document.forms.namedItem("v-login-form").vi_phone.value.length !== 11){
                v_tip("v-login-ph","请输入正确的手机号");
                flag = false;
            }
        }else {
            if(document.forms.namedItem("v-login-form").vi_phone.value.trim() === ""){
                v_tip("v-login-ph","请输入手机号");
                flag = false;
            }else if(document.forms.namedItem("v-login-form").vi_phone.value.length !== 11){
                v_tip("v-login-ph","请输入正确的手机号");
                flag = false;
            }
            if(document.forms.namedItem("v-login-form").vi_code.value.trim() === ""){
                v_tip("sendCode","请输入验证码");
                flag = false;
            }else if(document.forms.namedItem("v-login-form").vi_code.value.length !== 6){
                v_tip("sendCode","验证码不正确，请检查后再试",5);
                flag = false;
            }
        }
        return flag;
    }
</script>
<style>
    /* chrome */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    /* 火狐浏览器 */
    input[type="number"]{
        -moz-appearance: textfield;
    }
</style>
