import React, { useState } from 'react';
import { Link } from 'react-router-dom';

function Checkout({ cart = [] }) {  // Default cart to an empty array
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    address: '',
    city: '',
    postalCode: '',
  });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const totalPrice = (cart || []).reduce((total, item) => total + item.price, 0);  // Default empty array if cart is undefined

  const handleSubmit = (e) => {
    e.preventDefault();
    // Logic for processing the checkout can go here
    console.log('Order submitted:', formData, cart);
    alert('Order placed successfully!');
  };

  return (
    <div className="w-screen h-screen flex flex-col items-center justify-center bg-gray-100">
      <h1 className="text-4xl font-bold mb-8 text-center">Checkout</h1>
      <div className="w-full max-w-4xl bg-white p-8 shadow-lg rounded-lg">
        <div className="mb-8">
          <h2 className="text-2xl font-bold mb-4">Order Summary</h2>
          <div className="border-t pt-4">
            {cart.length === 0 ? (
              <p className="text-center text-gray-500">Your cart is empty.</p>
            ) : (
              <div className="space-y-4">
                {cart.map((item, index) => (
                  <div key={index} className="flex justify-between items-center">
                    <div className="flex items-center space-x-4">
                      <img
                        src={item.imageUrl}
                        alt={item.name}
                        className="w-12 h-12 rounded object-cover"
                      />
                      <div>
                        <h4 className="font-semibold">{item.name}</h4>
                        <p className="text-sm text-gray-500">{item.price} Ruppee</p>
                      </div>
                    </div>
                    <span className="font-semibold">${item.price}</span>
                  </div>
                ))}
              </div>
            )}
            <div className="border-t pt-4 mt-4 flex justify-between">
              <span className="font-semibold text-lg">Total:</span>
              <span className="font-bold text-lg">{totalPrice.toFixed(2)} Ruppees</span>
            </div>
          </div>
        </div>

        <h2 className="text-2xl font-bold mb-4">Shipping Details</h2>
        <form onSubmit={handleSubmit}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <div>
              <label className="block mb-1 font-semibold" htmlFor="name">
                Name
              </label>
              <input
                type="text"
                name="name"
                id="name"
                value={formData.name}
                onChange={handleChange}
                required
                className="w-full px-4 py-2 border rounded-lg"
              />
            </div>
            <div>
              <label className="block mb-1 font-semibold" htmlFor="email">
                Email
              </label>
              <input
                type="email"
                name="email"
                id="email"
                value={formData.email}
                onChange={handleChange}
                required
                className="w-full px-4 py-2 border rounded-lg"
              />
            </div>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
            <div>
              <label className="block mb-1 font-semibold" htmlFor="address">
                Address
              </label>
              <input
                type="text"
                name="address"
                id="address"
                value={formData.address}
                onChange={handleChange}
                required
                className="w-full px-4 py-2 border rounded-lg"
              />
            </div>
            <div>
              <label className="block mb-1 font-semibold" htmlFor="city">
                City
              </label>
              <input
                type="text"
                name="city"
                id="city"
                value={formData.city}
                onChange={handleChange}
                required
                className="w-full px-4 py-2 border rounded-lg"
              />
            </div>
          </div>
          <div>
            <label className="block mb-1 font-semibold" htmlFor="postalCode">
              Postal Code
            </label>
            <input
              type="text"
              name="postalCode"
              id="postalCode"
              value={formData.postalCode}
              onChange={handleChange}
              required
              className="w-full px-4 py-2 border rounded-lg"
            />
          </div>
          <div className="mt-8 flex justify-between">
            <Link to="/cart">
              <button className="px-4 py-2 bg-gray-300 hover:bg-gray-400 rounded-lg font-bold">
                Back to Cart
              </button>
            </Link>
            <button
              type="submit"
              className="px-4 py-2 bg-blue-500 hover:bg-blue-600 text-white font-bold rounded-lg"
            >
              Place Order
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default Checkout;
