import { useEffect, useState } from "react";
import Cim from "../Cim";
import "../App.css";

const Eredmeny = () => {
  const [eredmenyek, setEredmenyek] = useState([]);

  useEffect(() => {
    EredmenyLeker();
  }, []);

  const formatDatum = (datumString) => {
  const d = new Date(datumString);

  const ev = d.getFullYear();
  const honap = String(d.getMonth() + 1).padStart(2, "0");
  const nap = String(d.getDate()).padStart(2, "0");
  const ora = String(d.getHours()).padStart(2, "0");
  const perc = String(d.getMinutes()).padStart(2, "0");
  const masodperc = String(d.getSeconds()).padStart(2, "0");

  return `${ev}-${honap}-${nap} ${ora}:${perc}:${masodperc}`;
};




  const EredmenyLeker = async () => {
    const id = localStorage.getItem("id");

    const bemenet = {
      felhasznalo_id: id,
    };

    try {
      const response = await fetch(Cim.Cim + "/eredmenyKeres", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(bemenet),
      });

      const data = await response.json();
      setEredmenyek(data);
    } catch (error) {
      console.error("Hiba az eredmények lekérésekor:", error);
    }
  };

  return (
  <div className="eredmeny-container">
    <div className="eredmeny-card">
      <h2 className="eredmeny-title">Eredményeim</h2>

      <table className="eredmeny-table">
        <thead>
          <tr>
            <th>Százalék</th>
            <th>Dátum</th>
          </tr>
        </thead>
        <tbody>
          {eredmenyek.length > 0 ? (
            eredmenyek.map((elem, index) => (
              <tr key={index}>
                <td className="szazalek-cell">
                  <span
                    className={
                      elem.szazalek >= 60
                        ? "badge siker"
                        : "badge sikertelen"
                    }
                  >
                    {elem.szazalek} %
                  </span>
                </td>
                <td>{formatDatum(elem.datum)}</td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan={2} className="nincs-adat">
                Nincs megjeleníthető adat
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  </div>
);

};


export default Eredmeny;
