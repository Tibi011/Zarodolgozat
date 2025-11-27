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
    
    // Get lekérdezés év  
    app.get('/ev', (req, res) => {
        const sql=`SELECT * from ev`
        pool.query(sql, (err, result) => {
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


app.post('/evIdKeres', (req, res) => {
        const {ev_id} =req.body
        const sql=`
                select *
                from ev
                inner join feladat
                on feladat_ev = ev_id
                where ev_id=?
                `
        pool.query(sql,[ev_id], (err, result) => {
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
//keresés év alapján - POST, év név (inner join)

app.post('/evKeres', (req, res) => {
        const {ev_szam} =req.body
        const sql=`
                SELECT * 
                from ev
                inner join feladat
                on feladat_ev = ev_id
                where ev_szam = ?`
        pool.query(sql,[ev_szam], (err, result) => {
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


//keresés kérdés egy szavára - like
app.post('/kerdesKeres', (req, res) => {
        const {feladat_kerdes} =req.body
        const sql=`
                SELECT * 
                from feladat 
                where feladat.feladat_kerdes like ?   `
        pool.query(sql,[`%${feladat_kerdes}%`], (err, result) => {
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

//feladat törlés
app.delete('/feladatTorles/:feladat_id', (req, res) => {
        const {feladat_id} =req.params
        const sql=`delete from feladat where feladat_id=?`
        pool.query(sql,[feladat_id], (err, result) => {
        if (err) {
            console.log(err)
            return res.status(500).json({error:"Hiba"})
        }
       
        return res.status(200).json({message:"Sikeres törlés"})
        })
})

//Minden adat
app.get('/mindenadat', (req, res) => {
        const sql=`
                    select *
                    from feladat
                    inner join ev
                    on ev_id=feladat_ev;
                    `
        pool.query(sql, (err, result) => {
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



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})


