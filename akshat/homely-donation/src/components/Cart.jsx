import { Link } from "react-router-dom";
import styles from './Cart.module.css';

function Cart({ cart }) {
  const totalPrice = cart.reduce((total, item) => total + item.price, 0);

  return (
    <div className={styles.cart}>
      <h2>Your Cart</h2>
      {cart.length === 0 ? (
        <p>Your cart is empty</p>
      ) : (
        <div>
          {cart.map((item, index) => (
            <div key={index} className={styles.cartItem}>
              <h4>{item.name}</h4>
              <p>${item.price}</p>
            </div>
          ))}
          <h3>Total: ${totalPrice}</h3>
          <Link to="/checkout"><button className={styles.checkoutButton}>Checkout</button>
        </Link></div>
      )}
    </div>
  );
}

export default Cart;
