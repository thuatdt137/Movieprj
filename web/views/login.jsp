<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />

        <style>
            .form-label {
                font-family: 'Dosis', sans-serif;
                font-size: 14px;
                color: #222222;
                font-weight: bold;
                text-transform: uppercase;
            }
            body {
                font-family: 'Nunito';
            }

            .gradient-custom {
                background: #84fab0;
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
                background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
            }

            .btn-custom {
                background-color: #dd003f;
                color: #ffffff;
                border: none;
            }

            .btn-custom:hover {
                background-color: #e64a19;
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
        <title>Sign In Page</title>
    </head>
    <body>

        <section class="vh-100 bg-image"
                 style="background-image: url('images/uploads/slider-bg2.jpg');">
            <div class="mask d-flex align-items-center h-100">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Sign In</h2>
                                    <form action="login" method="post">
                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="username"/>
                                            <label class="form-label" for="form3Example1cg">Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="form3Example4cdg" class="form-control form-control-lg" name="password"/>
                                            <label class="form-label" for="form3Example4cdg">Password</label>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit" class="btn btn-custom btn-block btn-lg">Sign In</button>
                                        </div>
                                        <p class="text-center text-muted mt-5 mb-0">Don't have an account? <a href="register" class="fw-bold text-body"><u>Register here</u></a></p>
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
