<%-- 
    Document   : users
    Created on : Jun 16, 2017, 2:59:41 AM
    Author     : tito
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../layout/taglib.jsp" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script>
    $(document).ready(function () {
        $('.triggerRemove').click(function (e) {
            e.preventDefault();
            $("#modelRemove .removeBtn").attr("href", $(this).attr('href'));
            $("#modelRemove").modal();

        });
    });
</script>

<table class="table table-bordered table-hover table-striped" >
    <thead>
        <tr>
            <th>#</th>
            <th>User</th>
            <th>email</th>
            <th>password</th>
            <th>operations</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${allUsers}" var="user" >
            <tr>
                <td>${user.id}</td>
                <td>
                    <a href="<spring:url value="/users/${user.id}" />" >    
                        ${user.name}
                    </a>
                </td>
                <td>${user.email}</td>
                <td>${user.password}</td>
                <td>
                    <a href="<spring:url value="/users/remove/${user.id}" />" class="btn btn-danger triggerRemove" >    
                        Remove
                    </a>

                </td>

            </tr>

        </c:forEach>

    </tbody>
</table>

<div class="modal fade" id="modelRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Remove Blog </h4>
            </div>
            <div class="modal-body">
                Are You sure to remove ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <a href="<spring:url value="" />" class="btn btn-danger removeBtn" >Remove </a>
            </div>
        </div>
    </div>
</div>