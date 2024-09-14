import { useState } from "react";
import { Link } from "react-router-dom";
import styles from "./Home.module.css";
import Logo from "../assets/logo.png";
import Donation from "./Donation"

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
        <section className={styles.about}>
          <div className={styles.aboutText}>
            <p>
              Homely is dedicated to providing a warm and caring environment for
              the elderly. We believe in offering the best care possible, along
              with opportunities for visits and donations to support our homes.
            </p>
            <p>
              Our objectives include enhancing the quality of life for our
              residents, ensuring their well-being, and fostering a community
              where they feel loved and cared for.
            </p>
          </div>
          <div className={styles.aboutLogo}>
            <img src={Logo} alt="Homely Logo" />
          </div>
        </section>

        <section className={styles.donations}>
          <Donation/>
        </section>
      </div>
    </>
  );
}

export default Home;
