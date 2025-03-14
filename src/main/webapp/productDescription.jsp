<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cab Description - MegaCityCab</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts for Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #1a1a1a, #003366);
            font-family: 'Poppins', sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .page_main_wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .page_header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 20px;
        }
        .page_header_sub_wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }
        .company_logo h1 {
            color: #00ffcc;
            font-weight: 700;
            margin: 0;
        }
        .user_indicator {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .user_indicator img {
            width: 25px;
            height: 25px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .user_indicator img:hover {
            transform: scale(1.1);
        }
        .user_indicator a {
            color: #00ffcc;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .user_indicator a:hover {
            color: #00ccaa;
        }
        .page_body {
            flex: 1;
            padding: 40px 20px;
        }
        .p_des_main_wrapper {
            display: flex;
            gap: 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .left_p_dec {
            flex: 1;
        }
        .item_image img {
            width: 100%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
        }
        .right_p_dec {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .r_item_name {
            color: #00ffcc;
            font-weight: 700;
            margin: 0;
        }
        .r_price_wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .r_price_wrapper p {
            color: #fff;
            font-weight: 600;
            margin: 0;
        }
        .r_price_wrapper button {
            background: #00ffcc;
            border: none;
            color: #1a1a1a;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s ease, transform 0.3s ease;
        }
        .r_price_wrapper button:hover {
            background: #00ccaa;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="page_main_wrapper">
        <!-- Header Section -->
        <div class="page_header">
            <div class="page_header_sub_wrapper">
                <div class="company_logo">
                    <h1>MegaCityCab</h1>
                </div>
                <div class="user_indicator">
                    <img src="assert/online-shopping.png" width="25" height="25" alt="Shopping Cart">
                    <img src="assert/heart.png" width="25" height="25" alt="Wishlist">
                    <img src="assert/user.png" width="25" height="25" alt="User">
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>

        <!-- Body Section -->
        <div class="page_body">
            <div class="p_des_main_wrapper">
                <%
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    int vehicleId = Integer.parseInt(request.getParameter("id"));
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        String query = "SELECT * FROM vehicles WHERE vehicle_id = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, vehicleId);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");
                            String name = rs.getString("vehicle_name");
                            String number = rs.getString("vehicle_number");
                            String type = rs.getString("vehicle_type");
                            
                            // Convert image BLOB to base64 for display
                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>
                <div class="left_p_dec">
                    <div class="item_image">
                        <img src="<%= base64Image %>" width="100%" height="100%" alt="Vehicle Image">
                    </div>
                </div>
                <div class="right_p_dec">
                    <p class="r_item_name"><%= model %></p>
                    <p class="r_item_name"><%= name %></p>
                    <p class="r_item_name"><%= type %></p>
                    <div class="r_price_wrapper">
                        <p>LKR <%= price %></p>
                    </div>
                    <div class="r_price_wrapper">
                        <a href="chekout.jsp?id=<%= request.getParameter("id") %>">
                            <button>Rent Now</button>
                        </a>
                    </div>
                </div>
                <%
                        } else {
                            out.println("<p>Vehicle not found.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>