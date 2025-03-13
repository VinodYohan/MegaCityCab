<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Meca City Cab Service</title>
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
        .register_form_wrapper {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 40px;
            max-width: 800px;
            width: 100%;
            margin: 20px;
        }
        .register_form_wrapper h2 {
            color: #00ffcc;
            font-weight: 700;
            text-align: center;
            margin-bottom: 20px;
        }
        .register_form_wrapper p {
            color: #b3b3b3;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            color: #fff;
            margin-bottom: 20px;
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
            width: 100%;
            padding: 15px;
            border-radius: 10px;
        }
        .btn-primary:hover {
            background: #00ccaa;
            transform: scale(1.05);
        }
        .user_check_box {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }
        .user_check_box input {
            width: 20px;
            height: 20px;
        }
        .user_check_box p {
            color: #b3b3b3;
            font-size: 0.9rem;
        }
        .redirect_loging_page {
            text-align: center;
            margin-top: 20px;
        }
        .redirect_loging_page a {
            color: #00ffcc;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .redirect_loging_page a:hover {
            color: #00ccaa;
        }
        .register_image_wrapper {
            text-align: center;
            margin-top: 30px;
        }
        .register_image_wrapper img {
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
    <div class="login_main_wrapper">
        <!-- Body Section -->
        <div class="page_body_main_wrapper">
            <div class="register_form_wrapper">
                <h2>Create Your Account</h2>
                <p>Join the future of cab services</p>
                <form action="Register" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Customer Name</label>
                        <input type="text" name="Name" id="name" class="form-control" placeholder="Enter your name" required>
                    </div>
                    <div class="mb-3">
                        <label for="nic" class="form-label">NIC</label>
                        <input type="text" name="NIC" id="nic" class="form-control" placeholder="Enter your NIC" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" name="Address" id="address" class="form-control" placeholder="Enter your address" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="pass" id="password" class="form-control" placeholder="Enter your password" required>
                    </div>
                    <div class="user_check_box">
                        <input type="checkbox" name="agree" id="agree" required>
                        <p>I agree to receive marketing, advertising, and promotional information via email.</p>
                    </div>
                    <div class="redirect_loging_page">
                        <p>Already have an account? <a href="login.jsp">Login here</a></p>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                </form>
            </div>
            <div class="register_image_wrapper">
                <img src="assert/logo.jpg" alt="Futuristic Cab">
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
                    text: "Your account has been successfully created.",
                    icon: "success",
                    confirmButtonColor: "#00ffcc",
                }).then(() => {
                    window.location.href = "index.jsp"; // Redirect after success
                });
            } else if (response === "failed") {
                Swal.fire({
                    title: "Registration Failed!",
                    text: "Please check your details and try again.",
                    icon: "error",
                    confirmButtonColor: "#ff4444",
                });
            }
        });
    </script>
</body>
</html>