<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Meca City Cab Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- Google Fonts for Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #1a1a1a, #003366);
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }
        .login_main_wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login_form_wrapper {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .login_form_wrapper h2 {
            color: #00ffcc;
            font-weight: 700;
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: #fff;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            box-shadow: 0 0 10px rgba(0, 255, 204, 0.5);
        }
        .btn-primary {
            background: #00ffcc;
            border: none;
            color: #1a1a1a;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background: #00ccaa;
            transform: scale(1.05);
        }
        .login_image_wrapper img {
            max-width: 100%;
            border-radius: 15px;
            animation: float 5s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
    </style>
</head>
<body>
    <input type="hidden" id="Response" value="<%=request.getAttribute("Response")%>">
    <div class="login_main_wrapper">
        <!-- Body Section -->
        <div class="page_body_main_wrapper">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-6">
                        <div class="login_form_wrapper p-5">
                            <h2 class="mb-4 text-center">Login to Mega Cab Service</h2>
                            <p class="text-muted text-center mb-4">Enter the future of cab services</p>
                            <form id="loginForm" action="Login" method="get">
                                <div class="mb-3">
                                    <label for="username" class="form-label">User Name</label>
                                    <input type="text" name="name" id="username" class="form-control" placeholder="Enter your username" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" name="pass" id="password" class="form-control" placeholder="Enter your password" required>
                                </div>
                                <div class="mb-3 text-end">
                                    <a href="forgot.jsp" class="text-decoration-none text-info">Forgot Password?</a>
                                </div>
                                <div class="mb-3 text-center">
                                    <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-decoration-none text-info">Register</a></p>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" id="loginBtn" class="btn btn-primary btn-lg">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 d-none d-md-block">
                        <div class="login_image_wrapper text-center">
                            <img src="assert/logo.jpg" alt="Futuristic Cab" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script>
        $(document).ready(function () {
            const response = $("#Response").val();
            if (response === "success") {
                Swal.fire({
                    title: "Welcome to Meca City!",
                    text: "You have successfully logged in.",
                    icon: "success",
                    confirmButtonColor: "#00ffcc",
                }).then(() => {
                    window.location.href = "index.jsp"; // Redirect after success
                });
            } else if (response === "failed") {
                Swal.fire({
                    title: "Access Denied!",
                    text: "Invalid username or password.",
                    icon: "error",
                    confirmButtonColor: "#ff4444",
                });
            }
        });
    </script>
</body>
</html>