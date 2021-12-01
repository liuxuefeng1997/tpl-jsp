<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/30
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%--id="product-buy"--%>
<%@ include file="../modal/BuyBox.jsp" %>
<% JsonObject _data = JSONReaderX.getJsonObj(HTTPLoaderX.getResponses("POST",Api_Url_Product_Detail,"id=" + _aid,Api_Url_Host)).getJsonObject("data"); %>
<form id="buy_info" name="buy_info">
    <style>
        #buy_info .input-group {
            width: calc(100% - 200px);
        }
        #buy_info .input-group-text {
            padding: 15px 60px 15px 0;
            background-color: #FFF;
            border: 1px solid #FFF;
            font-size: 18px;
        }
        #buy_info .form-control {
            border-radius: 5px;
        }
        #buy_info textarea {
            resize: none;
            height: 148px;
        }
        #buy_info .table>:not(caption)>*>* {
            font-size: 18px;
            padding: 23px 0;
        }
        #chkBox .tip-text {
            font-size: 10px;
            color: red;
        }
        #chkBox .price-text {
            height: 38px;
            line-height: 38px;
        }
        #chkBox .price-text span {
            margin-left: 20px;
            color: red;
        }
        #chkBox .btn {
            padding: .375rem 50px;
            margin-left: 5px;
        }
        .i-img {
            width: 120px;
            height: 120px;
            background: url("<%=_data.getString("head_pic")%>") no-repeat center center;
            background-size: 100% auto;
            overflow: hidden;
        }
        .i-title {
            font-weight: 600;
        }
        .i-subtitle {
            font-weight: 400;
            margin-top: 5px;
        }
        .i-type {
            height: 120px;
            line-height: 120px;
        }
        .i-price {
            color: red;
            height: 120px;
            line-height: 120px;
        }
    </style>
    <div class="container-fluid">
        <table class="table">
            <thead>
                <tr>
                    <td>商品信息</td>
                </tr>
            </thead>
        </table>
        <div class="row">
            <div class="col-2">
                <div class="i-img"></div>
            </div>
            <div class="col-4">
                <div class="w-100 overflow-hidden i-title"><%=_data.getString("title")%></div>
                <div class="w-100 overflow-hidden i-subtitle"><%=_data.getString("subtitle")%></div>
            </div>
            <div class="col-4">
                <div class="w-100 text-center i-type">默认版本</div>
            </div>
            <div class="col-2">
                <div class="w-100 i-price">￥ <%=(_data.getInt("price") / 100.00) + ""%></div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <td>购买人（公司）信息</td>
                </tr>
            </thead>
        </table>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="Domain">授权域名</span>
            <input type="text" class="form-control" placeholder="请输入授权域名" id="b_domain" aria-label="Domain" name="domain" aria-describedby="Domain">
        </div>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="PayType">授权类型</span>
            <input type="text" class="form-control" placeholder="个人/公司" id="b_type" aria-label="PayType" name="pay_type" aria-describedby="PayType">
        </div>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="PayName">购买人<span class="us-none opacity-0">占</span></span>
            <input type="text" class="form-control" placeholder="请输入联系人姓名" id="b_name" aria-label="PayName" name="pay_name" aria-describedby="PayName">
        </div>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="PayCompany">公司名称</span>
            <input type="text" class="form-control" placeholder="请输入公司名称" id="b_company" aria-label="PayCompany" name="pay_company" aria-describedby="PayCompany">
        </div>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="Phone_">联系电话</span>
            <input type="number" class="form-control" placeholder="请输入手机号" aria-label="Phone_" id="b_phone" name="phone" aria-describedby="Phone_">
        </div>
        <div class="input-group mt-3 mb-3">
            <span class="input-group-text" id="Address">联系地址</span>
            <input type="number" class="form-control" placeholder="请输入详细地址" aria-label="Address" id="b_address" name="address" aria-describedby="Address">
        </div>
        <div class="input-group">
            <span class="input-group-text">留言<span class="us-none opacity-0">占位</span></span>
            <textarea class="form-control" name="remark" aria-label="Remark" id="b_remark" placeholder="请输入留言（可选）"></textarea>
        </div>
    </div>
