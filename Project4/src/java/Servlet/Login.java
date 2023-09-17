/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Connection.DBKoneksi;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Ambil data login dari form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validasi data login dengan data di database
        boolean isValid = validateLogin(username, password);

        if (isValid) {
            // Jika login berhasil, simpan informasi pengguna dalam sesi (session)
            request.getSession().setAttribute("username", username);

            // Redirect ke halaman selamat datang
            response.sendRedirect("panel.jsp");
        } else {
            // Jika login gagal, tambahkan parameter error ke URL dan redirect ke halaman login.jsp
            String errorMessage = "Invalid username or password.";
            response.sendRedirect("login.jsp?error=true&message=" + URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }

    private boolean validateLogin(String username, String password) {
        try {
            Connection conn = DBKoneksi.open();
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            boolean isValid = rs.next();

            // Tutup sumber daya
            rs.close();
            statement.close();
            conn.close();

            return isValid;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

