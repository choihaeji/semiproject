<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	onload=function(){
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("chkid")[0].value = id;
	}
	
	function confirm(bool){
		if(bool =="true"){
			opener.document.getElementsByName("pw")[0].focus();
			opener.document.getElementsByName("id")[0].title="y";
		} else {
			opener.document.getElementsByName("id")[0].focus();
			opener.document.getElementsByName("id")[0].title="n";
			opener.document.getElementsByName("id")[0].value = "";
		}
		
		self.close();
	}
</script>
</head>
<%
	String idnotused = request.getParameter("idnotused");
%>
<body>
	<table border="1">
		<tr>
			<td><input type="text" name="chkid" readonly="readonly"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")? "아이디 생성 가능":"중복 아이디 존재" %>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirm('<%=idnotused%>');">
			</td>
		</tr>
	</table>
</body>
</html>