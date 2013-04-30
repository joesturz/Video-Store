
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		//alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.actors.value == "" || form_obj.directors.value == "" || form_obj.keywords.value == "") {
			alert("Fields should be nonempty");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<%
		String isSet = request.getParameter("actors");
		if (isSet == null)
		{
	%>

	Find the degrees of separation:
	<form name="user_add" method=get
		action="moviebrowse.jsp">
		<input type=hidden name="searchAttribute" value="degrees">
		Actors Last Name (Separate with commas:) 
		<input type=text name="actors" length=100><br />
		Directors Last Name (Separate with commas:) 
		<input type=text name="directors" length=100><br />
		Keywords (Separate with commas:) 
		<input type=text name="keywords" length=100><br />
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String actors = request.getParameter("actors");
			String directors = request.getParameter("directors");
			String keywords = request.getParameter("keywords");
			
			String[] actorsArray = actors.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
			java.util.ArrayList<String> actorsAL = new java.util.ArrayList<String>();
			for(String s: actorsArray)
			{
				s = s.trim();
				actorsAL.add(s);
			}
			String[] directorsArray = directors.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
			java.util.ArrayList<String> directorsAL = new java.util.ArrayList<String>();
			for(String s: directorsArray)
			{
				s = s.trim();
				directorsAL.add(s);
			}
			String[] keywordsArray = keywords.split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)");
			java.util.ArrayList<String> keywordsAL = new java.util.ArrayList<String>();
			for(String s: keywordsArray)
			{
				s = s.trim();
				keywordsAL.add(s);
			}
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>Degree results</b>
	<BR>
	<BR>
	<%
		

			out.println("Search for Actors:<br>");
			out.println("<ul>");
			for(String s: actorsAL)
			{
				out.println("<li>" + s + "</li>");
			}
			out.println("</ul>");
			
			out.println("Search for Directors:<br>");
			out.println("<ul>");
			for(String s: directorsAL)
			{
				out.println("<li>" + s + "</li>");
			}
			out.println("</ul>");
			
			out.println("Search for Keywords:<br>");
			out.println("<ul>");
			for(String s: keywordsAL)
			{
				out.println("<li>" + s + "</li>");
			}
			out.println("</ul>");
			
			java.util.ArrayList<String> results = query.getSearchResults(connector.stmt, actorsAL, directorsAL, keywordsAL);
			out.println("<p><strong>Query Results</strong></p>");
			for(String s: results)
			{
				out.println("<p>" + s + "</p>");
			}
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="moviebrowse.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>