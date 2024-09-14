import { useState } from "react";
import styles from "./Login.module.css";
import "remixicon/fonts/remixicon.css";
import Logo from "../assets/logo.png";


function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = (e) => {
    e.preventDefault();
    console.log("Email:", email);
    console.log("Password:", password);
  };
  return (
    <>
      <div className={styles.container}>
        
        <div className={styles.form}>
          <img src={Logo} alt="sdbvhdfbhdb" className={styles.img} />
          <h2>Homely</h2>
          <form onSubmit={handleLogin}>
            <input
              type="email"
              name="email"
              placeholder="Enter Email Here"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
            <input
              type="password"
              name="password"
              placeholder="Enter Password Here"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
            <button type="submit" className={styles.btnn}>
              Login
            </button>
          </form>

          <p className={styles.link}>
            Dont have an account
            <br />
            <a href="#">Sign up</a> here
          </p>
          <p className={styles.liw}>Log in with</p>
          <div className={styles.icons}>
            <div className="icons">
              <a href="#">
                <i className="ri-facebook-line"></i>
              </a>
              <a href="#">
                <i className="ri-google-line"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Login;
