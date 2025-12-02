
import { useState,useEffect } from "react"
import Cim from "../Cim"

const Lenyilo=({kivalasztott,selectedYear})=>{
    const [adatok,setAdatok]=useState([])
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)

    const leToltes=async ()=>{
        try{
            const response=await fetch(Cim.Cim+"/ev")
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
            if (response.ok)
                {
                    setAdatok(data)
                    setTolt(false)
                    kivalasztott(data[0].ev_id)
                    selectedYear(data[0].ev_szam)
                }
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

    const darabol =(szoveg)=>{
        let kecske=szoveg.split(';')
        kivalasztott(kecske[0])
        selectedYear(kecske[1])
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
            <select onChange={(e)=>  darabol(e.target.value)      }>
                {adatok.map((elem,index)=>(
                    <option key={index} value={elem.ev_id + ";" + elem.ev_szam}> {elem.ev_szam} </option>
                ))}
            </select>
        </div>
    )
}
export default Lenyilo
