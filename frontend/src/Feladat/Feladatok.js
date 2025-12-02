import { useState } from 'react';
import Lenyilo from './Lenyilo';
import FeladatEvSzerint from './FeladatEvSzerint';
//import Indit from './Indit';

const Feladatok=()=>{
    const [kivalasztott,setKivalasztott]=useState(1)
    
    const [selectedYear, setSelectedYear] = useState("");
    const [testStarted, setTestStarted] = useState(false);

    const handleStartTest = () => {
    setTestStarted(true);
  };

  const Megszakit =()=>{
    setTestStarted(false)
  }

    return (
        <div>
            
            <div className="row">
                <div className="col-sm-4">

                {!testStarted && 
                <div>
                    <Lenyilo kivalasztott={setKivalasztott} selectedYear={setSelectedYear}/>
                   
                <div style={{ marginTop: "20px" }}>
                    <button onClick={handleStartTest}>Teszt indítása</button>
                </div>
                    </div>
                    }

                   

                    

                    </div>
                <div className="col-sm-8">
                 {testStarted && <div>{selectedYear}</div>}
                  {testStarted && <button onClick={Megszakit}>Megszakítás</button>}
                   {testStarted && <FeladatEvSzerint kivalasztott={kivalasztott}/>}
                    
                   
                    {/* <Indit kivalasztott={kivalasztott}/> */}
                </div>
            </div>

        </div>
    )
}
export default Feladatok

