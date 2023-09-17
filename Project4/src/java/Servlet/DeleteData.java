package Servlet;

import Connection.DBKoneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteData extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ambil ID dari parameter URL
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);

        // Lakukan operasi penghapusan
        try {
            Connection conn = DBKoneksi.open();
            String sql = "DELETE FROM record_tb WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();

            statement.close();
            conn.close();

            // Setelah penghapusan selesai, arahkan kembali ke halaman yang menampilkan data
            response.sendRedirect("panel.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
