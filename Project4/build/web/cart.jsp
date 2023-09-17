<%-- 
    Document   : cart
    Created on : Jul 26, 2023, 1:22:45 PM
    Author     : taufi
--%>
<%@page import="Connection.DBKoneksi"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="Servlet.ShowOrderID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/cartstyle.css">
</head>
<body>
    <form action="Cart" method="post" id="orderForm">
        <table class="center">  
            <tr><td>Name:</td><td><input type="text" name="name" placeholder="Your Name" required/></td></tr>
        <tr><td>Phone Number:</td><td><input type="text" name="phone_number" placeholder="Phone Number" required/></td></tr>
        <tr><td>Address:</td><td><input type="text" name="address" placeholder="Addres" required/></td></tr>
        <tr><td>Hoodie Name:</td>
                <td>
                    <select name="hoodie" id="hoodie" required>
                        <% 
                        try {
                            DBKoneksi obj = new DBKoneksi();
                            obj.open();
                            String sql = "SELECT * FROM product";
                            try (Connection conn = obj.con;
                                 PreparedStatement statement = conn.prepareStatement(sql);
                                 ResultSet rs = statement.executeQuery()) {

                                while (rs.next()) {
                                    String hoodieName = rs.getString("Hoodie");
                                    double hoodiePrice = rs.getDouble("Price");
                        %>
                                    <option value="<%= hoodieName %>" data-price="<%= hoodiePrice %>"><%= hoodieName %></option>
                        <% 
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </select>
                </td></tr>
        <tr><td>Hoodie Size:</td><td>
            <select name="hoodie_size" id="hoodie_size" required>
                <option value="M">M</option>
                <option value="L">L</option>
                <option value="XL">XL</option>
            </select>
        <tr><td>Quantity:</td><td><input type="number" name="total_order" id="quantity" min="1" value="1" required/></td></tr>    
        <tr><td>Total Price:</td><td><input type="number" name="total_price" id="total_price" readonly/></td></tr>    
        <tr><td>Payment:</td><td>
            <select name="payment_method">
                <optgroup label="Cash Payment">
                    <option value="cash">Cash on Delivery</option>
                </optgroup>
                <optgroup label="E-Wallet">
                    <option value="gopay">GoPay</option>
                    <option value="dana">Dana</option>
                </optgroup>
            </select>  
        <tr>
            <td colspan="2">
                <button type="submit" onclick="return showOrderIdPopup()">ORDER</button>
            </td>
        </tr>
        </table>  
    </form>
    <script>
        // Buat nomor hp
        window.onload = function() {
            var phoneNumber = document.querySelector('input[name="phone_number"]');
            phoneNumber.addEventListener('keypress', function(e) {
                if (!/\d/.test(String.fromCharCode(e.which))) {
                    e.preventDefault();
                }
            });
        }

        // Buat total order
        var hoodieElement = document.getElementById('hoodie');
        var quantityElement = document.getElementById('quantity');
        var totalPriceElement = document.getElementById('total_price');

        hoodieElement.addEventListener('change', updateTotalPrice);
        quantityElement.addEventListener('input', updateTotalPrice);

        function updateTotalPrice() {
            var hoodieName = hoodieElement.value;
            var quantity = parseFloat(quantityElement.value);

            // Mengambil harga dari hoodie yang dipilih dari opsi-opsi yang ada
            var hoodiePrice = 0;
            var options = hoodieElement.options;
            for (var i = 0; i < options.length; i++) {
                if (options[i].value === hoodieName) {
                    hoodiePrice = parseFloat(options[i].getAttribute('data-price'));
                    break;
                }
            }

            var totalPrice = hoodiePrice * quantity;
            totalPriceElement.value = totalPrice.toString();
        }

        updateTotalPrice();

    function showOrderIdPopup() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var orderId = parseInt(xhr.responseText); // Mengubah orderId menjadi tipe data integer
                    alert("Pesanan Anda berhasil diproses. No. Ticket kamu: " + (orderId + 1) + "\nHarap di catat untuk melakukan konfirmasi");
                } else {
                    alert("Terjadi kesalahan saat memproses pesanan.");
                }
            }
        };
        xhr.open("GET", "ShowOrderID", true);
        xhr.send();
        return true; // Pastikan mengembalikan true agar form dapat dikirimkan ke servlet.
    }

    </script>
</body>
</html>