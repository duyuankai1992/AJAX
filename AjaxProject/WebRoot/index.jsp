<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#box {
	width: 800px;
	height: 200px;
	border: 1px solid red;
}
</style>
</head>

<body>
	<button onclick="getData()">获取数据</button>
	<div id="box"></div>
	ID:
	<input type="text" id="ID" />
	<p></p>
	JNAME:
	<input type="text" id="name" />
	<p></p>
	JDUTY:
	<input type="text" id="duty" />
	<p></p>
	JREQUEST:
	<input type="text" id="jrequest" />
	<p></p>
	<script type="text/javascript">
		/**步骤：
		  1.获取一个xmlHttp对象  ---》打开一个浏览器
		  2.使用xmlHttp对象方法
		  a. open("GET/POST",url);
		            参数:1.method  :"GET/POST"
		   2.url 
		   3. async   true异步   false 同步
		   4.5：, username, password
		   b.send()  发送请求
		   c.xmlHttp.onreadystatechange=function(){
		      if(xmlHttp.readyState)-   状态：
		      0：未初始化
		      1：正在加载
		      2：加载完毕
		      3：正在交互中
		      4：响应完成
		    }
		 */
		function getData() { // window.location.href="MyJsp.jsp?id=1"
			var xmlHttp;
			if (window.XMLHttpRequest) {//版本兼容  IE7+  谷歌   火狐
				xmlHttp = new XMLHttpRequest();
			} else {
				xmlHttp = new ActiveXObject("Microsoft XMLHTTP");
			}
			//回调函数
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					//获取响应结果
					var job = xmlHttp.responseText;  //JSON
					job=eval("("+job+")");//eval("2+3")
					/* document.getElementById("box").innerText=result; */
					document.getElementById("ID").value=job.id;
					document.getElementById("name").value=job.jname;
					document.getElementById("duty").value=job.jduty;
					document.getElementById("jrequest").value=job.jrequest;
				}
			}

			//使用方法
			xmlHttp.open("GET", "MyServlet?id=2", true);
			xmlHttp.send();
		}
	</script>
</body>
</html>
