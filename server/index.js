const express = require('express');
const app = express();

// Catch the injected variables from start.sh
const PORT = process.env.PORT || 3000;
const SERVER_NAME = process.env.SERVER_NAME || 'Unknown Server';

app.get('/', (req, res) => {
    // Dynamically insert the SERVER_NAME into the web page
    res.send(`
        <!DOCTYPE html>
        <html>
        <head>
            <title>Load Balancer Test</title>
            <style>
                body { 
                    font-family: Arial, sans-serif; 
                    display: flex; 
                    justify-content: center; 
                    align-items: center; 
                    height: 100vh; 
                    background-color: #f4f4f9; 
                    margin: 0;
                }
                .container { 
                    text-align: center; 
                    background: #ffffff; 
                    padding: 40px; 
                    border-radius: 10px; 
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
                }
                h1 { color: #333; font-size: 2.5rem; margin-bottom: 10px; }
                .server-badge { 
                    display: inline-block;
                    background: #007bff; 
                    color: white; 
                    padding: 10px 20px; 
                    border-radius: 5px; 
                    font-size: 20px; 
                    font-weight: bold;
                    margin-top: 15px;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Hello from ${SERVER_NAME}!</h1>
                <p>Nginx successfully routed your traffic here.</p>
                <div class="server-badge">Internal Port: ${PORT}</div>
            </div>
        </body>
        </html>
    `);
});

// Start the server
app.listen(PORT, () => {
    console.log(`${SERVER_NAME} is active and listening on port ${PORT}`);
});