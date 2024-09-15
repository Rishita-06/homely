import { useState } from "react";
import { Link } from "react-router-dom";
import styles from "./Home.module.css";
import Logo from "../assets/logo.png";
import Donation from "./Donation"
import NewLogo from "../assets/logo.jpg";
import About from '../assets/about.jpg';

function Home() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogout = () => {
    setIsLoggedIn(false);
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
        <div className={styles.about}>
            <img src={About} className={styles.aboutimg}/>
        </div>

        <section className={styles.donations}>
          <Donation/>
        </section>
      </div>
    </>
  );
}

export default Home;
