import { useState,useEffect } from "react"
import Cim from "../Cim"
import Modosit from "../FeladatModosit/Modosit"
import LenyiloEvAlap from "./LenyiloEvAlap"




const FeladatEvesTorles=()=>{
    const [adatok,setAdatok]=useState([])
    const [adatokEv,setAdatokEv]=useState([])
    const [beSzoveg,setBeSzoveg]=useState("")
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)
    const [siker,setSiker]=useState(false)
    const [talalat,setTalalat]=useState(false)
    const [kivalasztott,setKivalasztott]=useState(1)

     const [kivalasztottEv,setKivalasztottEv]=useState(1)

const modositasFuggveny=async (feladat_id,feledat_kerdes)=>{
    //alert(feladat_id)
    setKivalasztott(feladat_id)
     setTalalat(true)
}

//szöveg

const keres=async ()=>{
    alert(kivalasztottEv)
//szóra és évre
//if (beSzoveg !== "" && kivalasztottEv !== 0)
        try{
            let bemenet={
                "feladat_kerdes":beSzoveg,
                "ev": kivalasztottEv
            }
            const response=await fetch(Cim.Cim+"/kerdesKeresEv",{
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




//csak ha a szóra keresünk

/*
if (beSzoveg != "" && kivalasztott == 0)
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
*/


        
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

    const leToltesEv=async ()=>{
        try{
            const response=await fetch(Cim.Cim+"/ev")
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
            if (response.ok)
                {
                    setAdatokEv(data)
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
        leToltesEv()
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
                //alert(data["message"])
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

                <div className="cim" style={{fontWeight:"bold"}}>Add meg a keresendő szót</div>
                <input
                type="text" 
                placeholder="Keresés" 
                onChange={(e)=>setBeSzoveg(e.target.value)}
            />
            <div>
                {/*<select onChange={kivalasztott}>
                    {adatokEv.map((elem, index) => (
                        <option key={index}>
                        {elem.ev_szam}
                        </option>
                    ))}
                </select>*/}
               <LenyiloEvAlap kivalasztottEv={setKivalasztottEv}/>

            </div>
            
            <br />
            <button className="btn btn-secondary mt-3 mb-3" onClick={keres}>Keresés</button>
            
            <div>
                Találatok száma: {adatok.length}
            </div>


        {talalat && <Modosit kivalasztott={kivalasztott}/>}



                <table class="table table-bordered">
                    <thead>
                        <tr> 
                            <th style={{textAlign:"center"}}>Feladat id</th>
                            <th style={{textAlign:"center"}}>Feladat kérdése</th>
                            <th style={{textAlign:"center"}}>Év</th>
                            <th style={{textAlign:"center"}}>Törlés</th>
                            <th style={{textAlign:"center"}}>Módosítás</th>
                            
                            
                        </tr> 
                    </thead>
                                         
                {adatok.map((elem,index)=>(
                    <tbody>
                        <tr key={index} > 
                        <td style={{textAlign:"center"}}>{elem.feladat_id}</td>
                        <td>{elem.feladat_kerdes}</td>
                        <td style={{textAlign:"center"}}>{elem.ev_szam}</td>

                        <td style={{textAlign:"center"}}>
                        <button
                            className="btn btn-warning"
                            onClick={()=>torlesFuggveny(elem.feladat_id,elem.feladat_kerdes,elem.ev_szam)}>
                                x
                        </button>
                        </td> 
                        <td style={{textAlign:"center"}}>
                        <button
                            className="btn btn-primary"
                            onClick={()=>modositasFuggveny(elem.feladat_id,elem.feladat_kerdes,elem.ev_szam)} >
                                Módosítás
                        </button>
                        </td>  
                    </tr>
                    </tbody>
                    
                ))}
                </table>
        </div>
    )
}
export default FeladatEvesTorles


