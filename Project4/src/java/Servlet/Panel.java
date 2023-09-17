package Servlet;

import Connection.DBKoneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Panel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            Connection conn = DBKoneksi.open();
            String sql = "SELECT * FROM record_tb";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            List<Record> records = new ArrayList<>();

            while (rs.next()) {
                Record record = new Record();
                record.setId(rs.getInt("id"));
                record.setName(rs.getString("Name"));
                record.setPhoneNumber(rs.getString("Phone_Number"));
                record.setAddress(rs.getString("Address"));
                record.setHoodieName(rs.getString("Hoodie_Name"));
                record.setHoodieSize(rs.getString("Hoodie_Size"));
                record.setTotalOrder(rs.getString("Total_Order"));
                record.setTotalPrice(rs.getString("Total_Price"));
                record.setPayment(rs.getString("Payment"));

                records.add(record);
            }

            // Simpan list records ke dalam atribut request untuk ditampilkan di panel.jsp
            request.setAttribute("records", records);

            // Tutup sumber daya
            rs.close();
            statement.close();
            conn.close();

            // Forward ke halaman panel.jsp
            request.getRequestDispatcher("panel.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: Failed to fetch data from the database.");
        }
    }

    // Kelas Record untuk merepresentasikan data dari tabel record_tb
    public static class Record {
        private int id;
        private String name;
        private String phoneNumber;
        private String address;
        private String hoodieName;
        private String hoodieSize;
        private String totalOrder;
        private String totalPrice;
        private String payment;

        // Setter dan Getter untuk properti
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPhoneNumber() {
            return phoneNumber;
        }

        public void setPhoneNumber(String phoneNumber) {
            this.phoneNumber = phoneNumber;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getHoodieName() {
            return hoodieName;
        }

        public void setHoodieName(String hoodieName) {
            this.hoodieName = hoodieName;
        }

        public String getHoodieSize() {
            return hoodieSize;
        }

        public void setHoodieSize(String hoodieSize) {
            this.hoodieSize = hoodieSize;
        }

        public String getTotalOrder() {
            return totalOrder;
        }

        public void setTotalOrder(String totalOrder) {
            this.totalOrder = totalOrder;
        }

        public String getTotalPrice() {
            return totalPrice;
        }

        public void setTotalPrice(String totalPrice) {
            this.totalPrice = totalPrice;
        }

        public String getPayment() {
            return payment;
        }

        public void setPayment(String payment) {
            this.payment = payment;
        }
    }
}
