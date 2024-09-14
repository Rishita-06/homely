import { useState } from 'react';
import Cart from './Cart';
import { Link } from "react-router-dom";
import styles from "./Home.module.css";
import { Heart, ShoppingCart } from 'lucide-react';
const items = [
    {
      id: 1,
      name: 'Handcrafted Brass Diya',
      price: 350,
      description: 'Elegant brass diya with intricate designs, crafted by Aarti, 65, for festive occasions.',
      longDescription: 'This beautiful brass diya showcases Aarti\'s expertise in traditional metalwork. Each diya is handcrafted with intricate patterns, making it a perfect addition to your Diwali celebrations.',
      imageUrl: '/api/placeholder/400/300',
      category: 'Home Decor',
      artisan: {
        name: 'Aarti Sharma',
        age: 65,
        avatar: '/api/placeholder/100/100',
        story: 'Aarti has been creating traditional brassware for over 40 years. Her work is a blend of artistry and tradition, reflecting the rich heritage of Indian metalcraft.',
      },
    },
    {
      id: 2,
      name: 'Hand-Woven Kashmiri Shawl',
      price: 2500,
      description: 'Luxurious woolen shawl with intricate Kashmiri embroidery by Ghulam, 70.',
      longDescription: 'Ghulam’s shawls are famous for their exquisite Kashmiri embroidery, a tradition passed down through generations. Each shawl is a work of art, perfect for adding elegance and warmth.',
      imageUrl: '/api/placeholder/400/300',
      category: 'Textiles',
      artisan: {
        name: 'Ghulam Ahmed',
        age: 70,
        avatar: '/api/placeholder/100/100',
        story: 'A master craftsman from Kashmir, Ghulam combines traditional techniques with his own creative touch to produce shawls that are both beautiful and warm.',
      },
    },
    {
      id: 3,
      name: 'Traditional Indian Beaded Necklace',
      price: 1200,
      description: 'Colorful necklace with traditional beadwork by Meera, 55, inspired by Rajasthani designs.',
      longDescription: 'Meera’s beaded jewelry is inspired by the vibrant colors and patterns of Rajasthan. Each piece is handcrafted with care, making it a unique addition to your jewelry collection.',
      imageUrl: '/api/placeholder/400/300',
      category: 'Jewelry',
      artisan: {
        name: 'Meera Patel',
        age: 55,
        avatar: '/api/placeholder/100/100',
        story: 'Meera learned the art of beading from her grandmother. Her jewelry reflects the rich cultural heritage of Rajasthan and is celebrated for its intricate designs and craftsmanship.',
      },
    },
    {
      id: 4,
      name: 'Hand-Painted Madhubani Art',
      price: 1800,
      description: 'Beautiful Madhubani painting by Sita, 68, capturing the essence of Indian folk art.',
      longDescription: 'Sita’s Madhubani paintings are renowned for their vibrant colors and intricate details. Each artwork tells a story and brings the rich tradition of Indian folk art to your home.',
      imageUrl: '/api/placeholder/400/300',
      category: 'Art',
      artisan: {
        name: 'Sita Devi',
        age: 68,
        avatar: '/api/placeholder/100/100',
        story: 'Sita is a master of Madhubani art, a tradition from Bihar. Her paintings are celebrated for their detailed patterns and vibrant colors, preserving a cultural heritage through her art.',
      },
    },
    {
      id: 5,
      name: 'Organic Ayurvedic Soap',
      price: 150,
      description: 'Natural soap made with Ayurvedic herbs by Anju, 60, for healthy and glowing skin.',
      longDescription: 'Anju’s Ayurvedic soaps are crafted with organic ingredients and traditional herbs. Each soap is designed to nourish and rejuvenate your skin, reflecting the wisdom of ancient Ayurvedic practices.',
      imageUrl: '/api/placeholder/400/300',
      category: 'Bath & Body',
      artisan: {
        name: 'Anju Verma',
        age: 60,
        avatar: '/api/placeholder/100/100',
        story: 'Anju, with her background in Ayurvedic medicine, creates natural soaps that blend traditional knowledge with modern care. Her products are loved for their purity and effectiveness.',
      },
    },
  ];
  
