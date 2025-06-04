#!/bin/bash
# Update and install Apache
sudo apt update -y
sudo apt install apache2 -y

# Create the custom index.html with dynamic server details in the top left corner
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delicious Food Items</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(to bottom, #ffefba, #ffffff);
      color: #333;
    }
    header {
      background-color: #ff6347;
      color: white;
      padding: 20px 0;
      text-align: center;
      font-size: 2rem;
      font-weight: bold;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    /* Server details positioned at top left */
    .server-details {
      position: absolute;
      top: 10px;
      left: 10px;
      background: rgba(255,255,255,0.8);
      padding: 10px;
      border: 1px solid #ccc;
      font-size: 0.9rem;
      z-index: 1000;
    }
    .food-gallery {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      padding: 20px;
      gap: 30px;
    }
    .food-item {
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s, box-shadow 0.3s;
      width: 300px;
    }
    .food-item:hover {
      transform: scale(1.05);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    .food-item img {
      width: 100%;
      height: auto;
    }
    .food-item h2 {
      margin: 10px;
      font-size: 1.5rem;
      color: #ff6347;
    }
    .food-item p {
      margin: 10px;
      color: #555;
      font-size: 1rem;
    }
    footer {
      margin-top: 30px;
      text-align: center;
      padding: 10px;
      background: #ff6347;
      color: white;
      font-size: 1rem;
    }
    .scroll-container {
      max-height: 80vh;
      overflow-y: auto;
    }
  </style>
</head>
<body>
  <!-- Dynamic Server Details Block -->
  <div class="server-details">
    <h3>Server Details</h3>
    <p><strong>Hostname:</strong> $(hostname)</p>
    <p><strong>IP Address:</strong> $(hostname -I | cut -d' ' -f1)</p>
  </div>
  <header>Delicious Food Items</header>
  <div class="scroll-container">
    <div class="food-gallery">
      <div class="food-item">
        <img src="https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg" alt="Pizza">
        <h2>Pizza</h2>
        <p>A classic Italian delight with a crispy crust, rich tomato sauce, and melted cheese.</p>
      </div>
      <div class="food-item">
        <img src="https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg" alt="Burger">
        <h2>Burger</h2>
        <p>Golden, crispy, and packed with juicy flavor, a true comfort food classic.</p>
      </div>
      <div class="food-item">
        <img src="https://images.pexels.com/photos/461430/pexels-photo-461430.jpeg" alt="Ice Cream">
        <h2>Ice Cream</h2>
        <p>Cold, creamy, and perfect for satisfying your sweet tooth on a sunny day.</p>
      </div>
      <div class="food-item">
        <img src="https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg" alt="French Fries">
        <h2>French Fries</h2>
        <p>Golden, crispy, and packed with juicy flavor.</p>
      </div>
      <div class="food-item">
        <img src="https://images.pexels.com/photos/461326/pexels-photo-461326.jpeg" alt="Poha">
        <h2>Poha</h2>
        <p>Soft, spongy, and full of flavors with olives.</p>
      </div>
      <div class="food-item">
        <img src="https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg" alt="Salad">
        <h2>Salad</h2>
        <p>Fresh, vibrant, and packed with healthy greens and veggies.</p>
      </div>
    </div>
  </div>
  <footer>Made with ❤️ by Food Lovers</footer>
</body>
</html>
EOF

# Restart Apache to ensure changes take effect
sudo systemctl restart apache2

sudo apt-get install git
sudo apt install curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh