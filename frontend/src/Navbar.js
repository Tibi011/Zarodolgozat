import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import "./Navbar.css";

const Navbar = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const navigate = useNavigate();

  const token = localStorage.getItem("token");
  const role = localStorage.getItem("role");
  const loggedIn = !!token;

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("role");
    navigate("/menu1");
  };

  const toggleMenu = () => {
    setMenuOpen(prev => !prev);
  };

  return (
    <nav className="navbar">
      <div className="navbar-left">
        <button className="hamburger" onClick={toggleMenu}>
          ☰
        </button>
        <div className={`menu ${menuOpen ? "open" : ""}`}>
          <Link to="/menu1" className="link" onClick={() => setMenuOpen(false)}>
            Nyitólap
          </Link>

          <Link to="/feladat" className="link" onClick={() => setMenuOpen(false)}>
            Feladat
          </Link>

          <Link to="/feladat2" className="link" onClick={() => setMenuOpen(false)}>
            Feladat2
          </Link>



          {loggedIn && role === "admin" && (
            <Link to="/admin" className="link" onClick={() => setMenuOpen(false)}>
              Admin
            </Link>
          )}
          {loggedIn && role === "admin" && (
            <Link to="/feladatTorles" className="link" onClick={() => setMenuOpen(false)}>
              Feladat Kezelés
            </Link>
          )}
          {loggedIn && role === "admin" && (
            <Link to="/feladatEvesTroles" className="link" onClick={() => setMenuOpen(false)}>
              Feladat Részletek
            </Link>
          )}
           
          


          

          {loggedIn && role === "user" && (
            <Link to="/feladatgyakorlas" className="link" onClick={() => setMenuOpen(false)}>
              Gyakorlás
            </Link>
          )}


          {loggedIn && role === "user" && (
            <Link to="/eredmeny" className="link" onClick={() => setMenuOpen(false)}>
              Eredmények
            </Link>
          )}
        </div>
      </div>

      <div className="navbar-right">
        {loggedIn ? (
          <button className="logoutButton" onClick={handleLogout}>
            Kijelentkezés
          </button>
        ) : (
          <Link to="/login" className="loginButton">
            Bejelentkezés
          </Link>
        )}
      </div>
    </nav>
  );
};

export default Navbar;
