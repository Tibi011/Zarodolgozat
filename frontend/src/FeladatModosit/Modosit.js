

import { useState,useEffect } from "react"
import Cim from "../Cim"

const Modosit=({kivalasztott})=>{

    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)
    
    const [modFeladat,setModFeladat]=useState(null)

    const [siker,setSiker]=useState(" ")
    const [helyes,setHelyes]=useState(true)

    //adatok módosítása- jatekModosit backend végpont hívása
    const adatModosit=async (e)=>{
        e.preventDefault()

        const bemenet={
            "feladat_kerdes":modFeladat.feladat_kerdes,
            "feladat_a":modFeladat.feladat_a,
            "feladat_b":modFeladat.feladat_b,
            "feladat_c":modFeladat.feladat_c,
            "feladat_d":modFeladat.feladat_d,
            "feladat_e":modFeladat.feladat_e,
            "feladat_f":modFeladat.feladat_f,
            "feladat_helyes":modFeladat.feladat_helyes,
            "feladat_ev":modFeladat.feladat_ev,
            "feladat_tema":modFeladat.feladat_tema

        }
        try{
        const response=await fetch(Cim.Cim+"/feladatModosit/"+kivalasztott,{
                method: "put",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(bemenet)
            })
        const data=await response.json()
        //alert(JSON.stringify(data))
        if (response.ok){
            setSiker(data["message"])
            setHelyes(true)

           }
        else{
            setSiker(data["error"])
            }
        }
        catch (error){
            console.log(error)

        }


    }



    useEffect(()=>{

    const leToltes=async ()=>{
        try{
            //alert(kivalasztott)
            const response=await fetch(Cim.Cim+"/feladatEgy/"+kivalasztott)
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
            if (response.ok)
                {
                    setModFeladat(data[0])
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
    },[kivalasztott])

    if (tolt)
        return (
            <div style={{textAlign:"center"}}>Adatok betöltése folyamatban...</div>
                )
    else if (hiba)
        return (
            <div>Hiba</div>
                )       
    
    else return (
        <div className="modositDoboz">
            
            <form onSubmit={adatModosit}>
            <div>
             <div style={{marginBottom:"10px",fontWeight:"bold",fontSize:20}}>Feladat módosítása</div>   
             <span style={{fontSize:15}}>Feladat kérdése: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_kerdes}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_kerdes:e.target.value})}
             />
             </div>
            <div>
             
             <span style={{fontSize:15}}>A válasz: </span>
             <input 
                
                type="text" 
                value={modFeladat.feladat_a}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_a:e.target.value})}
             />
             </div>
            <div>
               
             <span style={{fontSize:15}}>B válasz: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_b}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_b:e.target.value})}
             />
             </div>
            <div>
               
             <span style={{fontSize:15}}>C válasz:</span>
             <input 
                type="text" 
                value={modFeladat.feladat_c}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_c:e.target.value})}
             />
             </div>
            <div>
              
             <span style={{fontSize:15}}>D válasz: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_d}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_d:e.target.value})}
             />
             </div>
            <div>
              
             <span style={{fontSize:15}}>E válasz: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_e}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_e:e.target.value})}
             />
             </div>
             
            <div>
              
             <span style={{fontSize:15}}>F válasz: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_f}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_f:e.target.value})}
             />
             </div>
            <div>
              
             <span style={{fontSize:15}}>Helyes válasz: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_helyes}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_helyes:e.target.value})}
             />
             </div>
            
            <div>
              
             <span style={{fontSize:15}}>Év: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_ev}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_ev:e.target.value})}
             />
             </div>
            <div>
              
             <span style={{fontSize:15}}>Témakör: </span>
             <input 
                type="text" 
                value={modFeladat.feladat_tema}
                onChange={(e)=>setModFeladat({...modFeladat,feladat_tema:e.target.value})}
             />
             </div>


             <div>
             <button
                type="submit"
                className="btn btn-primary"
                >
                Módosítás
             </button>
             {helyes ? 
                <div style={{color:"green"}}>{siker} &nbsp;</div> 
                :  
                <div style={{color:"red"}}>{siker} &nbsp;</div> }
             </div>

            </form>


        </div>
    )
}
export default Modosit

