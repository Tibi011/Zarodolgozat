
import { useState,useEffect } from "react"
import Cim from "../Cim"

const LenyiloEv=({kivalasztottEv,kuld2})=>{
    const [adatok,setAdatok]=useState([])
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)

    
    
    
    useEffect(()=>{
        //alert(kuld2)

        const leToltes=async ()=>{
                //alert(kivalasztottEv)
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


        leToltes()
    },[kivalasztottEv,kuld2])

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
            <select 
             defaultValue={kuld2}
            onChange={(e)=>  kivalasztottEv(e.target.value)}>
                {adatok.map((elem, index) => (
                    <option value={elem.ev_id} key={elem.ev_id}>
                    {elem.ev_szam}
                    </option>
                ))}
            </select>
        </div>
    )
}
export default LenyiloEv
