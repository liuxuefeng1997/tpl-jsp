<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="buyBox" tabindex="-1" aria-labelledby="buyBox-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="buyBox-label">购买 - 微信支付</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center" id="buyBox-text"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="buyBox-check">检查订单</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="buyBox-close">关闭</button>
                <script>
                    document.getElementById("buyBox-check").onclick = function (){
                        if(!document.getElementById("buyBox-label").getAttribute("order_id")){
                            return null;
                        }
                        iu.http.res("POST","<%=Api_Url_Users_Buy_Check%>",true,JSON.stringify({
                            order_id: parseInt(document.getElementById("buyBox-label").getAttribute("order_id"))
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
                                    document.getElementById("buyBox-text").innerHTML = "支付成功";
                                    document.getElementById("buyBox-check").remove();
                                    document.getElementById("buyBox-close").removeAttribute("data-bs-dismiss");
                                    document.getElementById("buyBox-close").onclick = function (){
                                        window.location.href = window.location.href + "";
                                    }
                                    return null;
                                }else {
                                    document.getElementById("buyBox-check").innerHTML = "您还未支付！";
                                    setTimeout(function (){
                                        document.getElementById("buyBox-check").innerHTML = "检查订单";
                                    },3000)
                                }
                            }
                        });
                    }
                </script>
            </div>
        </div>
    </div>
</div>
