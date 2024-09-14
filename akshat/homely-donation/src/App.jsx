import { BrowserRouter, Routes, Route } from "react-router-dom";
import Login from "./components/Login";
import Home from "./components/Home";
import Visit from "./components/Visit";
import SignUp from "./components/SignUp";
import Donation from "./components/Donation";
import Dashboard from "./components/Dashboard";

function App() {
  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/visit" element={<Visit />} />
          <Route path="/home" element={<Home />} />
          <Route path="/donation" element={<Donation />} />
          <Route path="/" element={<Home />} />
          <Route path="/signup" element={<SignUp />} />
          <Route path="/login" element={<Login />} >
            <Route path='admin-dashboard' element={<Dashboard />} />
          </Route> 
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
