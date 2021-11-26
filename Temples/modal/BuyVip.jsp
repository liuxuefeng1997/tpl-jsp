<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal fade" id="b-vip" tabindex="-1" aria-labelledby="b-vip-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="b-vip-label">购买VIP</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center" id="vip-button-list">
                    <div class="spinner-border text-primary" id="b-v-load" role="status">
                        <span class="visually-hidden">加载中...</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="vip-buy-close" data-bs-toggle="modal" data-bs-target="#v-tip">取消购买</button>
                <button type="button" class="btn btn-primary" id="vip-buy-check">检查订单</button>
            </div>
        </div>
        <script>
            iu.http.res("POST","<%=Api_Url_Users_Vip_List%>",true,null,null,function (e){
                if(e.status !== 500){
                    sessionStorage.removeItem("order_id");
                    let json = JSON.parse(e.responseText);
                    let array = json.data.vip;
                    let button = '<button class="btn btn-outline-dark" onclick="chooseVip(' + "'{{id}}'" + ')">{{type}}<br><span style="font-size: 14px;color: red;">{{price}}</span></button>';
                    let flag = true;
                    for (let x in array){
                        if(document.getElementById("b-v-load")){
                            document.getElementById("b-v-load").remove();
                        }
                        let data = array[x];
                        document.getElementById("vip-button-list").innerHTML += button.replace("{{id}}",data.id)
                            .replace("{{type}}",data.type).replace("{{price}}","￥" + (data.value / 100).toFixed(2));
                        flag = false
                    }
                    if(flag){
                        document.getElementById("vip-button-list").innerHTML = "可购买项目为空";
                        document.getElementById("vip-buy-check").remove();
                        document.getElementById("vip-buy-close").removeAttribute("data-bs-toggle");
                        document.getElementById("vip-buy-close").removeAttribute("data-bs-target");
                        document.getElementById("vip-buy-close").innerHTML = "关闭"
                        document.getElementById("vip-buy-close").onclick = function (){
                            window.location.href = window.location.href + "";
                        }
                    }
                }
            });
            function chooseVip(id){
                iu.http.res("POST","<%=Api_Url_Users_Vip_Buy%>",true,JSON.stringify({
                    id: parseInt(id)
                }),[
                    {
                        "name": "content-type",
                        "value": "application/json;charset=UTF-8"
                    },
                    {
                        "name": "Authorization",
                        "value": localStorage.getItem("token")
                    }
                ],function (e){
                    if(e.status !== 500){
                        let json = JSON.parse(e.responseText);
                        if(json.code === 0){
                            if(document.getElementById("wx_vip_pay_qr")){
                                document.getElementById("wx_vip_pay_qr").remove();
                            }
                            let qr_svg = iu.QRCode.generate(json.data.pay_url,200,"resources/images/default/wxpay.jpg",50);
                            qr_svg.id = "wx_vip_pay_qr";
                            document.getElementById("vip-button-list").appendChild(qr_svg);
                            sessionStorage.setItem("order_id",json.data.order_id);
                            document.getElementById("wx_vip_pay_qr").setAttribute("style","margin-top: 0.5em;");
                        }else if(json.code === 401){
                            document.getElementById("buyBox-text").innerHTML = "需要登录才能购买！";
                            if(document.getElementById("vip-buy-check")){document.getElementById("vip-buy-check").remove();}
                        }
                    }
                });
            }
            document.getElementById("vip-buy-check").onclick = function (){
                iu.http.res("POST","<%=Api_Url_Users_Buy_Check%>",true,JSON.stringify({
                    order_id: parseInt(sessionStorage.getItem("order_id"))
                }),[
                    {
                        "name": "content-type",
                        "value": "application/json;charset=UTF-8"
                    },
                    {
                        "name": "Authorization",
                        "value": localStorage.getItem("token")
                    }
                ],function (e){
                    if(e.status !== 500){
                        let json = JSON.parse(e.responseText);
                        if(json.data.is_payed){
                            document.getElementById("vip-button-list").innerHTML = "支付成功";
                            document.getElementById("vip-buy-check").remove();
                            sessionStorage.removeItem("order_id");
                            document.getElementById("vip-buy-close").removeAttribute("data-bs-toggle");
                            document.getElementById("vip-buy-close").removeAttribute("data-bs-target");
                            document.getElementById("vip-buy-close").innerHTML = "关闭"
                            document.getElementById("vip-buy-close").onclick = function (){
                                window.location.href = window.location.href + "";
                            }
                            return null;
                        }else {
                            document.getElementById("vip-buy-check").innerHTML = "您还未支付！";
                            setTimeout(function (){
                                document.getElementById("vip-buy-check").innerHTML = "检查订单";
                            },3000)
                        }
                    }
                });
            }
        </script>
    </div>
</div>
