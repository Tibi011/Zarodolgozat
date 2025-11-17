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
    //Évek lekérdezése
    //Feladatok lekérdezése év id alapján (POST)
    
    app.post('/feladatKerdezId', (req, res) => {
        const {feladat_ev} =req.body
        const sql=`
                    select *
                    from feladat
                    where feladat.feladat_ev= ?
                    `
        pool.query(sql,[feladat_ev], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).json({error:"Hiba"})
        }
        if (result.length===0){
            return res.status(404).json({error:"Nincs adat"})
        }

        return res.status(200).json(result)
        })
})

    //Bogi backend


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


