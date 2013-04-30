
<%@ page language="java" import="cs5530.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script LANGUAGE="javascript">

function check_all_fields(form_obj){
	alert(form_obj.searchAttribute.value+"='"+form_obj.login.value+"'");
	if( form_obj.login.value == "" || form_obj.firstname.value == "" || form_obj.lastname.value == ""){
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
if( isSet == null ){
%>

	Add a new user:
	<form name="user_add" method=get onsubmit="return check_all_fields(this)" action="register.jsp">
		<input type=hidden name="searchAttribute" value="newuser">
		Login:
		<input type=text name="login" length=10><br/>
		Password:
		<input type=password name="password" length=10><br/>
		First Name:
		<input type=text name="firstname" length=10><br/>
		Last Name:
		<input type=text name="lastname" length=10><br/>
		Street Address:
		<input type=text name="address" length=10><br/>
		City:
		<input type=text name="city" length=10><br/>
		State:
		<input type=text name="state" length=10><br/>
		Postal Code:
		<input type=text name="postalcode" length=10><br/>
		Phone:
		<input type=text name="phone" length=10><br/>
		Credit Card Number:
		<input type=text name="ccnum" length=10><br/>
		<input type=submit>
	</form>
	<BR><BR>

<%

} else {

	String login = request.getParameter("login");
	String password = request.getParameter("password");
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String postalcode = request.getParameter("postalcode");
	String phone = request.getParameter("phone");
	String ccnum = request.getParameter("ccnum");
	
	cs5530.Connector connector = new Connector();
	
	cs5530.Queries query = new Queries();
	
%>  
  
  <b>New User Added</b> <BR><BR>
  <%
  		

  		out.println("The adding a new user under username under: <b> "+login+
					" </b>");
  		out.println(query.addNewCustomer(connector.stmt, login, password, firstname, lastname, address, city, state, postalcode, phone, ccnum));
  %>

<%
 connector.closeStatement();
 connector.closeConnection();
}  // We are ending the braces for else here
%>

<BR><a href="register.jsp"> New query </a><br/>
<a href="index.html">Back to Index</a>

</body>
