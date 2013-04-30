
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		//alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.login.value == "" || form_obj.other.value == "") {
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

	Set trust of another user:
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="trustrec.jsp">
		<input type=hidden name="searchAttribute" value="feedbackmovie">
		Login: 
		<input type=text name="login" length=10><br />
		The login of the user you would like to set a trust rating for:
		<input type=text name="other" length=100><br /> 
			Do you trust this user: 
		<select type=select name="rating" length=10>
			<option value='yes'>Yes</option>
			<option value='no'>No</option>
			</select><br/>
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String login = request.getParameter("login");
			String other = request.getParameter("other");
			String rating = request.getParameter("rating");
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>New User Trust Rating added</b>
	<BR>
	<BR>
	<%
		

			out.println("Creating trust rating for: <b> "
					+ other + " rated by " + login +" </b>");
			out.print(query.addTrustRating(connector.stmt, login, other, rating));
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="trustrec.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>