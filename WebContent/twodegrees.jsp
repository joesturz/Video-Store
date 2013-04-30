
<%@ page language="java" import="cs5530.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">
	function check_all_fields(form_obj) {
		//alert(form_obj.searchAttribute.value + "='" + form_obj.isbn.value + "'");
		if (form_obj.afn.value == "" || form_obj.aln.value == "" || form_obj.aafn.value == "" || form_obj.aaln.value == "") {
			alert("Fields should be nonempty");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

	<%
		String isSet = request.getParameter("afn");
		if (isSet == null)
		{
	%>

	Find the degrees of separation:
	<form name="user_add" method=get
		onsubmit="return check_all_fields(this)" action="twodegrees.jsp">
		<input type=hidden name="searchAttribute" value="degrees">
		Actor 1 First Name: 
		<input type=text name="afn" length=10><br />
		Actor 1 Last Name: 
		<input type=text name="aln" length=10><br />
		Actor 2 First Name: 
		<input type=text name="aafn" length=10><br />
		Actor 2 Last Name: 
		<input type=text name="aaln" length=10><br />
		<input type=submit>
	</form>
	<BR>
	<BR>

	<%
		} else
		{

			String afn1 = request.getParameter("afn");
			String aln1 = request.getParameter("aln");
			String afn2 = request.getParameter("aafn");
			String aln2 = request.getParameter("aaln");
		

			cs5530.Connector connector = new Connector();

			cs5530.Queries query = new Queries();
	%>

	<b>Degree results</b>
	<BR>
	<BR>
	<%
		

			out.println("Finding seperation for: <b> "
					+ afn1 + " " + aln1 + " , "+ afn2 + aln2 + " </b>");
			out.print(query.getDegree(connector.stmt, afn1, aln1, afn2, aln2, 0));
	%>

	<%
		connector.closeStatement();
			connector.closeConnection();
		} // We are ending the braces for else here
	%>

	<BR>
	<a href="twodegrees.jsp"> New query </a>
	<br/>
	<a href="index.html">Back to Index</a>

</body>