</form>
<div id="chkBox" class="container-fluid pb-3 position-relative">
    <hr>
    <div class="w-100 tip-text text-end mt-1 pb-2">确认订单后，信息不可修改，确认前请仔细核对</div>
    <div class="w-50 float-start">
        <div class="price-text">订单金额<span>￥ <%=(_data.getInt("price") / 100.00) + ""%></span></div>
    </div>
    <div class="w-50 float-start text-end">
        <button class="btn btn-secondary" onclick="window.open('./?r=<%=_route%>&aid=<%=_aid%>','_self')">取消订单</button>
        <button class="btn btn-primary" id="product-buy">确认订单</button>
    </div>
</div>
<script>
    function chk(form){
        //开始检查数据
        let chkFlag = true;
        if(!form.domain.value.trim()){
            v_tip("b_domain","请输入授权域名");
            chkFlag = false;
        }
        if(!form.pay_type.value.trim()){
            v_tip("b_type","请输入授权类型（公司或个人）");
            chkFlag = false;
        }
        if(!form.pay_name.value.trim()){
            v_tip("b_name","请输入购买人");
            chkFlag = false;
        }
        if(!form.pay_company.value.trim()){
            v_tip("b_company","请输入公司名");
            chkFlag = false;
        }
        if(form.phone.value.length !== 11 || parseInt(iu.string.left(form.phone.value,2)) <= 12){
            v_tip("b_phone","请输入正确的11位手机号码");
            chkFlag = false;
        }
        if(!form.address.value.trim()){
            v_tip("b_address","请输入详细地址");
            chkFlag = false;
        }
        return chkFlag;
    }
    window.onload = function (){
        if(document.getElementById("product-buy").getAttribute("data-bs-toggle") !== "modal"){
            document.getElementById("product-buy").onclick = function (){
                let form = document.forms.buy_info;
                if(chk(form)){
                    let element = document.getElementById("product-buy");
                    element.setAttribute("data-bs-toggle","modal");
                    element.setAttribute("data-bs-target","#buyBox");
                    element.innerHTML = "立即支付";
                    let input = document.getElementById("buy_info").getElementsByClassName("form-control");
                    for(let n in input){
                        if(typeof input[n].setAttribute === "function"){
                            input[n].setAttribute("disabled","true");
                        }
                    }
                    element.onclick = function (){
                        let form = document.forms.buy_info;
                        //检查通过开始请求
                        iu.http.res("POST","<%=Api_Url_Users_Buy%>",true,JSON.stringify({
                            product_id: <%=_aid%>,
                            domain: form.domain.value,
                            pay_type: form.pay_type.value,
                            pay_name: form.pay_name.value,
                            pay_company: form.pay_company.value,
                            phone: form.phone.value,
                            address: form.address.value,
                            remark: form.remark.value
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
                                    document.getElementById("product-name-span").innerHTML = "<%=_data.getString("title") + " - "%>";
                                    document.getElementById("buyBox-text").innerHTML = "";
                                    let qr_svg = iu.QRCode.generate(json.data.pay_url,200,"resources/images/default/wxpay.jpg",50);
                                    qr_svg.id = "wx_pay_qr";
                                    document.getElementById("buyBox-text").appendChild(qr_svg);
                                    document.getElementById("buyBox-label").setAttribute("order_id",json.data.order_id);
                                    document.getElementById("wx_pay_qr").setAttribute("style","margin-top: 0.5em;");
                                }else if(json.code === 401){
                                    document.getElementById("buyBox-text").innerHTML = "需要登录才能购买！";
                                    if(document.getElementById("buyBox-check")){document.getElementById("buyBox-check").remove();}
                                }
                            }
                        });
                    }
                }
            }
        }
    }
</script>
