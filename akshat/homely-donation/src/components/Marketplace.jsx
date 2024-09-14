import { useState } from 'react';
import Cart from './Cart';
import styles from './Marketplace.module.css';

const items = [
  { id: 1, name: 'Handcrafted Vase', price: 25, description: 'Beautiful vase made from eco-friendly materials.', imageUrl: 'vase.jpg' },
  { id: 2, name: 'Woven Basket', price: 15, description: 'Intricate handwoven basket, perfect for home décor.', imageUrl: 'basket.jpg' },
  { id: 3, name: 'Knitted Blanket', price: 40, description: 'Cozy, soft blanket knit by our residents.', imageUrl: 'blanket.jpg' },
  // Add more items as needed
];

function Marketplace() {
  const [cart, setCart] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedItem, setSelectedItem] = useState(null);

  const handleAddToCart = (item) => {
    setCart([...cart, item]);
  };

  const handleSearch = (e) => {
    setSearchQuery(e.target.value);
  };

  const filteredItems = items.filter((item) =>
    item.name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className={styles.marketplace}>
      <h1>Marketplace</h1>
      <input
        type="text"
        placeholder="Search for handcrafted items..."
        value={searchQuery}
        onChange={handleSearch}
        className={styles.searchBar}
      />
      <div className={styles.itemGrid}>
        {filteredItems.map((item) => (
          <div key={item.id} className={styles.itemCard} onClick={() => setSelectedItem(item)}>
            <img src={item.imageUrl} alt={item.name} className={styles.itemImage} />
            <h3>{item.name}</h3>
            <p>${item.price}</p>
            <button onClick={() => handleAddToCart(item)} className={styles.addToCartButton}>
              Add to Cart
            </button>
          </div>
        ))}
      </div>
      
      {selectedItem && (
        <div className={styles.modal}>
          <div className={styles.modalContent}>
            <span className={styles.closeButton} onClick={() => setSelectedItem(null)}>&times;</span>
            <img src={selectedItem.imageUrl} alt={selectedItem.name} className={styles.modalImage} />
            <h2>{selectedItem.name}</h2>
            <p>{selectedItem.description}</p>
            <p>Price: ${selectedItem.price}</p>
            <button onClick={() => handleAddToCart(selectedItem)} className={styles.addToCartButton}>
              Add to Cart
            </button>
          </div>
        </div>
      )}
      <Cart cart={cart} />
    </div>
  );
}

export default Marketplace;
