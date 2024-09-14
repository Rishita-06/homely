import { useState } from 'react';
import { Link } from "react-router-dom";
import styles from './Visit.module.css';

function Visit() {

  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    message: ''
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Form data submitted:', formData);
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

      <div className={styles.formContainer}>
        <h2>Request a visit</h2>
        <form onSubmit={handleSubmit} className={styles.form}>
          <label className={styles.label}>Name:</label>
          <input
            type="text"
            name="name"
            value={formData.name}
            onChange={handleChange}
            className={styles.input}
            required
          />

          <label className={styles.label}>Email:</label>
          <input
            type="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            className={styles.input}
            required
          />

          <label className={styles.label}>Message:</label>
          <textarea
            name="message"
            value={formData.message}
            onChange={handleChange}
            className={styles.textarea}
            required
          ></textarea>

          <button type="submit" className={styles.button}>
            Submit
          </button>
        </form>
      </div>
    </>
  );
}

export default Visit;

