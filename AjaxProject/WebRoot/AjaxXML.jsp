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

<title>My JSP 'AjaxXML.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body onload="loadData()">
   <script type="text/javascript">
       function loadData()
       {
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
					var xmlDoc=xmlHttp.responseXML;
					alert(xmlDoc);
					var arr=xmlDoc.getElementsByTagName("student");
					alert(arr.length);
					for(var i=0;i<arr.length;i++)
					{
					  var name=arr[i].getElementsByTagName("name")[0].childNodes[0].nodeValue;
					  var age=arr[i].getElementsByTagName("age")[0].childNodes[0].nodeValue;
					  var tab=document.getElementById("mytable");
					  var str="<tr><td>"+(i+1)+"</td><td>"+name+"</td><td>"+age+"</td></tr>";
					  tab.innerHTML=tab.innerHTML+str;
					}
					
				}
			}

			//使用方法
			xmlHttp.open("GET", "xml/mystudents.xml", true);
			xmlHttp.send();
       }
   </script>

	<table id="mytable">
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
		</tr>

	</table>
</body>
</html>
