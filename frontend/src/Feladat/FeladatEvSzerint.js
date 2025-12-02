

import { useState,useEffect } from "react"
import Cim from "../Cim"
import "../App.css"

const FeladatEvSzerint=({kivalasztott})=>{
    const [adatok,setAdatok]=useState([])
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)
    const gombFeliratok = ["A", "B", "C", "D", "E", "F"];



    useEffect(()=>{

    const leToltes=async ()=>{
        try{
            let bemenet={
                "ev_id":kivalasztott
            }
            const response=await fetch(Cim.Cim+"/evIdKeres",{
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(bemenet)
            })
            const data=await response.json()
            //alert(JSON.stringify(data))
            //console.log(data)
        
           if (response.ok) {
            const tomb = Array.isArray(data) ? data : [data];

             const kibovitett = tomb.map(elem => ({
            ...elem,
            gombok: elem.gombok ?? [false, false, false, false, false, false]
             }));

            setAdatok(kibovitett);
            setTolt(false);
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

        leToltes()
    },[kivalasztott])

    const gombCsere = (index, gIndex) => {
        const uj = [...adatok]
        uj[index].gombok[gIndex] = !uj[index].gombok[gIndex]
        setAdatok(uj)
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
            
                
                {/* kivalasztott */}
                {adatok.map((elem,index)=>(

                    

                    <div key={index} className="doboz"> 
                        
                        <div style={{textAlign:"center",marginTop:"20px"}}>
                            
                        </div>
                        <div>Kérdés: {elem.feladat_kerdes} </div>
                        
                        
                        
                        <div style={{ marginTop: "10px" }}>
                        {gombFeliratok.map((betu, gIndex) => (
                            <button
                                key={gIndex}
                                onClick={() => gombCsere(index, gIndex)}
                                style={{
                                    marginRight: "8px",
                                    padding: "5px 4px",
                                    cursor: "pointer",
                                    backgroundColor: elem.gombok?.[gIndex] ? "lightgreen" : "white",
                                    border: "1px solid #555",
                                    borderRadius: "4px",
                                    width: "5%"
                                }}
                            >
                                {betu}
                            </button>
                        ))}
                    </div>



                    </div>
                ))}

                
           
        </div>
    )
}
export default FeladatEvSzerint

