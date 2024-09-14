import styles from './Visit.module.css';

function Visit() {
  return (
    <>
    
      <div className={styles.formContainer}>
        <h2>Request a visit to the Old Age Home</h2>
        <form action="/submit_visit_request" method="post" className={styles.form}>
          
          <label className={styles.label} htmlFor="visitorName">Your Name:</label>
          <input
            type="text"
            id="visitorName"
            name="visitorName"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="visitorEmail">Your Email:</label>
          <input
            type="email"
            id="visitorEmail"
            name="visitorEmail"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="visitorPhone">Your Phone:</label>
          <input
            type="tel"
            id="visitorPhone"
            name="visitorPhone"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="residentName">Resident's Name:</label>
          <input
            type="text"
            id="residentName"
            name="residentName"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="relationship">Your Relationship to Resident:</label>
          <input
            type="text"
            id="relationship"
            name="relationship"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="visitDate">Preferred Visit Date:</label>
          <input
            type="date"
            id="visitDate"
            name="visitDate"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="visitTime">Preferred Visit Time:</label>
          <input
            type="time"
            id="visitTime"
            name="visitTime"
            className={styles.input}
            required
          />

          <label className={styles.label} htmlFor="notes">Any Special Requests or Notes:</label>
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
    </>
  );
}

export default Visit;
