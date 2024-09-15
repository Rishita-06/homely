import styles from './Visit.module.css';
import { Link } from "react-router-dom";
import { useState } from "react";
import { collection, addDoc } from 'firebase/firestore';
import { db } from '../firebase';

function Visit() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  // Define the handleSubmit function
  const handleSubmit = async (e) => {
    e.preventDefault();

    const form = e.target;
    const visitRequest = {
      visitorName: form.visitorName.value,
      visitorEmail: form.visitorEmail.value,
      visitorPhone: form.visitorPhone.value,
      residentName: form.residentName.value,
      relationship: form.relationship.value,
      visit: form.visitDate.value + ' ' + form.visitTime.value,
      notes: form.notes.value,
    };

    try {
      // Add the visit request to Firestore
      const docRef = await addDoc(collection(db, "formData"), visitRequest);
      console.log("Document written with ID: ", docRef.id);
      alert('Visit request submitted successfully!');
      form.reset();
    } catch (error) {
      console.error("Error adding document: ", error);
      alert('Error submitting visit request. Please try again.');
    }
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  return (
    <>
      <nav className={styles.navbar}>
        <div className={styles.navLeft}>
          <Link to="/home" className={styles.navLink}>
            <h1>Homely</h1>
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
        <div className={styles.formContainer}>
          <h2>Request a visit</h2>
          <form onSubmit={handleSubmit} className={styles.form}>
            <label className={styles.label} htmlFor="visitorName">Name:</label>
            <input
              type="text"
              id="visitorName"
              name="visitorName"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="visitorEmail">
              Your Email:
            </label>
            <input
              type="email"
              id="visitorEmail"
              name="visitorEmail"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="visitorPhone">
              Your Phone:
            </label>
            <input
              type="tel"
              id="visitorPhone"
              name="visitorPhone"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="residentName">
              Residents Name:
            </label>
            <input
              type="text"
              id="residentName"
              name="residentName"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="relationship">
              Your Relationship to Resident:
            </label>
            <input
              type="text"
              id="relationship"
              name="relationship"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="visitDate">
              Preferred Visit Date:
            </label>
            <input
              type="date"
              id="visitDate"
              name="visitDate"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="visitTime">
              Preferred Visit Time:
            </label>
            <input
              type="time"
              id="visitTime"
              name="visitTime"
              className={styles.input}
              required
            />

            <label className={styles.label} htmlFor="notes">
              Any Special Requests or Notes:
            </label>
            <textarea
              id="notes"
              name="notes"
              className={styles.textarea}
              placeholder="If you have any specific requests, please let us know."
            ></textarea>

            <button type="submit" className={styles.button}>
              Submit Request
            </button>
          </form>
        </div>
      </div>
    </>
  );
}

export default Visit;
