<%-- 
    Document   : user-details
    Created on : Jun 20, 2017, 12:09:55 AM
    Author     : tito
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script>
    $(document).ready(function () {
        $('.nav-tabs a:first').tab('show');
        $('.triggerRemove').click(function (e) {
            e.preventDefault();
            $("#modelRemove .removeBtn").attr("href", $(this).attr('href'));
            $("#modelRemove").modal();

        });
    });
</script>

<h1>${user.name}</h1>

<br/>

<div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <c:forEach items="${user.blogs}" var="blog" >
            <li role="presentation">
                <a href="#blog_${blog.id}" aria-controls="profile" role="tab" data-toggle="tab">${blog.name}</a>
            </li>
        </c:forEach>
    </ul>


    <!-- Tab panes -->
    <div class="tab-content">
        <c:forEach items="${user.blogs}" var="blog">
            <div id="blog_${blog.id}"  role="tabpanel" class="tab-pane"  >
                <h2>${blog.name}</h2>
                <p><a href="<spring:url value="/blog/remove/${blog.id}" />" class="btn btn-danger triggerRemove">Remove</a>  ${blog.url}</p>

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
                        <c:forEach items="${blog.items}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td>${item.link}</td>
                                <td>${item.publishedDate}</td>
                            </tr>

                        </c:forEach>
                    </tbody>

                </table>


            </div>
        </c:forEach>
    </div>
</div>

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