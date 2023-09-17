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

public class UpdateData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Ambil data dari form editData.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");

        // Update data ke database (proses Update)
        boolean isSuccess = updateData(id, name, phone_number, address);

        if (isSuccess) {
            // Redirect ke halaman panel.jsp jika data berhasil diupdate
            response.sendRedirect("panel.jsp");
        } else {
            // Jika terjadi kesalahan, tampilkan pesan error di halaman editData.jsp
            response.getWriter().println("Error: Failed to update data.");
        }
    }

    private boolean updateData(int id, String name, String phone_number, String address) {
        try {
            Connection conn = DBKoneksi.open();
            String sql = "UPDATE record_tb SET Name=?, Phone_Number=?, Address=? WHERE id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone_number);
            statement.setString(3, address);
            statement.setInt(4, id);

            int rowsAffected = statement.executeUpdate();

            // Tutup sumber daya
            statement.close();
            conn.close();

            // Jika ada baris yang terpengaruh, berarti data berhasil diupdate di database
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Tambahkan perintah berikut untuk melihat pesan kesalahan secara detail
            System.out.println("Error Message: " + e.getMessage());
            return false;
        }
    }
}
