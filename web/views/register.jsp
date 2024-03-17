<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Registration Page</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .btn-custom {
            background-color: #dd003f; /* Choose your desired color */
            color: #ffffff; /* Text color */
            border: none;
        }

        .btn-custom:hover {
            background-color: #e64a19; /* Change the color on hover if needed */
        }
        .form-label {
            font-family: 'Dosis', sans-serif;
            font-size: 14px;
            color: #222222;
            font-weight: bold;
            text-transform: uppercase;
        }
        .col-12 .card .card-body h2 {
            font-family: 'Dosis', sans-serif;
            font-size: 36px;
            color: #222222;
            font-weight: 700;
            text-transform: uppercase;
        }
        .d-flex button {
            font-family: 'Dosis', sans-serif;
            font-size: 14px;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
            border: none;
            background-color: #dd003f;
            height: 42px;
            width: 100%;
            cursor: pointer;
        }

        .form-outline input {
            font-family: 'Dosis', sans-serif;
            font-size: 14px;
            color: #222222;
            font-weight: bold;
            margin-top: 10px;
            height: 42px;
            border: 1px solid #e1e1e1;
        }


    </style>
    <body>

        <section class="vh-100 bg-image"
                 style="background-image: url('images/uploads/slider-bg2.jpg');">
            <div class="mask d-flex align-items-center h-100">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Create an account</h2>
                                    <form action="register" method="post">
                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="name"/>
                                            <label class="form-label" for="form3Example1cg">Name</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example3cg" class="form-control form-control-lg" name="username"/>
                                            <label class="form-label" for="form3Example3cg">Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="email" id="form3Example4cg" class="form-control form-control-lg" name="email"/>
                                            <label class="form-label" for="form3Example4cg">Email</label>
                                            <c:if  test="${msg ne null}">
                                                <c:out value="${msg}"></c:out>
                                            </c:if>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="form3Example4cdg" class="form-control form-control-lg" name="password"/>
                                            <label class="form-label" for="form3Example4cdg">Password</label>
                                        </div>

                                        <div class="form-check d-flex mb-5">
                                            <input class="form-check-input me-2" type="checkbox" id="form2Example3g" value=""/>
                                            <label class="form-check-label" for="form2Example3g">
                                                I agree to all statements in
                                                <a href="#!" class="text-body"><u>Terms of service</u></a>
                                            </label>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit" class="btn btn-success btn-custom btn-block btn-lg">Register</button>
                                        </div>
                                        <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login" class="fw-bold text-body"><u>Login here</u></a></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </body>
</html>
