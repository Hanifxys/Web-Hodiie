<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Connection.DBKoneksi" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data</title>
    <link rel="stylesheet" href="assets/editStyle.css">
</head>
<body>
    <div class="center">
        <h2>Edit Data</h2>
        <form action="UpdateData" method="post">
            <%-- Ambil nilai id dari parameter URL --%>
            <% String idParam = request.getParameter("id");
               int id = Integer.parseInt(idParam);

               // Buat variabel untuk menyimpan data dari database
               String name = "";
               String phone_number = "";
               String address = "";
               String hoodie_name = "";
               String hoodie_size = "";
               String total_order = "";
               String payment = "";

               try {
                   // Koneksi ke database dan ambil data berdasarkan id
                   Connection conn = DBKoneksi.open();
                   String sql = "SELECT * FROM record_tb WHERE id=?";
                   PreparedStatement statement = conn.prepareStatement(sql);
                   statement.setInt(1, id);
                   ResultSet rs = statement.executeQuery();

                   // Jika data dengan id yang sesuai ditemukan, ambil nilainya
                   if (rs.next()) {
                       name = rs.getString("Name");
                       phone_number = rs.getString("Phone_Number");
                       address = rs.getString("Address");
                       hoodie_name = rs.getString("Hoodie_Name");
                       hoodie_size = rs.getString("Hoodie_Size");
                       total_order = rs.getString("Total_Order");
                       payment = rs.getString("Payment");
                   }

                   // Tutup sumber daya
                   rs.close();
                   statement.close();
                   conn.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
            %>
            <input type="hidden" name="id" value="<%= id %>">
            <table>  
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value="<%= name %>"/></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" name="phone_number" value="<%= phone_number %>"/></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" value="<%= address %>"/></td>
                </tr>
                <%-- Tambahkan input fields untuk data lainnya sesuai kebutuhan --%>
            </table>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
