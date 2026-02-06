import { useState, useEffect } from "react";
import Cim from "../Cim";
import "../App.css";
import Swal from "sweetalert2";
import withReactContent from "sweetalert2-react-content";

const FeladatEvSzerint = ({ kivalasztott }) => {
  const [adatok, setAdatok] = useState([]);
  const [kivalaszt, setKivalaszt] = useState([]);
  const [tolt, setTolt] = useState(true);
  const [hiba, setHiba] = useState(false);
  const MySwal = withReactContent(Swal);
  const [osszpont, setOsszpont] = useState(null);
  const [ertekelt, setErtekelt] = useState(false);

  const id = localStorage.getItem("id");

  const helyesIndexek = (helyes) => {
    return helyes.split(",").map((betu) => betu.charCodeAt(0) - 65);
  };
 


  const Ertekel = async () => {
  let db = 0;
  let pontozas = 0;

  

  for (let i = 0; i < adatok.length; i++) {
    let elso = adatok[i];
    let szoveg = "";

    if (elso.gombok[0]) szoveg += "A";
    if (elso.gombok[1]) szoveg += "B";
    if (elso.gombok[2]) szoveg += "C";
    if (elso.gombok[3]) szoveg += "D";
    if (elso.gombok[4]) szoveg += "E";
    if (elso.gombok[5]) szoveg += "F";

    let vesszosSzoveg = szoveg.split("").join(",");

    if (vesszosSzoveg === elso.feladat_helyes) {
      db++;
      pontozas+=elso.feladat_pont;
    }

    
  }
  setErtekelt(true);
  const szazalek = Math.round((pontozas / osszpont) * 100);
  alert(id)
  // Itt ki kell írni adatbázisba, POST-os fetch
  const most = new Date();

                const datum =
                  most.getFullYear() + "-" +
                  String(most.getMonth() + 1).padStart(2, "0") + "-" +
                  String(most.getDate()).padStart(2, "0") + " " +
                  String(most.getHours()).padStart(2, "0") + ":" +
                  String(most.getMinutes()).padStart(2, "0") + ":" +
                  String(most.getSeconds()).padStart(2, "0");

                const bemenet = {
                  szazalek: szazalek,
                  felhasznalo_id: id,
                  datum: datum
                };

                const response=await fetch(Cim.Cim+"/eredmenyFelvitel", {
                                method: "post",
                                headers: {
                                    "Content-Type": "application/json"
                                },
                                body: JSON.stringify(bemenet)
                            })

                const data = await response.json()
  MySwal.fire({
  title: "Értékelés",
  html: `
    <p><strong>Összes feladat:</strong> ${adatok.length}db</p>
    <p><strong>Össz pont:</strong> ${osszpont} pont</p>
    <p><strong>Helyes válaszok darabszáma:</strong> ${db}</p>
    <p><strong>Elért pont:</strong> ${pontozas}</p>
    <p><strong>Eredmény:</strong> ${szazalek}%</p>
  `,
  icon: szazalek >= 60 ? "success" : "warning",
  confirmButtonText: "OK",
  showCancelButton: true,
  cancelButtonText: "Újrapróbálás",
  timer: 30000,
  timerProgressBar: true,
}).then((result) => {
  if (result.dismiss === Swal.DismissReason.cancel) {
    // Újrapróbálás → válaszok törlése
    setAdatok((prev) =>
      prev.map((item) => ({
        ...item,
        gombok: [false, false, false, false, false, false],
      }))
    );
    setErtekelt(false);
  }
});
  };


  


  useEffect(() => {
  const leToltes = async () => {
    try {
      let bemenet = { ev_id: kivalasztott };

      //evIdKeres
      const response = await fetch(Cim.Cim + "/evIdKeres", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(bemenet),
      });

      const data = await response.json();

      if (!response.ok) throw new Error("evIdKeres hiba");

      const tomb = Array.isArray(data) ? data : [data];

      const kibovitett = tomb.map((elem) => ({
        ...elem,
        gombok: Array.isArray(elem.gombok)
          ? elem.gombok
          : [false, false, false, false, false, false],
      }));

      setAdatok(kibovitett);

      //evIdKeresOsszpont
      const responseOsszpont = await fetch(
        Cim.Cim + "/evIdKeresOsszpont",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(bemenet),
        }
      );

      const osszpontData = await responseOsszpont.json();

      if (!responseOsszpont.ok)
        throw new Error("evIdKeresOsszpont hiba");

      setOsszpont(osszpontData[0].Osszpont);

      setTolt(false);
    } catch (error) {
      console.log(error);
      setHiba(true);
      setTolt(false);
    }
  };

  leToltes();
}, [kivalasztott]);

  // chatgpt összehasonlítás tömbözéssel és feladat_id-val
  // immutábilis, biztonságos állapotfrissítés
  const gombCsere = (qIndex, gIndex, feladat_id) => {
     //alert(JSON.stringify(adatok))
    //alert(feladat_id)
    //szinezés
    setAdatok((prev) =>
      prev.map((item, i) =>
        i !== qIndex
          ? item
          : {
              ...item,
              gombok: item.gombok.map((val, j) => (j === gIndex ? !val : val)),
            }
      )
    );
    //mentés tömbben
    
    
    
  };

  if (tolt) return <div style={{ textAlign: "center" }}>Adatok betöltése folyamatban...</div>;
  if (hiba) return <div>Hiba</div>;

  return (
    <div>
      <button
  className="ertekeles-gomb"
  onClick={() => Ertekel()}
>
  Értékelés
</button>

      {adatok.map((elem, index) => {
        // válaszok tömb dinamikus előállítása
        const valaszok = [
          elem.feladat_a,
          elem.feladat_b,
          elem.feladat_c,
          elem.feladat_d,
          elem.feladat_e,
          elem.feladat_f,
        ];

        return (
          <div key={elem.feladat_id ?? index} className="doboz">
            <div style={{ textAlign: "center", marginTop: "20px" }} />
            <div>
              <span style={{fontSize:15}}>{index+1}. </span>
              Kérdés: {elem.feladat_kerdes}
              {elem.feladat_kep ? (
                <img
                  style={{ width: "400px", display: "block", marginTop: 10 }}
                  src={`${Cim.Cim}/kepek/${elem.feladat_kep}`}
                  alt={elem.feladat_id}
                />
              ) : null}
            </div>

            <div style={{ marginTop: "10px" }}>
              {valaszok.map((txt, gIndex) =>
                txt && txt.trim() !== "" ? (
                  <div style={{marginLeft:"30px", marginBottom:"15px"}}>
                  <button
                    key={gIndex}
                    className="gombValasz"
                    onClick={() => gombCsere(index, gIndex, elem.feladat_id)}
                    style={{
                              backgroundColor: elem.gombok?.[gIndex] ? "lightblue" : "white",
                              border: "1px solid gray",
                              boxShadow: (() => {
                                if (!ertekelt && elem.gombok?.[gIndex]) return "0 0 0 2px lightblue";
                                if (ertekelt) {
                                  const helyesek = helyesIndexek(elem.feladat_helyes);
                                  const helyes = helyesek.includes(gIndex);
                                  if (helyes) return "0 0 0 3px green";
                                  if (!helyes) return "0 0 0 3px red";
                                  if (elem.gombok?.[gIndex]) return "0 0 0 2px lightblue";
                                }
                                return "none";
                              })(),
                            }}
                      
                                            >
                    {txt}
                  </button>
                  </div>
                ) : null
              )}
            </div>
          </div>
        );
      })}
    </div>
  );
};

export default FeladatEvSzerint;
