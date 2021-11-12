# 各区域图片尺寸
## Banner 轮播图
<pre>   1920 * (>= 1080)</pre>
#### *注：如果Banner不需要跳转，将对应 route 字段设置为空即可
## Banner 右侧栏
### 登录区域
<pre>   (>= 258) * 109</pre>
### 广告位
<pre>   258 * (>= 215)</pre>
## Banner 底部区域
<pre>   (>= 202) * 80</pre>
## 展示区左侧
<pre>   一行高度： 270 * 295</pre>
<pre>   两行高度： 270 * 590</pre>
## 新闻卡片主图
<pre>   1920 * 1080</pre>
## 横幅尺寸
<pre>   (>= 1200) * 200</pre>
## 网站建设与营销推广
<pre>   1920 * 1080</pre>
## 页脚区域
<pre>   140 * 140</pre>
## 产品中心
### Banner 图
<pre>   (>= 1300) * 300</pre>
### 产品卡片主图
<pre>   264 * 176   300 * 200   600 * 400</pre>
### 产品详情会员左栏
<pre>   (>= 442) * 313</pre>
## 官方动态、解决方案、成功案例
### 顶部图片
<pre>   (>= 856) * 160</pre>
## 加盟代理、产品详情、文章内容
### 顶部图片
<pre>   (>= 966) * 313</pre>
### 侧边热门应用图片
<pre>   (>= 114) * 70</pre>
# 外链说明 /link/
## 当需要使用外链时，路由格式如下：
<pre>   /link/[Base64URL]</pre>
#### *注：如果需要添加额外参数直接添加在route字段后面即可，用 & 分隔
# 内置API说明
## Base64 URL 生成 API
### 信息
<pre>
    Method: GET/POST
    Path: /
    Parameters: {
        "r": "/base/",                  //路由地址，必填，不要修改
        "m": "api",                     //模式参数，必填，不要修改
        "url": "https://www.baidu.com"  //要生成Base64 URL的网址，必填
    }
</pre>
### 示例
<pre>
    GET /?r=/base/&m=api&url=https://www.baidu.com
    Request: aHR0cHM6Ly93d3cuYmFpZHUuY29t
</pre>
## 重定向 API
### 信息
<pre>
    Method: GET/POST
    Path: /
    Parameters: {
        "r": "/link/",                          //路由地址，必填，不要修改
        "m": "api",                             //模式参数，必填，不要修改
        "b64": "aHR0cHM6Ly93d3cuYmFpZHUuY29t",  //重定向网址的Base64 URL编码，必填
        "tip": ""                               //启用提示，可选，填入任意值启用
    }
</pre>
### 示例
<pre>
    GET /?r=/link/&m=api&b64=aHR0cHM6Ly93d3cuYmFpZHUuY29t&tip=
    Request: https://www.baidu.com
</pre>
#### *注：可直接在配置文件route字段内填入?r=后面的全部数据
# 外部API说明
## 外部 API 配置文件路径
<pre>   /Config/Api/Url.json</pre>
## 外部 API 配置文件结构说明
<pre>
    {
        "api_protocol": "http://",              //api 连接协议
        "api_host": "api.sh-yq.cn",             //api 域名配置
        "api_list": {                           //api 列表
            "product": {                          //api 所属模块
                "_self": "产品中心",               //api 描述（仅用于指示，无实际作用）
                "tags": "/product/tags",          //api 路径配置
                "list": "/product/list",
                "detail": "/product/detail"
            }
        }
    }
</pre>
