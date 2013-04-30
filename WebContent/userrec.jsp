
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		alert(form_obj.searchAttribute.value + "='" + form_obj.login.value + "'");
		if (form_obj.login.value == "") {
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

	Get user record:
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="userrec.jsp">
		<input type=hidden name="searchAttribute" value="getUserData">
		Login: 
		<input type=text name="login" length=10><br />
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String login = request.getParameter("login");
			
			cs5530.Connector connector = new Connector();
			cs5530.Queries query = new Queries();
	%>

	<b>User's Record</b>
	<BR>
	<BR>
	<%
		

			out.println("Creating record for: <b> "
					+ login + " </b>");
			
			out.print(query.getUserPersonalData(connector.stmt, login));
			out.print(query.getSalesHistory(connector.stmt, login));
			out.print(query.getMovieFeedback(connector.stmt, login));
			out.print(query.getPeerFeedback(connector.stmt, login));
			out.print(query.getTrusted(connector.stmt, login));
			out.print(query.getNonTrusted(connector.stmt, login));
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="userrec.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>