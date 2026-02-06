
import { useState,useEffect } from "react"
import Cim from "../Cim"

const LenyiloEvAlap=({kivalasztottEv})=>{
    const [adatok,setAdatok]=useState([])
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)

    
    
    const leToltes=async ()=>{
        try{
            const response=await fetch(Cim.Cim+"/evAdat")
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
    },[])

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
            <select onChange={(e)=>  kivalasztottEv(e.target.value)      }>
                {adatok.map((elem, index) => (
                    <option key={index}  value={elem.ev_id}>
                    {elem.ev_szam}
                    </option>
                ))}
            </select>
        </div>
    )
}
export default LenyiloEvAlap
