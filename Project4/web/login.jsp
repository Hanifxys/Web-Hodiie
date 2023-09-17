<%-- 
    Document   : login
    Created on : Jul 26, 2023, 6:42:12 AM
    Author     : taufi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    />
    <link rel="stylesheet" href="assets/loginstyle.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
      rel="stylesheet"
    />
    <title>Panel Login</title>
  </head>
  <body>
    <section class="main">
      <div class="login-container">
        <p class="title">Elegant Hoodie</p>
        <div class="separator"></div>
        <p class="welcome-message">Login to access panel</p>

        <form class="login-form" action="Login" method="post"> <!-- Tambahkan action dan method pada form -->
            
            <div class="form-control">
                <input type="text" placeholder="Username" name="username"/> <!-- Tambahkan atribut name pada input username -->
                <i class="fas fa-user"></i>
            </div>
            <div class="form-control">
                <input type="password" placeholder="Password" name="password"/> <!-- Tambahkan atribut name pada input password -->
                <i class="fas fa-lock"></i>
            </div>

            <button type="submit" class="submit">Login</button> <!-- Tambahkan type="submit" pada tombol login -->
        </form>
      </div>
    </section>
    <script>
        function showErrorPopup(message) {
            alert(message);
        }

        // Fungsi untuk mengambil parameter dari URL (digunakan untuk mendapatkan pesan error dari servlet)
        function getParameterByName(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        // Cek apakah ada parameter error di URL
        const error = getParameterByName('error');

        // Jika ada parameter error, tampilkan popup pesan error
        if (error === 'true') {
            const message = decodeURIComponent(getParameterByName('message'));
            showErrorPopup(message);
        }
    </script>
  </body>
</html>

