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

<title>My JSP 'JqueryCity.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<select id="sele"></select>
	<script type="text/javascript">
		$(document).ready(function() {
			// 在这里写你的代码...
           $.ajax({type:"get",dataType:"json",url:"json/city.json",success:function(data){
             var city=eval(data);
             var cityCode=data.城市代码;//返回的是一个数组
             var str="";
             for(var i=0;i<cityCode.length;i++){
                var province=cityCode[i].省;
                str=str+"<option>"+province+"</option>";
             }
             $("#sele").append(str);
           },error:function(){
             alert("数据请求错误！");
           }});
		});
	</script>
</body>
</html>
