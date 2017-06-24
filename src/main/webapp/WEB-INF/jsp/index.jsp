<%-- 
    Document   : welcome
    Created on : Jun 10, 2017, 12:18:29 PM
    Author     : tito
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp" %>

<h1>Latest news from Java World</h1>

<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>Title</th>
            <th>link</th>
            <th>published Date</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="item">
        <tr>
            <td>${item.id}</td>
            <td>${item.title}</td>
            <td>${item.link}</td>
            <td>${item.publishedDate}</td>
        </tr>

    </c:forEach>
</tbody>

</table>
