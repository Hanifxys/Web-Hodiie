<%-- 
    Document   : panel
    Created on : Jul 26, 2023, 1:24:49 PM
    Author     : taufi
--%>

<%@page import="Connection.DBKoneksi"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="assets/panelstyle.css">
</head>
<body>
    <h1>Panel Admin</h1>

    <table id="data-table">
        <thead>
            <tr>
                <th class="table-header">Id</th>
                <th class="table-header">Name</th>
                <th class="table-header">Phone Number</th>
                <th class="table-header">Address</th>
                <th class="table-header">Hoodie Name</th>
                <th class="table-header">Hoodie Size</th>
                <th class="table-header">Total Order</th>
                <th class="table-header">Payment</th>
                <th class="table-header">Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection conn = DBKoneksi.open();
                    Statement statement = conn.createStatement();
                    String sql = "SELECT * FROM record_tb";
                    ResultSet rs = statement.executeQuery(sql);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("Name") %></td>
                <td><%= rs.getString("Phone_Number") %></td>
                <td><%= rs.getString("Address") %></td>
                <td><%= rs.getString("Hoodie_Name") %></td>
                <td><%= rs.getString("Hoodie_Size") %></td>
                <td><%= rs.getString("Total_Order") %></td>
                <td><%= rs.getString("Payment") %></td>
                <td>
                    <button class="edit-btn">
                        <a href="editData.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                    </button>
                    <button class="delete-btn">
                        <a href="#" onclick="confirmDelete(<%= rs.getInt("id") %>)">Delete</a>
                    </button>
                </td>
            </tr>
            <%
                    }

                    rs.close();
                    statement.close();
                    conn.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
        <script>
            function confirmDelete(id) {
                var result = confirm("Are you sure you want to delete this record?");
                if (result) {
                    window.location.href = "DeleteData?id=" + id;
                }
            }
        </script>
    </table>
</body>
</html>
