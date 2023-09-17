package Servlet;

import Connection.DBKoneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Ambil data dari form cart.jsp
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String hoodie = request.getParameter("hoodie");
        String hoodie_size = request.getParameter("hoodie_size");
        String total_order = request.getParameter("total_order");
        String total_price = request.getParameter("total_price");
        String payment_method = request.getParameter("payment_method");

        // Simpan data ke database (proses Create/Insert)
        addToCart(name, phone_number, address, hoodie, hoodie_size, total_order, total_price, payment_method);

        // Redirect kembali ke halaman cart.jsp setelah berhasil menambahkan item ke cart
        response.sendRedirect("status.jsp");
    }

    private void addToCart(String name, String phone_number, String address, String hoodie, String hoodie_size, String total_order, String total_price, String payment_method) {
        try {
            Connection conn = DBKoneksi.open();
            String sql = "INSERT INTO record_tb (Name, Phone_Number, Address, Hoodie_Name, Hoodie_Size, Total_Order, Total_Price, Payment, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone_number);
            statement.setString(3, address);
            statement.setString(4, hoodie);
            statement.setString(5, hoodie_size);
            statement.setString(6, total_order);
            statement.setString(7, total_price);
            statement.setString(8, payment_method);
            statement.setString(9, "Process"); // Set nilai status secara otomatis ke "Process"

            statement.executeUpdate();

            // Tutup sumber daya
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Tambahkan perintah berikut untuk melihat pesan kesalahan secara detail
            System.out.println("Error Message: " + e.getMessage());
        }
    }
}