function Marketplace() {
    const [cart, setCart] = useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    const [selectedItem, setSelectedItem] = useState(null);
    const [favorites, setFavorites] = useState([]);
    const [isLoggedIn, setIsLoggedIn] = useState(false);
  
    const handleLogout = () => {
      setIsLoggedIn(false);
    };
  
    const handleAddToCart = (item) => {
      setCart([...cart, item]);
    };
  
    const handleRemoveFromCart = (itemId) => {
      setCart((prevCart) => prevCart.filter((item) => item.id !== itemId));
    };
  
    const handleSearch = (e) => {
      setSearchQuery(e.target.value);
    };
  
    const toggleFavorite = (itemId) => {
      setFavorites((prevFavorites) =>
        prevFavorites.includes(itemId)
          ? prevFavorites.filter((id) => id !== itemId)
          : [...prevFavorites, itemId]
      );
    };
  
    const filteredItems = items.filter(
      (item) =>
        item.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        item.category.toLowerCase().includes(searchQuery.toLowerCase()) ||
        item.artisan.name.toLowerCase().includes(searchQuery.toLowerCase())
    );
  
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
        <div className="container mx-auto px-4 py-8">
          <h1 className="text-4xl font-bold mb-8 text-center">Homely Marketplace</h1>
          <div className="mb-8">
            <input
              type="text"
              placeholder="Search for handcrafted items..."
              value={searchQuery}
              onChange={handleSearch}
              className="w-full max-w-md mx-auto p-2 border border-gray-300 rounded"
            />
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {filteredItems.map((item) => (
              <div key={item.id} className="border rounded-lg overflow-hidden shadow-md">
                <img src={item.imageUrl} alt={item.name} className="w-full h-48 object-cover" />
                <div className="p-4">
                  <h2 className="text-xl font-semibold">{item.name}</h2>
                  <p className="text-gray-700">{item.description}</p>
                  <p className="text-2xl font-bold my-4">{item.price} Ruppees</p>
                  <div className="flex items-center mb-4">
                    <img
                      src={item.artisan.avatar}
                      alt={item.artisan.name}
                      className="w-10 h-10 rounded-full mr-2"
                    />
                    <div>
                      <p className="font-semibold">{item.artisan.name}</p>
                      <p className="text-sm text-gray-500">Age: {item.artisan.age}</p>
                    </div>
                  </div>
                  <span className="inline-block bg-gray-200 text-gray-800 text-xs px-2 py-1 rounded">
                    {item.category}
                  </span>
                </div>
                <div className="p-4 flex justify-between items-center border-t">
                  <button
                    onClick={() => setSelectedItem(item)}
                    className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600"
                  >
                    View Details
                  </button>
                  <div className="flex items-center gap-2">
                    <button onClick={() => toggleFavorite(item.id)} className="text-gray-500 hover:text-red-500">
                      <Heart className={favorites.includes(item.id) ? "fill-current text-red-500" : ""} />
                    </button>
                    <button
                      onClick={() => handleAddToCart(item)}
                      className="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 flex items-center"
                    >
                      <ShoppingCart className="mr-2 h-4 w-4" /> Add to Cart
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
  
          {selectedItem && (
            <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4">
              <div className="bg-white p-8 rounded-lg max-w-2xl w-full max-h-[90vh] overflow-y-auto">
                <button onClick={() => setSelectedItem(null)} className="float-right text-2xl">&times;</button>
                <img src={selectedItem.imageUrl} alt={selectedItem.name} className="w-full h-64 object-cover mb-4 rounded" />
                <h2 className="text-2xl font-bold mb-2">{selectedItem.name}</h2>
                <p className="text-xl font-semibold mb-4">${selectedItem.price}</p>
                <p className="mb-4">{selectedItem.longDescription}</p>
                <div className="mb-4">
                  <h3 className="text-lg font-semibold mb-2">About the Artisan</h3>
                  <div className="flex items-center mb-2">
                    <img
                      src={selectedItem.artisan.avatar}
                      alt={selectedItem.artisan.name}
                      className="w-10 h-10 rounded-full mr-2"
                    />
                    <div>
                      <p className="font-semibold">{selectedItem.artisan.name}</p>
                      <p className="text-sm text-gray-500">Age: {selectedItem.artisan.age}</p>
                    </div>
                  </div>
                  <p>{selectedItem.artisan.story}</p>
                </div>
                <button
                  onClick={() => handleAddToCart(selectedItem)}
                  className="w-full px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 flex items-center justify-center"
                >
                  <ShoppingCart className="mr-2 h-4 w-4" /> Add to Cart
                </button>
              </div>
            </div>
          )}
  
          <div className="fixed bottom-100 right-4 z-50">
            <Cart cart={cart} removeFromCart={handleRemoveFromCart} className="fixed bottom-100 right-4 z-50"/>
          </div>
        </div>
      </>
    );
  }
  
  export default Marketplace;