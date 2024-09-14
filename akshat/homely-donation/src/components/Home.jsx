import React, { useState } from "react";
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
          <h1>Homely</h1>
        </div>
        <div className={styles.navRight}>
          <Link to="/contact" className={styles.navLink}>
            Contact Us
          </Link>
          <Link to="/visit" className={styles.navLink}>
            Request a Visit
          </Link>
          {isLoggedIn ? (
            <button onClick={handleLogout} className={styles.navLink}>
              Logout
            </button>
          ) : (
            <Link to="/login" className={styles.navLink}>
              Login
            </Link>
          )}
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
