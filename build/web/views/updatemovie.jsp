
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Movie</title>
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
                <form action="updatemovie" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Movie</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input type="text" class="form-control" name="id" value="${movieSelected.id}" readonly>
                        </div>
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" class="form-control" name="title" value="${movieSelected.title}" required>
                        </div>
                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" class="form-control" name="date" value="${movieSelected.date}" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" class="form-control" name="description" value="${movieSelected.descript}" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" accept="image/*" class="form-control" name="image">
                        </div>
                        <div class="form-group">
                            <label>Source</label>
                            <input type="text" class="form-control" name="source" value="${movieSelected.src}" required>
                        </div>
                        <div class="form-group">
                            <label>Trailer</label>
                            <input type="text" class="form-control" name="trailer" value="${movieSelected.trail}" required>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select id="status" name="status" value="${movieSelected.status}" class="form-control">
                                <c:choose>
                                    <c:when test="${movieSelected.status eq 0}">
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
                        <div class="form-group">
                            <label>Status Release</label>
                            <select id="statusrelease" name="statusrelease" value="${movieSelected.statusrelease}" class="form-control">
                                <c:choose>
                                    <c:when test="${movieSelected.statusrelease eq 0}">
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
                        <button onclick="location.href = 'managemovie'" class="btn btn-default" value="Cancel">Cancel</button>
                        <input type="submit" class="btn btn-success" value="updatemovie">
                    </div>
                </form>
            </div>
    </body>
</html>
