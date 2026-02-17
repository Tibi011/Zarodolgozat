import "./Menu1.css";

const Menu1 = () => {
  return (
    <div className="home-container">
      <div className="hero">
        <h1>Országos Teszt Platform</h1>
        <p>
          A papíralapú országos feladatok modern, digitális változata.
          Gyakorolj, tesztelj és kövesd az eredményeidet online.
        </p>
      </div>

      <div className="features">
        <div className="card">
          <h2>📝 Tesztírás</h2>
          <p>Valódi vizsgakörnyezethez hasonló feladatmegoldás.</p>
        </div>

        <div className="card">
          <h2>📊 Eredmények</h2>
          <p>Részletes kiértékelés és statisztikák.</p>
        </div>

        <div className="card">
          <h2>🎯 Gyakorlás</h2>
          <p>Témakör szerinti felkészülés és ismétlés.</p>
        </div>
      </div>
    </div>
  );
};

export default Menu1;
