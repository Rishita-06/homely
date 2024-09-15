import { useState } from "react";
import styles from "./SignUp.module.css";
import "remixicon/fonts/remixicon.css";
import Logo from "../assets/logo.png";
import { Link } from "react-router-dom";
import { db } from '../firebase';
import { collection, addDoc } from 'firebase/firestore';


function SignUp() {
  const [formData, setFormData] = useState({
    homeName: "",
    registrationNumber: "",
    address: "",
    contactNumber: "",
    email: "",
    managementName: "",
    managementPhone: "",
    capacity: "",
    services: "",
    agreed: false,
  });


  const [isLoggedIn, setIsLoggedIn] = useState(false);
  
    const handleLogout = () => {
      setIsLoggedIn(false);
    };
  

  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleSignUp = async (e) => {
    e.preventDefault();
    try {
      // Add form data to Firestore
      const docRef = await addDoc(collection(db, "oldAgeHomes"), formData);
      console.log("Document written with ID: ", docRef.id);
      alert('Registration successful!');
      setFormData({
        homeName: "",
        registrationNumber: "",
        address: "",
        contactNumber: "",
        email: "",
        managementName: "",
        managementPhone: "",
        capacity: "",
        services: "",
        agreed: false,
      }); // Reset form
    } catch (error) {
      console.error("Error adding document: ", error);
      alert('Error during registration. Please try again.');
    }
  };


  return (
    <>
     <nav className={styles.navbar}>
        <div className={styles.navLeft}>
          <Link to="/home" className={styles.navLink}>
            <h1 className="text-4xl font-bold text-center my-4" >Homely</h1>
          </Link>
        </div>
        <div className={styles.navRight}>
          <Link to="/home" className={styles.navLink}>
            Home
          </Link>
          <Link to="/marketplace" className={styles.navLink}>
            Marketplace
          </Link>
          <Link to="/visit" className={styles.navLink}>
            Request a Visit
          </Link>
          {isLoggedIn ? (
            <button onClick={handleLogout} className={styles.navLink}>
              Logout
            </button>
          ) : (
            <Link to="/signup" className={styles.navLink}>
              Register
            </Link>
          )}
          <div className={styles.dropdown}>
            <button className={`${styles.navLink} ${styles.dropbtn}`}>
              Contact Us
            </button>
            <div className={styles.dropdownContent}>
              <a href="tel:+916391486005">Call Us</a>
              <a href="mailto:akshat@homely.com">Email Us</a>
            </div>
          </div>
        </div>
      </nav>
    <div className={styles.container}>
      <div className={styles.form}>
        <img src={Logo} alt="Homely Logo" className={styles.img} />
        <h2>Old Age Home Registration</h2>
        <form onSubmit={handleSignUp}>
          <input
            type="text"
            name="homeName"
            placeholder="Old Age Home Name"
            value={formData.homeName}
            onChange={handleInputChange}
            required
          />
          <input
            type="text"
            name="registrationNumber"
            placeholder="Registration Number"
            value={formData.registrationNumber}
            onChange={handleInputChange}
            required
          />
          <textarea
            name="address"
            placeholder="Address"
            value={formData.address}
            onChange={handleInputChange}
            required
            rows="3"
          />
          <input
            type="tel"
            name="contactNumber"
            placeholder="Contact Number"
            value={formData.contactNumber}
            onChange={handleInputChange}
            required
          />
          <input
            type="email"
            name="email"
            placeholder="Email"
            value={formData.email}
            onChange={handleInputChange}
            required
          />
          <input
            type="text"
            name="managementName"
            placeholder="Management Contact Person Name"
            value={formData.managementName}
            onChange={handleInputChange}
            required
          />
          <input
            type="tel"
            name="managementPhone"
            placeholder="Management Contact Phone"
            value={formData.managementPhone}
            onChange={handleInputChange}
            required
          />
          <input
            type="number"
            name="capacity"
            placeholder="Capacity (Number of Residents)"
            value={formData.capacity}
            onChange={handleInputChange}
            required
          />
          <textarea
            name="services"
            placeholder="Services Provided (e.g., Medical, Recreational, etc.)"
            value={formData.services}
            onChange={handleInputChange}
            rows="3"
            required
          />
          <div className={styles.agreement}>
            <input
              type="checkbox"
              name="agreed"
              checked={formData.agreed}
              onChange={handleInputChange}
              required
            />
            <label htmlFor="agreed">I agree to the Terms and Conditions</label>
          </div>
          <button type="submit" className={styles.btnn}>
            Register Old Age Home
          </button>
        </form>
      </div>
    </div></>
  );
}

export default SignUp;
