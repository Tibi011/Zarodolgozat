// App.js
import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import Navbar from './Navbar';

import Login from './Login';
import Register from './Register';
//Bejelentkezés nélküli menük
import Menu1 from './Menu1/Menu1';
import Feladat from './Feladat/Feladatok'
import Feladat2 from './Feladat2/Feladatok'
//Admin menük
import Admin from './Admin/Admin';
import FeladatTorles from './FeladatTorles/FeladatTorles';
import FeladatEvesTorles from './FeladatTorles/FeladatEvesTroles';
import KeresKerdes from './FeladatKeres/KerdesKeres';
import EvKeres from './FeladatKeres/EvKeres';
//User menük
import FeladatGyakorlas from './FeladatGyakorlas/Feladatok'
import Eredmeny from './Eredmeny/Eredmeny';

const ProtectedRoute = ({ children, role }) => {
  const token = localStorage.getItem("token");
  const userRole = localStorage.getItem("role");

  if (!token) return <Navigate to="/login" />;

  if (role && userRole !== role) return <Navigate to="/menu1" />;

  return children;
};


// App komponens
function App() {
  return (
    <Router>
      <Navbar />
      <div className="container mt-3">
        <Routes>
          <Route path="/" element={<Menu1 />} />
         
          <Route path="/menu1" element={<Menu1 />} />
          <Route path="/feladat" element={<Feladat />} />
          <Route path="/feladat2" element={<Feladat2 />} />
          <Route path="/eredmeny" element={<Eredmeny />} />
          



{/* Bejelentkezés*/}
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />

          <Route 
            path="/admin"
            element={
              <ProtectedRoute role="admin">
                <Admin />
              </ProtectedRoute>
            }
          />
          <Route 
            path="/feladatTorles"
            element={
              <ProtectedRoute role="admin">
                <FeladatTorles />
              </ProtectedRoute>
            }
          />
          <Route 
            path="/feladatEvesTroles"
            element={
              <ProtectedRoute role="admin">
                <FeladatEvesTorles />
              </ProtectedRoute>
            }
          />
         
          <Route 
            path="/keresKerdes"
            element={
              <ProtectedRoute role="admin">
                <KeresKerdes />
              </ProtectedRoute>
            }
          />

          <Route 
            path="/evKeres"
            element={
              <ProtectedRoute role="admin">
                <EvKeres />
              </ProtectedRoute>
            }
          />



          

          <Route 
            path="/feladatgyakorlas"
            element={
              <ProtectedRoute role="user">
                <FeladatGyakorlas />
              </ProtectedRoute>
            }
          />
{/* Bejelentkezés vége*/}

        </Routes>
      </div>
    </Router>
  );
}

export default App;
