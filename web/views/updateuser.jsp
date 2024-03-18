<%-- 
    Document   : updateuser
    Created on : Mar 5, 2024, 1:29:33 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
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
                <form action="updateuser" method="post">
                    <div class="modal-header">						
                        <h4 class="modal-title">Edit User</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" name="id" value="${userSelected.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="${userSelected.name}" required>
                        </div>
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" value="${userSelected.username}" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" value="${userSelected.email}" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="text" class="form-control" name="password" value="${userSelected.password}" required>
                        </div>
                        <div class="form-group">
                            <label>Role</label>
                            <select id="role" name="role" value="${userSelected.role}" class="form-control">
                                <c:choose>
                                    <c:when test="${userSelected.role eq 0}">
                                        <option value="0" selected>Admin</option>
                                        <option value="1">User</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">Admin</option>
                                        <option value="1" selected>User</option>
                                    </c:otherwise>
                                </c:choose>

                            </select>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select id="status" name="status" value="${userSelected.status}" class="form-control">
                                <c:choose>
                                    <c:when test="${userSelected.status eq 0}">
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
                        <button onclick="location.href = 'manageuser'" class="btn btn-default" value="Cancel">Cancel</button>
                        <input type="submit" class="btn btn-success" value="Update User">
                    </div>
                </form>
            </div>
    </body>
</html>
