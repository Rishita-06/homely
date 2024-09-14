import { useState } from 'react';
import styles from './Checkout.module.css';

function Checkout({ cart = [], onPlaceOrder }) {
  const [formData, setFormData] = useState({
    name: '',
    address: '',
    city: '',
    postalCode: '',
    cardNumber: '',
    expirationDate: '',
    cvv: ''
  });

  // Ensure that the cart is always an array
  const totalPrice = cart.length > 0 ? cart.reduce((total, item) => total + item.price, 0) : 0;

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Add payment processing logic here
    console.log('Order placed:', formData, cart);
    onPlaceOrder(); // Clear the cart and redirect after placing order
  };

  return (
    <div className={styles.checkout}>
      <h2>Checkout</h2>

      <div className={styles.orderSummary}>
        <h3>Order Summary</h3>
        {cart.length > 0 ? (
          cart.map((item, index) => (
            <div key={index} className={styles.summaryItem}>
              <span>{item.name}</span>
              <span>${item.price}</span>
            </div>
          ))
        ) : (
          <p>Your cart is empty</p>
        )}
        <h4>Total: ${totalPrice}</h4>
      </div>

      <form onSubmit={handleSubmit} className={styles.checkoutForm}>
        <h3>Shipping Information</h3>
        <label>Name:</label>
        <input
          type="text"
          name="name"
          value={formData.name}
          onChange={handleChange}
          required
        />

        <label>Address:</label>
        <input
          type="text"
          name="address"
          value={formData.address}
          onChange={handleChange}
          required
        />

        <label>City:</label>
        <input
          type="text"
          name="city"
          value={formData.city}
          onChange={handleChange}
          required
        />

        <label>Postal Code:</label>
        <input
          type="text"
          name="postalCode"
          value={formData.postalCode}
          onChange={handleChange}
          required
        />

        <h3>Payment Information</h3>
        <label>Card Number:</label>
        <input
          type="text"
          name="cardNumber"
          value={formData.cardNumber}
          onChange={handleChange}
          required
        />

        <label>Expiration Date:</label>
        <input
          type="text"
          name="expirationDate"
          value={formData.expirationDate}
          onChange={handleChange}
          required
        />

        <label>CVV:</label>
        <input
          type="text"
          name="cvv"
          value={formData.cvv}
          onChange={handleChange}
          required
        />

        <button type="submit" className={styles.placeOrderButton}>
          Place Order
        </button>
      </form>
    </div>
  );
}

export default Checkout;
