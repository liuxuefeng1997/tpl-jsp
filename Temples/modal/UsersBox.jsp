<%--
  Created by IntelliJ IDEA.
  User: lxf
  Date: 2021/11/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Modal -->
<div class="modal fade" id="v-tip" tabindex="-1" aria-labelledby="v-tip-label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="v-tip-label">用户中心</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="v-tip-text">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="v-t-b">退出登录</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">关闭</button>
                <script>
                    document.getElementById("v-t-b").onclick = function (){
                        localStorage.removeItem("token");
                        window.location.href = window.location.href + "";
                    }
                </script>
            </div>
        </div>
    </div>
</div>