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
    <div style={{ padding: "20px", textAlign: "center" }}>
      <h2>Eredmények</h2>

      <table
        style={{
          width: "60%",
          borderCollapse: "collapse",
          margin: "20px auto",
        }}
      >
        <thead>
          <tr>
            <th style={thStyle}>Százalék</th>
            <th style={thStyle}>Dátum</th>
          </tr>
        </thead>
        <tbody>
          {eredmenyek.length > 0 ? (
            eredmenyek.map((elem, index) => (
              <tr key={index}>
                <td style={tdStyle}>{elem.szazalek} %</td>
                <td style={tdStyle}>{formatDatum(elem.datum)}</td>
              </tr>
            ))
          ) : (
            <tr>
              <td style={tdStyle} colSpan={2}>
                Nincs megjeleníthető adat
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
};

const thStyle = {
  border: "1px solid #ccc",
  padding: "10px",
  backgroundColor: "#f2f2f2",
};

const tdStyle = {
  border: "1px solid #ccc",
  padding: "10px",
};

export default Eredmeny;
