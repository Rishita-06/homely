import { useState } from 'react';
import styles from './Visit.module.css'; // Assuming you're using CSS Modules for styling

function Visit() {
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
      <h1 className={styles.title}>Visit</h1>

      <div className={styles.formContainer}>
        <h2>Contact Us</h2>
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

