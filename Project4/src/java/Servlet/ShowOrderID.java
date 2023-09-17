package Servlet;

import Connection.DBKoneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowOrderID extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");

        try {
            Connection conn = DBKoneksi.open();
            String sql = "SELECT MAX(id) FROM record_tb";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            int orderId = -1;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            statement.close();
            conn.close();
            
            response.getWriter().write(String.valueOf(orderId)); // Mengirimkan ID pesanan sebagai respon
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("-1"); // Mengirimkan nilai -1 jika terjadi kesalahan
        }
    }
}
