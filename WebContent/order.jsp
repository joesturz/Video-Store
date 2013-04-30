
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.isbn.value == "" || form_obj.login.value == ""
				|| form_obj.count.value == "") {
			alert("Fields should be nonempty");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<%
		String isSet = request.getParameter("login");
		if (isSet == null)
		{
	%>

	Create a new Order:
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="order.jsp">
		<input type=hidden name="searchAttribute" value="ordermovie">
		Login: 
		<input type=text name="login" length=10><br /> 
		Movie ISBN: 
		<input type=text name="isbn" length=10><br /> 
		Media Type: 
		<select type=select name="mediatype" length=10>
			<option value='DVD'>DVD</option>
			<option value='BluRay'>BluRay</option>
			<option value='HDDVD'>HDDVD</option>
			<option value='VCD'>VCD</option>
		</select><br /> How Many? <input type=text name="count" length=10><br />
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String login = request.getParameter("login");
			String isbn = request.getParameter("isbn");
			String mediatype = request.getParameter("mediatype");
			String count = request.getParameter("count");
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>New Order Created</b>
	<BR>
	<BR>
	<%
		out.print(query.createOrder(connector.stmt, login, isbn, mediatype, count));

			out.println("Creating order for: <b> "
					+ login + " </b>");
			out.println(query.getHtmlString());
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="order.jsp"> New query </a>
	<br/>
<a href="index.html">Back to Index</a>


</body>