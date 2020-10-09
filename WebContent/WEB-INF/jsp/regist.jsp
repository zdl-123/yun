<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>青软云盘</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/regist.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/regist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/form.js"></script>
<script type="text/javascript">
//实现看不清换一张的功能,其实就是重新发送请求到checkImageServlet
	function changeImage() {
		document.getElementById("img").src = "${pageContext.request.contextPath}/user/getVerifyCode.action?time="
			+ new Date().getTime();
 }
	
</script>
<title></title>
</head>

<body>
	<!--header开始-->
	<div class="header">
		<div class="logo">
			<a href="user/regist.action" class="logo">注册账号</a>
		</div>
		<div class="login">
			<span>我已注册，现在就</span> <a href="user/login.action" class="login_icon">登录</a>
		</div>
		<div class="hr"></div>
	</div>
	<!--header结束-->

	<!--content开始-->
	<div class="content">
		<div class="reg">
			<form action="user/regist.action" method="post">
				<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px"><h1>新用户注册</h1>
						<table width="70%" border="0" cellspacing="2" class="upline">
							 <tr>
								<td style="text-align: right; width: 20%">邮箱：</td>
								<td style="width: 40%">
								<input type="text" class="textinput"  id="email" name="email" onkeyup="checkEmail();"/>
								</td>
								<td colspan="2"><span id="emailMsg"></span><font color="#999999">请输入有效的邮箱地址</font></td>
							</tr> 
							<tr>
								<td style="text-align: right">用户名：</td>
								<td><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
								</td>
								<td colspan="2"><span id="usernameMsg"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font></td>
							</tr>
							<tr>
								<td style="text-align: right">密码：</td>
								<td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
								<td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
							</tr>
							<tr>
								<td style="text-align: right">重复密码：</td>
								<td>
								<input type="password" class="textinput"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
								</td>
								<td><span id="confirmMsg"></span>&nbsp;</td>
							</tr>
						</table>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right">验证码：</td>
								<td style="width: 50%">
								<input type="text" class="textinput" name="usercode"/>
								<span>${codeError}</span>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%;">&nbsp;</td>
								<td rowspan="2" style="width: 50%">
								<img src="${pageContext.request.contextPath}/user/getVerifyCode.action" width="180"
									height="30" class="textinput" style="height: 30px;" id="img" onclick="javascript:changeImage();"/>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清点我</a>
								</td>
							</tr>
						</table>

						<dl>
							<dt></dt>
							<dd class="ipt_box pro">
								<input id="agree" type="checkbox" checked /> <span>阅读并接受<a
									href="#">《XX用户协议》</a></span>
							</dd>
						</dl>
						<dl>
							<dt></dt>
							<dd>
								<input class="regBtn" type="submit" value="注册" />
							</dd>
							<dd class="mes">
								<div class="error agreeErr">
									<span class="error_icon"></span> <span>您还未接受百度用户协议</span>
								</div>
							</dd>
						</dl>
					</td>
				</tr>
			</table>
			</form>
		</div>

<!-- 		<div class="right"> -->
<!-- 			<h3 class="phoneReg">手机快速注册</h3> -->
<!-- 			<div> -->
<!-- 				<p class="p1">请使用中国大陆手机号，编辑短信：</p> -->
<!-- 				<p class="p2">6-14位字符（支持数字/字母/符号）</p> -->
<!-- 				<p class="p1">作为登录密码，发送至：</p> -->
<!-- 				<p class="p2">0000 00000 00000</p> -->
<!-- 				<p class="p3">即可注册成功，手机号即为登录帐号。</p> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	<!--content结束-->

	<!--footer开始-->
	<div class="footer">
		<p>2020 袁玉宁 </p>
	</div>
</body>
</html>
