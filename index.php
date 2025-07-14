<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Platform Grid</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <h1>Available Platforms</h1>
    <div id="grid" class="grid-container"></div>

    <script>
        fetch('get_data.php')
            .then(response => response.json())
            .then(data => {
                const grid = document.getElementById('grid');
                data.forEach(platform => {
                    const div = document.createElement('div');
                    div.className = 'card';
                    div.innerHTML = `
                        <img src="${platform.logo}" alt="${platform.name}" />
                        <h3>${platform.name}</h3>
                        <p>${platform.description}</p>
                    `;
                    grid.appendChild(div);
                });
            })
            .catch(err => {
                document.getElementById('grid').innerText = 'Failed to load data.';
                console.error(err);
            });
    </script>
</body>
</html>
