
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Actor</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="updateactor" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Actor</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" name="id" value="${actorSelected.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="${actorSelected.name}" required>
                        </div>
                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" class="form-control" name="date" value="${actorSelected.birthday}" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" class="form-control" name="description" value="${actorSelected.descript}" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" accept="image/*" class="form-control" name="image">
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select id="status" name="status" value="${actorSelected.status}" class="form-control">
                                <c:choose>
                                    <c:when test="${actorSelected.status eq 0}">
                                        <option value="0" selected>Suspended</option>
                                        <option value="1">Active</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">Suspended</option>
                                        <option value="1" selected>Active</option>
                                    </c:otherwise>
                                </c:choose>

                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button onclick="location.href = 'manageactor'" class="btn btn-default" value="Cancel">Cancel</button>
                        <input type="submit" class="btn btn-success" value="Update Actor">
                    </div>
                </form>
            </div>
    </body>
</html>
