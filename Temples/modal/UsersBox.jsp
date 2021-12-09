<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="v-tip" tabindex="-1" aria-labelledby="v-tip-label" data-bs-backdrop="static" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-body">
                <div class="nsa-title">用户信息</div>
                <table class="table mt-2">
                    <tbody id="u-info-table">
                        <tr>
                            <th scope="col">ID</th>
                            <td id="u-info-table-id"></td>
                            <th scope="col">用户名</th>
                            <td id="u-info-table-name"></td>
                        </tr>
                        <tr>
                            <th scope="col">手机号</th>
                            <td id="u-info-table-phone"></td>
                            <th scope="col">用户等级</th>
                            <td id="u-info-table-level"></td>
                        </tr>
                        <tr>
                            <th scope="col">注册时间</th>
                            <td id="u-info-table-create"></td>
                            <th scope="col">最后更新</th>
                            <td id="u-info-table-update"></td>
                        </tr>
                    </tbody>
                </table>
                <script>
                    if(localStorage.getItem("token")){
                        iu.http.res("POST","<%=Api_Url_Users_Info%>",true,null,[
                            {
                                "name": "Authorization",
                                "value": localStorage.getItem("token")
                            }
                        ],function (e){
                            if(e.status !== 500){
                                let buy_button = '<button id="buy-vip" class="btn btn-outline-dark ms-3" data-bs-toggle="modal" data-bs-target="#b-vip">购买VIP</button>';
                                let {id,name,discount: {discount, name: discount_name},created_at,updated_at} = JSON.parse(e.responseText).data;
                                document.getElementById("u-info-table-id").innerHTML = id;
                                document.getElementById("u-info-table-name").innerHTML = name;
                                document.getElementById("u-info-table-phone").innerHTML = localStorage.getItem("phone");
                                document.getElementById("u-info-table-level").innerHTML = discount_name + buy_button;
                                document.getElementById("u-info-table-level").setAttribute("discount",discount);
                                document.getElementById("u-info-table-create").innerHTML = created_at;
                                document.getElementById("u-info-table-update").innerHTML = updated_at;
                            }
                        });
                    }
                </script>
                <style>
                    #u-info-table-level button {
                        height: 20px;
                        font-size: 10px;
                        line-height: 6px;
                    }
                </style>
                <div class="nsa-title">订单中心</div>
                <table class="table mt-2">
                    <thead>
                        <tr>
                            <th scope="col">订单号</th>
                            <th scope="col">商品</th>
                            <th scope="col">类型</th>
                            <th scope="col">价格</th>
                            <th scope="col">时间</th>
                        </tr>
                    </thead>
                    <tbody id="u-order-table"></tbody>
                </table>
            </div>
            <div class="modal-footer" style="border-top: none;">
                <button type="button" class="btn btn-secondary" id="v-t-b">退出登录</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">关闭</button>
                <script>
                    iu.http.res("POST","<%=Api_Url_Users_Order%>",true,JSON.stringify({
                        page: 1
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
                            let json = JSON.parse(e.responseText);let tFlag = true;
                            let temple = '<tr><td>{{order_id}}</td><td>{{product}}</td><td>{{type}}</td><td>{{price}}</td><td>{{order_time}}</td></tr>';
                            for(let x in json.data.data){
                                let {order_id,product,created_at} = json.data.data[x];
                                if(!product){
                                    break;
                                }
                                let {title,price} = product;
                                document.getElementById("u-order-table").innerHTML += temple.replace("{{order_id}}",order_id)
                                    .replace("{{product}}",title)
                                    .replace("{{price}}","￥" + (price / 100).toFixed(2))
                                    .replace("{{order_time}}",created_at).replace("{{type}}","默认");tFlag = false;
                            }
                            if(tFlag){
                                document.getElementById("u-order-table").innerHTML = '<tr><td colspan="5" class="text-center">您还没有订单~</td></tr>';
                            }
                        }
                    });
                    document.getElementById("v-t-b").onclick = function (){
                        localStorage.clear();
                        window.location.href = window.location.href + "";
                    }
                </script>
            </div>
        </div>
    </div>
</div>
<%@ include file="BuyVip.jsp" %>
