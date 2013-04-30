
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.isbn.value == "" || form_obj.login.value == "") {
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

	Create Movie feedback Record:
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="feedrec.jsp">
		<input type=hidden name="searchAttribute" value="feedbackmovie">
		Login: 
		<input type=text name="login" length=10><br /> 
		Movie ISBN: 
		<input type=text name="isbn" length=10><br />
		How would you rate this film: 
		<select type=select name="rating" length=10>
			<option value='1'>1</option>
			<option value='2'>2</option>
			<option value='3'>3</option>
			<option value='4'>4</option>
			<option value='5'>5</option>
			<option value='6'>6</option>
			<option value='7'>7</option>
			<option value='8'>8</option>
			<option value='9'>9</option>
			<option value='10'>10</option>
			</select><br />  
			What did you like/not like about his film:
			<input type=text name="feedback" length=100><br />
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String login = request.getParameter("login");
			String isbn = request.getParameter("isbn");
			String rating = request.getParameter("rating");
			String feedback = request.getParameter("feedback");
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>Movie feedback Record created</b>
	<BR>
	<BR>
	<%
		

			out.println("Creating response for: <b> "
					+ isbn + " </b>");
			out.print(query.addMovieFeed(connector.stmt, login, isbn, rating, feedback));
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="feedrec.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>