<%-- 
    Document   : manager
    Created on : Mar 4, 2024, 9:38:32 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager Movie</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
        <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>

    </head>

    <body>
        <div class="container-fluid">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-2">
                            <h2><b>Manager Movie</b></h2>
                        </div>
                        <div class="dropdown col-sm-1">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Action
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="manageuser">User</a></li>
                                <li><a href="manageactor">Actor</a></li>
                                <li><a href="managegenre">Genre</a></li>
                                <li><a href="homepage">Home</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-9">
                            <a href="#addMovieModall" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Movie</span></a>
                            <a href="#deleteListMovie" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xe2e7;</i> <span>Change</span></a>						
                        </div>
                    </div>
                </div>
                <%-- table movie --%>
                <div class="movie-table">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>#</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Source</th>
                                <th>Trailer</th>
                                <th>Like Count</th>
                                <th>Rate</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listA}" var="m">
                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox${m.id}" class="Rowchecked" name="options[]" value="${m.id}">
                                            <label for="checkbox${m.id}"></label>
                                        </span>
                                    </td>
                                    <td>${m.id}</td>
                                    <td>${m.title}</td>
                                    <td>${m.date}</td>
                                    <td>${m.descript}</td>
                                    <td><img src="${urlImg}/${m.img}" alt="" style="width: 75px; height: 115px"></td>
                                    <td>${m.src}</td>
                                    <td>${m.trail}</td>
                                    <td>${m.likecount}</td>
                                    <td>${m.rate}</td>
                                    <c:choose>
                                        <c:when test="${m.status eq 1}">
                                            <td><span class="status text-success">&bull;</span> Active</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><span class="status text-danger">&bull;</span> Suspended</td>                        
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <a href="updatemovie?mid=${m.id}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="deletemovie?mid=${m.id}" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete" style="color: ${m.status eq 1 ? 'blue': 'red'}">&#xe2e7;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <%-- footer paging --%>
                    <div class="clearfix">
                        <div class="hint-text">Showing <b>${listA.size()}</b> out of <b>${num}</b> entries</div>
                        <ul class="pagination">
                            <c:set var="c" value="1"></c:set>
                            <c:forEach begin="1" end="${endPage}" var ="i">
                                <c:choose>
                                    <c:when test="${currPage eq i}">
                                        <li id="${i}" class="page-item page-user active"><a href="managemovie?index=${i}" class="page-link">${i}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li id="${i}" class="page-item page-user"><a href="managemovie?index=${i}" class="page-link">${i}</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Add Modal HTML -->
    <div id="addMovieModall" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="insertmovie" method="post" enctype="multipart/form-data">
                    <div class="modal-header">			
                        <h4 class="modal-title">Edit Employee</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" class="form-control" name="nameinsert" required>
                        </div>
                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" class="form-control" name="dateinsert" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" class="form-control" name="descriptioninsert" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" accept="image/*" class="form-control" name="imginsert" required>
                        </div>
                        <div class="form-group">
                            <label>Source</label>
                            <input type="text" class="form-control" name="sourceinsert" required>
                        </div>
                        <div class="form-group">
                            <label>Trailer</label>
                            <input type="text" class="form-control" name="trailerinsert" required>
                        </div>
                        <div class="form-group">
                            <label>Genre</label>
                            <select name="genres" id="choices-multiple-remove-button" placeholder="Select upto 3 genres" multiple>
                                <c:forEach items="${genres_list}" var="genre">
                                    <option value="${genre.id}">${genre.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Genre</label>
                            <select name="actors" id="choices-multiple-remove-button-actor" placeholder="Select upto 5 actor" multiple>
                                <c:forEach items="${actors_list}" var="actor">
                                    <option value="${actor.id}">${actor.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select id="status" name="statusinsert" class="form-control">
                                <option value="0">Suspended</option>
                                <option value="1">Active</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Delete Modal HTML -->
    <div id="deleteListMovie" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form>
                    <div class="modal-header">						
                        <h4 class="modal-title">Delete Employee</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <p>Are you sure you want to delete these Records?</p>
                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" onclick="deleteRow()">Delete</button>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>



<style>
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }
    .table-responsive {
        margin: 30px 0;
    }
    .table-wrapper {
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        min-width: 1000px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .table-title {
        padding-bottom: 15px;
        background: #435d7d;
        color: #fff;
        padding: 16px 30px;
        min-width: 100%;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }
    .table-title .btn-group {
        float: right;
    }
    .table-title .btn {
        color: #fff;
        float: right;
        font-size: 13px;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }
    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }
    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    table.table tr th:first-child {
        width: 60px;
    }
    table.table tr th:last-child {
        width: 100px;
    }
    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }
    table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
    }
    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
        outline: none !important;
    }
    table.table td a:hover {
        color: #2196F3;
    }
    table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {
        background: #0397d6;
    }
    .pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
    /* Custom checkbox */
    .custom-checkbox {
        position: relative;
    }
    .custom-checkbox input[type="checkbox"] {
        opacity: 0;
        position: absolute;
        margin: 5px 0 0 3px;
        z-index: 9;
    }
    .custom-checkbox label:before{
        width: 18px;
        height: 18px;
    }
    .custom-checkbox label:before {
        content: '';
        margin-right: 10px;
        display: inline-block;
        vertical-align: text-top;
        background: white;
        border: 1px solid #bbb;
        border-radius: 2px;
        box-sizing: border-box;
        z-index: 2;
    }
    .custom-checkbox input[type="checkbox"]:checked + label:after {
        content: '';
        position: absolute;
        left: 6px;
        top: 3px;
        width: 6px;
        height: 11px;
        border: solid #000;
        border-width: 0 3px 3px 0;
        transform: inherit;
        z-index: 3;
        transform: rotateZ(45deg);
    }
    .custom-checkbox input[type="checkbox"]:checked + label:before {
        border-color: #03A9F4;
        background: #03A9F4;
    }
    .custom-checkbox input[type="checkbox"]:checked + label:after {
        border-color: #fff;
    }
    .custom-checkbox input[type="checkbox"]:disabled + label:before {
        color: #b8b8b8;
        cursor: auto;
        box-shadow: none;
        background: #ddd;
    }
    /* Modal styles */
    .modal .modal-dialog {
        max-width: 400px;
    }
    .modal .modal-header, .modal .modal-body, .modal .modal-footer {
        padding: 20px 30px;
    }
    .modal .modal-content {
        border-radius: 3px;
        font-size: 14px;
    }
    .modal .modal-footer {
        background: #ecf0f1;
        border-radius: 0 0 3px 3px;
    }
    .modal .modal-title {
        display: inline-block;
    }
    .modal .form-control {
        border-radius: 2px;
        box-shadow: none;
        border-color: #dddddd;
    }
    .modal textarea.form-control {
        resize: vertical;
    }
    .modal .btn {
        border-radius: 2px;
        min-width: 100px;
    }
    .modal form label {
        font-weight: normal;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        // Activate tooltip
        $('[data-toggle="tooltip"]').tooltip();

        // Select/Deselect checkboxes
        var checkbox = $('table tbody input[type="checkbox"]');
        $("#selectAll").click(function () {
            if (this.checked) {
                checkbox.each(function () {
                    this.checked = true;
                });
            } else {
                checkbox.each(function () {
                    this.checked = false;
                });
            }
        });
        checkbox.click(function () {
            if (!this.checked) {
                $("#selectAll").prop("checked", false);
            }
        });
    });

    function deleteRow() {
        var checkedElements = document.querySelectorAll('.Rowchecked:checked');

        var checkedValues = [];

        checkedElements.forEach(function (element) {
            checkedValues.push(element.value);
        });
        var queryString = checkedValues.join(',');
        window.location = "deletelistmovie?listmovie=" + encodeURIComponent(queryString);

    }

    $(document).ready(function () {

        var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
            removeItemButton: true,
            maxItemCount: 3,
            searchResultLimit: 10,
            renderChoiceLimit: 10
        });
    });
    $(document).ready(function () {

        var multipleCancelButton = new Choices('#choices-multiple-remove-button-actor', {
            removeItemButton: true,
            maxItemCount: 5,
            searchResultLimit: 10,
            renderChoiceLimit: 10
        });
    });


</script>
</html>