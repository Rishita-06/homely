import { useState } from "react";
import styles from "./SignUp.module.css";
import "remixicon/fonts/remixicon.css";
import Logo from "../assets/logo.png";

function SignUp() {
  const [formData, setFormData] = useState({
    fullName: "",
    email: "",
    password: "",
    confirmPassword: "",
    dob: "",
    gender: "male",
    agreed: false,
  });

  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleSignUp = (e) => {
    e.preventDefault();
    console.log(formData);
  };

  return (
    <div className={styles.container}>
      <div className={styles.form}>
        <img src={Logo} alt="Homely Logo" className={styles.img} />
        <h2>Sign Up</h2>
        <form onSubmit={handleSignUp}>
          <input
            type="text"
            name="fullName"
            placeholder="Full Name"
            value={formData.fullName}
            onChange={handleInputChange}
            required
          />
          <input
            type="email"
            name="email"
            placeholder="Enter Email"
            value={formData.email}
            onChange={handleInputChange}
            required
          />
          <input
            type="password"
            name="password"
            placeholder="Enter Password"
            value={formData.password}
            onChange={handleInputChange}
            required
          />
          <input
            type="password"
            name="confirmPassword"
            placeholder="Confirm Password"
            value={formData.confirmPassword}
            onChange={handleInputChange}
            required
          />
          <input
            type="date"
            name="dob"
            placeholder="Date of Birth"
            value={formData.dob}
            onChange={handleInputChange}
            required
          />
          <select
            name="gender"
            value={formData.gender}
            onChange={handleInputChange}
          >
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
          </select>
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
            Sign Up
          </button>
        </form>
        <p className={styles.link}>
          Already have an account?
          <br />
          <a href="/">Login</a> here
        </p>
      </div>
    </div>
  );
}

export default SignUp;
