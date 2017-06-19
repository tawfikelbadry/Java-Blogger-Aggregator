<%-- 
    Document   : welcome
    Created on : Jun 10, 2017, 12:18:29 PM
    Author     : tito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><tiles:getAsString name="title"/> </title> 
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
                            <li class="active"><a href="<spring:url value="/" />">Home</a></li>
                            <li ><a href="<spring:url value="/users" />">Users</a></li>
                            <li><a href="#">Contact</a></li>
                            
                        </ul>
                       
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
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
