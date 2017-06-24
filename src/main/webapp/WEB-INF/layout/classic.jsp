<%-- 
    Document   : welcome
    Created on : Jun 10, 2017, 12:18:29 PM
    Author     : tito
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"  %>
<%@include file="taglib.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js" >

        </script>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><tiles:getAsString name="title"/> </title> 
        <tilesx:useAttribute name="current"/>
    </head>

    <body>
        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"  aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<spring:url value="/" />">Blogger Aggregator</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="${current=='index' ? 'active':''}"><a href="<spring:url value="/" />">Home</a></li>
                                <security:authorize access="hasRole('ROLE_ADMIN')">
                                <li class="${current=='users' ? 'active':''}" ><a href="<spring:url value="/users" />">Users</a></li>
                                </security:authorize>
                            <li class="${current=='register' ? 'active':''}" ><a href="<spring:url value="/register"/>">Register</a></li>
                                <security:authorize access="! isAuthenticated()">
                                <li class="${current=='login' ? 'active':''}" ><a href="<spring:url value="/login"/>">Login</a></li>
                                </security:authorize>
                                <security:authorize access="isAuthenticated()">
                                <li class="${current=='account' ? 'active':''}" ><a href="<spring:url value="/account" />">My Account</a></li>
                                <li ><a href="<spring:url value="/logout"/>">Logout</a></li>
                                </security:authorize>
                        </ul>

                    </div>
                </div>
            </nav>

            <tiles:insertAttribute name="body" /> 
           
            <br/>
            <br/>

            <center> 
                <tiles:insertAttribute name="footer"  /> 
            </center>   

        </div>

    </body>
</html>
