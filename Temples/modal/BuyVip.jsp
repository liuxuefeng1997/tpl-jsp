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
            </div>
            <div class="modal-body">
                <div class="container-fluid text-center" id="vip-button-list">
                    <div class="spinner-border text-primary" id="b-v-load" role="status">
                        <span class="visually-hidden">加载中...</span>
                    </div>
                </div>
                <div class="container-fluid text-center overflow-hidden" id="vip-qrcode"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="vip-buy-close" data-bs-toggle="modal" data-bs-target="#v-tip">取消购买</button>
                <button type="button" class="btn btn-primary" id="vip-buy-check">检查订单</button>
            </div>
        </div>
        <script>
            iu.http.res("POST","<%=Api_Url_Users_Vip_List%>",true,null,null,function (e){
                if(e.status !== 500){
                    let button = '<button class="btn btn-outline-dark me-2" onclick="chooseVip(' + "'{{id}}'" + ')">{{type}}<br><span style="font-size: 14px;color: red;">{{price}}</span></button>';
                    let flag = true;
                    let {vip:array} = JSON.parse(e.responseText).data;
                    for (let data of array){
                        if(document.getElementById("b-v-load")){
                            document.getElementById("b-v-load").remove();
                        }
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
                    }else {
                        document.getElementById("vip-buy-close").onclick = function (){
                            document.getElementById("vip-qrcode").innerHTML = "";
                            document.getElementById("vip-qrcode").removeAttribute("order_id");
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
                        let {code,data} = JSON.parse(e.responseText);
                        if(code === 0){
                            let {pay_url,order_id} = data;
                            document.getElementById("vip-qrcode").innerHTML = "";
                            let qr_svg = iu.QRCode.generate(pay_url,200,"resources/images/default/wxpay.jpg",50);
                            qr_svg.id = "wx_vip_pay_qr";
                            document.getElementById("vip-qrcode").appendChild(qr_svg);
                            document.getElementById("vip-qrcode").setAttribute("order_id",order_id);
                            document.getElementById("wx_vip_pay_qr").setAttribute("style","margin-top: 0.5em;");
                        }else if(code === 401){
                            document.getElementById("vip-button-list").innerHTML = "需要登录才能购买！";
                            if(document.getElementById("vip-buy-check")){document.getElementById("vip-buy-check").remove();}
                        }
                    }
                });
            }
            document.getElementById("vip-buy-check").onclick = function (){
                if(!document.getElementById("vip-qrcode").getAttribute("order_id")){
                    document.getElementById("vip-buy-check").innerHTML = "请先选择一个类型！";
                    setTimeout(function (){
                        document.getElementById("vip-buy-check").innerHTML = "检查订单";
                    },3000)
                    return null;
                }
                iu.http.res("POST","<%=Api_Url_Users_Buy_Check%>",true,JSON.stringify({
                    order_id: parseInt(document.getElementById("vip-qrcode").getAttribute("order_id"))
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
                        let {is_payed} = JSON.parse(e.responseText).data;
                        if(is_payed){
                            document.getElementById("vip-button-list").innerHTML = "支付成功";
                            document.getElementById("vip-buy-check").remove();
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
