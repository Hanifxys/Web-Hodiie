<%-- 
    Document   : index
    Created on : Jul 26, 2023, 6:28:10 AM
    Author     : taufi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <link rel="shortcut icon" href="assets/images/Logo/Logo.png">
    <title>Website Elegant Hodiie</title>
    <link rel="stylesheet" href="assets/style.css" />
  
  </head>
  <body>
    <nav>
<div class="navbar">
  <div class="menu-toggle">
    <i class="fa fa-bars"></i>
  </div>
  <ul class="navbar-menu">
    <li><a href="#Home">Home</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="login.jsp">Admin</a></li>
    <li><a href="cart.jsp">Order</a></li>
    <li><div class="menu-close">
      <i class="fa fa-times"></i>
    </div></li>
  </ul>
</div>


<script>
  const menuToggle = document.querySelector('.menu-toggle');
  const navbarMenu = document.querySelector('.navbar-menu');
  const menuClose = document.querySelector('.navbar-menu .menu-close');
   
  menuToggle.addEventListener('click', () => {
    navbarMenu.classList.toggle('open');
  });

  menuClose.addEventListener('click', () => {
    navbarMenu.classList.remove('open');
  });
</script>

    </nav>
    <header>
      <div class="header-content">
        <h1 class="main-headings">
          Stay cozy<br/>
          <span>Look awesome</span>
        </h1>
        <p class="primary-headings">
          Elevate your style with our elegant hoodies. Experience the perfect fusion of sophistication and comfort. Redefine your wardrobe with timeless elegance
        </p>
        <div class="btns-container">
            <button class="btn-fill"><a href="cart.jsp">Order Now</a></button>
          <button class="btn-outline active">50% OFF</button>
        </div>
      </div>
      <div class="img-container">
        <div class="header-img"></div>
      </div>
    </header>
    <section id="home"  class="home">
      <!-- Your home section content goes here -->
    </section>

    <section class="section-one">
      <div class="img-container">
        <div class="section-one-img header-img"></div>
      </div>

      <div class="section-content">
        <h1 class="main-headings">
          Summer <span>Sell <br /> Offer</span> 
          
        </h1>
        <p class="primary-headings">
        At Elegant Hodiie, we take pride in offering high-quality hoodies that are designed to exceed your expectations. Our hoodies are not just ordinary garments; they are crafted with meticulous attention to detail to ensure maximum comfort, style, and durability. 
        </p>
        <button class="btn-fill"><a href="cart.jsp">Checkout Now</a></button>
        </div>
      </div>
    </section>


    <section id="Product" class="products">
      <h1 class="products-heading">OUR PRODUCTS</h1>
    

      <section class="product-categories">
        <button class="btn-outline active">Catalog Product</button>
      </section>

      <div class="product-items-container">
        <div class="item">
          <div class="item-layer">
            <img src="assets/images/Product/1.png" onclick="openPopup(this.src)">
          </div>
        
          <div id="popup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <img id="popupImage">
          </div>
        
          <script src="assets/app.js"></script>
        <h4 class="item-name">Red Hoodie</h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Elegant hoodie with a slim fit and premium quality fabric</li>
              <li>Material: High-quality blend of cotton and polyester</li>
              <li>Purpose: Enhancing your style with a sophisticated touch</li>
              <li>Available Sizes: S, M, L, XL</li>
              <button class="btn-fill"><a href="cart.jsp">Order here</a></button>
            </ul>
          </div>
          </ul>
        </details>
      </div>
        <div class="item">
          <div class="item-layer">
              <img src="assets/images/Product/2.png" onclick="openPopup(this.src)">
          </div>
        
          <div id="popup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <img id="popupImage">
          </div>
        
       

        <h4 class="item-name">Black Luxurious Hoodie</h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Luxurious hoodie made from soft velvet fabric with a relaxed silhouette. Adds a touch of opulence to your casual outfits.</li>
              <li>Material: Plush and comfortable velvet fabric.</li>
              <li>Purpose: Combining comfort and luxury for a cozy and fashionable look.</li>
              <li>Available Sizes: S, M, L, XL</li>
              <button class="btn-fill"><a href="cart.jsp">Order here</a></button>
            </ul>
          </div>
        </details>
      </div>
        <div class="item">
          <div class="item-layer">
              <img src="assets/images/Product/3.png" onclick="openPopup(this.src)">
          </div>
        
          <div id="popup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <img id="popupImage">
          </div>
        <h4 class="item-name">Timeless Cashmere Hoodie</h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Luxurious cashmere hoodie offering unmatched softness and warmth. A classic design for ultimate comfort.</li>
              <li>Material: High-quality cashmere fabric.</li>
              <li>Purpose: Providing luxurious comfort and timeless elegance.</li>
              <li>Sizes Available: S, M, L</li>
              <button class="btn-fill"> <a href="cart.jsp">order here</a>
            </ul>
          </div>
        </details>
      </div>
        <div class="item">
          <div class="item-layer">
              <img src="assets/images/Product/4.png" onclick="openPopup(this.src)">
          </div>
        
          <div id="popup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <img id="popupImage">
          </div>
        <h4 class="item-name">Brown Hodie</h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Luxurious hoodie made from high-quality cotton blend fabric in a rich brown color. Provides unmatched softness and warmth for ultimate comfort.</li>
              <li>Material: Premium cotton blend fabric</li>
              <li>Purpose: Combining luxurious comfort and timeless style for a sophisticated look.</li>
              <li>Sizes Available: S, M, L, XL</li>
              <button class="btn-fill"><a href="cart.jsp">Order here</a></button>
            </ul>
          </div>
        </details>
      </div>
          <div class="item">
            <div class="item-layer">
                <img src="assets/images/Product/5.png" onclick="openPopup(this.src)">
            </div>
            <div id="popup" class="popup">
              <span class="close" onclick="closePopup()">&times;</span>
              <img id="popupImage">
            </div>
        <h4 class="item-name">Street Style butterfly Woman Hodiie </h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Trendy hoodie featuring a captivating butterfly design, made from high-quality fabric. Provides ultimate comfort and style for the fashion-forward woman.</li>
              <li>Material: Premium blend of cotton and polyester</li>
              <li>Purpose: Combining street style and feminine charm for a confident and chic look.</li>
              <li>Sizes Available: S, M, L, XL</li>
              <button class="btn-fill"><a href="cart.jsp">Order Here</a></button>
            </ul>
          </div>
        </details>
      </div>
        <div class="item">
          <div class="item-layer">
              <img src="assets/images/Product/6.png" onclick="openPopup(this.src)">
          </div>
          <div id="popup" class="popup">
            <span class="close" onclick="closePopup()">&times;</span>
            <img id="popupImage">
          </div>
        <h4 class="item-name">Men's Cherry Blossoms Hoodie</h4>
        <p class="item-price"><s>Rp.300.000,00</s><strong>Rp.150.000,00</strong></p>
        <details class="item-name">
          <summary class="item-price">Details Produk</summary>
          <div class="product">
            <ul>
              <li>Luxurious hoodie featuring a captivating cherry blossoms design, crafted with high-quality cotton blend fabric. Provides unmatched comfort and warmth with a touch of nature-inspired style.</li>
              <li>Material: Premium cotton blend fabric</li>
              <li>Purpose: Combining cozy comfort and a unique fashion statement for the nature-loving trendsetter.</li>
              <li>Sizes Available: S, M, L, XL</li>
              <button class="btn-fill"><a href="cart.jsp">Order Here</a></button>
            </ul>
          </div>
        </details>
      </div>
      </div>
    </section>
    <h1 class="customers-heading">OUR CLIENT'S SAYS</h1>
    <section class="customers-reviews">

      <div class="customer">
        <div class="customer-img">
          <div class="img img-one"></div>
        </div>
     
        <h1 class="customer-name">Anna Maria</h1>
    
        <p class="customer-description">"The design of this hoodie is really cool and stylish. I love the details like the drawstring hood and the convenient front pocket. It pairs well with various outfits and adds a fashionable touch."</p>
      </div>

      <div class="customer">
        <div class="customer-img">
          <div class="img img-two"></div>
        </div>
        <h1 class="customer-name">gina</h1>

        <p class="customer-description">"This hoodie is truly high-quality. Even after multiple washes, the color remains vibrant and doesn't fade. There are no issues with the stitching or the fabric's durability, making it worth the price."
        </p>
      </div>

      <div class="customer">
        <div class="customer-img">
          <div class="img img-three"></div>
        </div>
        <h1 class="customer-name">Richard</h1>
        <p class="customer-description">"This hoodie has a great fit and is very comfortable. I appreciate how the hood provides additional coverage and protection against wind when I'm outdoors. It's a fantastic choice for outdoor activities."</p>
      </div>
    </section>
    <footer>
        <div class="container">
            <h1 class="footer-heading">Location</h1>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.246614803853!2d106.82234407380177!3d-6.362120062235717!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ec18c3e8e717%3A0x9f2283e905986b55!2sCEP%20CCIT%20FTUI!5e0!3m2!1sid!2sid!4v1690350833611!5m2!1sid!2sid" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> 
        </div>
    <div class="container">
      <section id="Contact" class="Contact"></section>
      <h1 class="footer-heading">Contact Us</h1>
      <form action="https://formspree.io/f/mbjvrgbo" method="POST">
        <div>
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name" required><br>
        </div>
    
        <div>
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br>
        </div>
    
        <div>
            <label for="message">Message:</label><br>
            <textarea id="message" name="message" rows="5" required></textarea><br>
        </div>
    
        <div>
            <input type="submit" value="Submit">
        </div>
      </form>
    </div>    
    </form>
    </div>
    </footer>
  </body>
</html>
