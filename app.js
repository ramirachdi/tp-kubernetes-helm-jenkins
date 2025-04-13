const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Hello depuis Node.js sur Kubernetes !');
});

const PORT = process.env.PORT || 80;
app.listen(PORT, () => {
    console.log(`Serveur Node.js lancé sur le port ${PORT}`);
});
