import { useState } from "react"
import Cim from "../Cim"

const KeresKerdes=()=>{
    const [beSzoveg,setBeSzoveg]=useState("")
    const [adatok,setAdatok]=useState([])
    const [tolt,setTolt]=useState(true)
    const [hiba,setHiba]=useState(false)

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

    return (
        <div>
            <div className="cim">Keresés kérdés alapján</div>
            <div className="keretKeres">
             <input 
                type="text" 
                placeholder="Add meg a keresendő szót"
                style={{ width: "250px" }}
                onChange={(e)=>setBeSzoveg(e.target.value)}
            />

           
            <br />
            <button className="btn btn-secondary mt-3 mb-3" onClick={keres}>Keresés</button>
             
            <div>
                Találatok száma: {adatok.length}
            </div>

            <ul>

            <table class="table table-bordered">
                <thead>
                        <tr> 
                            <th style={{textAlign:"center"}}>Feladat id</th>
                            <th style={{textAlign:"center"}}>Feladat kérdése</th>
                            <th style={{textAlign:"center"}}>Feladat év</th>
                            
                        </tr> 
                    </thead>
                {adatok.map((elem,index)=>(
                    <tbody>
                        <tr key={index} >
                            <td style={{textAlign:"center"}}>{elem.feladat_id} </td>
                            <td>{elem.feladat_kerdes} </td>
                            <td style={{textAlign:"center"}}>{elem.feladat_ev}</td>
                            
                        </tr>
                    </tbody>
                    ))}

            </table>
            </ul>
            </div>
        </div>
    )
}
export default KeresKerdes
