
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		//alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.login.value == "" || form_obj.other.value == "" || form_obj.isbn.value == "") {
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

	Add User Peer Response (how useful a rating was?"):
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="usefulness.jsp">
		<input type=hidden name="searchAttribute" value="feedbackmovie">
		Login: 
		<input type=text name="login" length=10><br />
		The login of the feedback you would like to rate:
		<input type=text name="other" length=100><br /> 
		Movie ISBN of the feedback you wish to rate: 
		<input type=text name="isbn" length=10><br />
			How would you rate this film: 
		<select type=select name="rating" length=10>
			<option value='0'>0</option>
			<option value='1'>1</option>
			<option value='2'>2</option>
			</select><br/>
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String login = request.getParameter("login");
			String isbn = request.getParameter("isbn");
			String other = request.getParameter("other");
			String rating = request.getParameter("rating");
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>New User Peer Response added</b>
	<BR>
	<BR>
	<%
		

			out.println("Creating response for: <b> "
					+ isbn + " </b>");
			out.print(query.addUseful(connector.stmt, login, other, isbn, rating));
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="usefulness.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>