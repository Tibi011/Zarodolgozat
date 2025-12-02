import { useState,useEffect } from "react"
import Cim from "../Cim"

const FeladatTorles=({kivalasztott})=>{
    const [adatok,setAdatok]=useState([])
    const [beSzoveg,setBeSzoveg]=useState("")
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)
    const [siker,setSiker]=useState(false)


const keres=async ()=>{
        try{
            let bemenet={
                "feladat_kerdes":beSzoveg
            }
            const response=await fetch(Cim.Cim+"/kerdesKeres",{
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(bemenet)
            })
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
            if (response.ok)
                {
                    setAdatok(data)
                    setTolt(false)}
            else 
                {
                    setHiba(true)
                    setTolt(false)
                }
            }
        catch (error){
            console.log(error)
            setHiba(true)
        }
        
    }


    const leToltes=async ()=>{
        try{
            const response=await fetch(Cim.Cim+"/mindenadat")
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
            if (response.ok)
                {
                    setAdatok(data)
                    setTolt(false)}
            else 
                {
                    setHiba(true)
                    setTolt(false)
                }
            }
        catch (error){
            console.log(error)
            setHiba(true)
        }
        
    }

    useEffect(()=>{
        leToltes()
    },[siker])

    const torlesFuggveny=async (feladat_id,feledat_kerdes)=>{
        //alert(feladat_id)
        const biztos=window.confirm(`Biztosan törölni szeretnéd ${feledat_kerdes}?`)
        if (biztos){
            //alert("Jó")
            const response=await fetch(Cim.Cim+"/feladatTorles/"+feladat_id,{
                    method: "delete",
                    headers: {
                        "Content-Type": "application/json"
                            }
                   })
            const data=await response.json()
            if (response.ok){
                alert(data["message"])
                setSiker(!siker)
            }
            else{
                alert(data["error"])
            }
        }
    }
    if (tolt)
        return (
            <div style={{textAlign:"center"}}>Adatok betöltése folyamatban...</div>
                )
    else if (hiba)
        return (
            <div>Hiba</div>
                )       
    
    else return (
        <div>

                <div className="cim">Add meg a keresendő szót</div>
                <input 
                onChange={(e)=>setBeSzoveg(e.target.value)}
            />
            <br />
            <button className="btn btn-secondary mt-3 mb-3" onClick={keres}>Keresés</button>
                <table class="table table-bordered">
                    <thead>
                        <tr> 
                            <th style={{textAlign:"center"}}>Feladat id</th>
                            <th style={{textAlign:"center"}}>Feladat kérdése</th>
                            <th style={{textAlign:"center"}}>Törlés</th>
                        </tr> 
                    </thead>
                                         
                {adatok.map((elem,index)=>(
                    <tbody>
                        <tr key={index} > 
                        <td style={{textAlign:"center"}}>{elem.feladat_id}</td>
                        <td>{elem.feladat_kerdes}</td>
                        <td style={{textAlign:"center"}}><button
                            className="btn btn-warning"
                            onClick={()=>torlesFuggveny(elem.feladat_id,elem.feladat_kerdes)}>
                                x
                        </button></td>  
                    </tr>
                    </tbody>
                    
                ))}
                </table>
        </div>
    )
}
export default FeladatTorles


