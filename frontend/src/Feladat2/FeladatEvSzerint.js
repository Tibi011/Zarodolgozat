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

  const Ertekel = () => {
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

  const szazalek = Math.round((pontozas / osszpont) * 100);

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
  }
});
  };


  


  useEffect(() => {
  const leToltes = async () => {
    try {
      let bemenet = { tema_id: kivalasztott };

      //temaIdKeres
      const response = await fetch(Cim.Cim + "/temaIdKeres", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(bemenet),
      });

      const data = await response.json();

      if (!response.ok) throw new Error("temaIdKeres hiba");

      const tomb = Array.isArray(data) ? data : [data];

      const kibovitett = tomb.map((elem) => ({
        ...elem,
        gombok: Array.isArray(elem.gombok)
          ? elem.gombok
          : [false, false, false, false, false, false],
      }));

      setAdatok(kibovitett);

      //temaIdKeresOsszpont
      const responseOsszpont = await fetch(
        Cim.Cim + "/temaIdKeresOsszpont",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(bemenet),
        }
      );

      const osszpontData = await responseOsszpont.json();

      if (!responseOsszpont.ok)
        throw new Error("temaIdKeresOsszpont hiba");

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
                  <div style={{marginLeft:"30px"}}>
                  <button
                    key={gIndex}
                    className="gombValasz"
                    onClick={() => gombCsere(index, gIndex, elem.feladat_id)}
                    style={{
                      backgroundColor: elem.gombok?.[gIndex] ? "lightgreen" : "white",
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
