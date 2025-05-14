<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Ratings | Taxi Service</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }

        h2 {
            color: #3498db;
            margin-top: 30px;
        }

        .search-bar {
            display: flex;
            margin-bottom: 30px;
        }

        .search-bar input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
            font-size: 16px;
        }

        .search-bar button {
            padding: 10px 20px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }

        .search-bar button:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Driver Ratings</h1>

    <div class="search-bar">
        <input type="text" placeholder="Search drivers by name or ID...">
        <button>Search</button>
    </div>

    <h2>Search Results</h2>
</div>
</body>
</html>