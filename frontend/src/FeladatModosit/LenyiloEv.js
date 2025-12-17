
import { useState,useEffect } from "react"
import Cim from "../Cim"

const LenyiloEv=({kivalasztott,kuld2})=>{
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
        //alert(kuld2)
        leToltes()
    },[kuld2])

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
            <select onChange={kivalasztott}>
                {adatok.map((elem, index) => (
                    <option key={index}>
                    {elem.ev_szam}
                    </option>
                ))}
            </select>
        </div>
    )
}
export default LenyiloEv
