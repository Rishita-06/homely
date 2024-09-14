import styles from './Visit.module.css';
import { Link } from "react-router-dom";
import { useState } from "react";

function Visit() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  // Define the handleSubmit function
  const handleSubmit = (e) => {
    e.preventDefault();

    // Capture form data
    const formData = new FormData(e.target);
    const visitRequest = {
      visitorName: formData.get('visitorName'),
      visitorEmail: formData.get('visitorEmail'),
      visitorPhone: formData.get('visitorPhone'),
      residentName: formData.get('residentName'),
      relationship: formData.get('relationship'),
      visitDate: formData.get('visitDate'),
      visitTime: formData.get('visitTime'),
      notes: formData.get('notes'),
    };

    console.log('Visit request submitted:', visitRequest);

    // Add logic to handle the form data (e.g., send it to the server)
    alert('Visit request submitted successfully!');
    // You can clear the form if necessary
    e.target.reset();
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
            <label className={styles.label}>Name:</label>
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
