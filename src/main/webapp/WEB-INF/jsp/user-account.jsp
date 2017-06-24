<%-- 
    Document   : user-details
    Created on : Jun 20, 2017, 12:09:55 AM
    Author     : tito
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.nav-tabs a:first').tab('show');
        $('.triggerRemove').click(function (e) {
            e.preventDefault();
            $("#modelRemove .removeBtn").attr("href", $(this).attr('href'));
            $("#modelRemove").modal();

        });

        $(".blogform").validate(
                {
                    rules: {
                        name: {
                            required: true,
                            minlength: 2
                        },
                        url: {
                            url: true,
                            required: true
                        }

                    },
                    highlight: function (element) {
                        $(element).closest(".form-group").removeClass("has-success").addClass("has-error");

                    },
                    unhighlight: function (element) {
                        $(element).closest(".form-group").removeClass("has-error").addClass("has-success");

                    }
                }
        );

    });
</script>

<h1>${user.name}</h1>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
    New Blog
</button>

<!-- Modal -->
<form:form commandName="blog" cssClass="form-horizontal blogform" >
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">New Blog </h4>
                </div>
                <div class="modal-body">
                    <div class="form-group" >
                        <label for="name" class="col-sm-2 control-label">Name : </label>
                        <div class="col-sm-10">
                            <form:input path="name" id="name" cssClass="form-control" />
                            <form:errors path="name" />

                        </div>

                    </div>

                    <div class="form-group" >
                        <label for="url" class="col-sm-2 control-label">Url : </label>
                        <div class="col-sm-10">
                            <form:input path="url" id="url" cssClass="form-control" />
                            <form:errors path="url" />

                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="save" />
                </div>
            </div>
        </div>
    </div>
</form:form>

<br/> <br/>

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