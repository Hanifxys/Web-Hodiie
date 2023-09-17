package Servlet;
import Connection.DBKoneksi;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Status extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketNumber = request.getParameter("ticketNumber");

        // Menggunakan kelas DBKoneksi untuk mendapatkan koneksi database
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String status = "";

        try {
            conn = DBKoneksi.open();
            String sql = "SELECT Status FROM record_tb WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, ticketNumber);
            rs = stmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("Status");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("document.getElementById('statusValue').innerText = '" + status + "';");
                out.println("</script>");
            } else {
                status = "Nomor tiket tidak ditemukan";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            status = "Error saat mengakses database";
        } finally {
            // Menutup koneksi, statement, dan result set
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Redirect ke halaman yang sama dengan status sebagai parameter query
        response.sendRedirect("status.jsp?status=" + status);
    }
}


