
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		//alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.isbn.value == "" || form_obj.count.value == "") {
			alert("Fields should be nonempty");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<%
		String isSet = request.getParameter("isbn");
		if (isSet == null)
		{
	%>

	Find the degrees of separation:
	<form name="user_add" method=get
		action="usefulfeedback.jsp">
		<input type=hidden name="searchAttribute" value="degrees">
		Movie ISBN: 
		<input type=text name="isbn" length=100><br />
		Number of desired feedback results: 
		<input type=text name="count" length=100><br />
		
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String isbn = request.getParameter("isbn");
			String count = request.getParameter("count");
			
			
			
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>Degree results</b>
	<BR>
	<BR>
	<%
		

			out.println("Search for feedback for "+ isbn + "<br/>" );
			
			java.util.ArrayList<String> results = query.getUsefulFeedback(connector.stmt, isbn, count);
			out.println("<p><strong>Query Results</strong></p>");
			out.println("<table border='1'>");
			out.println("<td> User </td><td> Rating </td><td>Comment</td><td>Average Usefulness Score</td>");
			for(String s: results)
			{
				out.println("<tr>" + s + "</tr>");
			}
			out.println("</table>");
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="usefulfeedback.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>