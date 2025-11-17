const express = require('express')
const mysql = require('mysql')
const cors = require('cors')
const app = express()
const port = 3000

app.use(cors())
app.use(express.json())

const pool = mysql.createPool({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'osztv_adatbazis'
        })

app.get('/', (req, res) => {
        res.send('Hello World!')
        })

    //Tibi backend
    

    //Bogi backend


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


