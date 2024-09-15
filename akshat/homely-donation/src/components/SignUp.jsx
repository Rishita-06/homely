import { useState } from "react";
import styles from "./SignUp.module.css";
import "remixicon/fonts/remixicon.css";
import Logo from "../assets/logo.png";
import { db } from '../firebase'; // Import Firestore instance
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
    </div>
  );
}

export default SignUp;
