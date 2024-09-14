import React from 'react';
import { Link } from "react-router-dom";
import { ShoppingCart, Trash2 } from 'lucide-react';

function Cart({ cart, removeFromCart }) {
  const totalPrice = cart.reduce((total, item) => total + item.price, 0);

  return (
    <div className="w-[350px] shadow-lg fixed top-4 right-4 z-50 bg-white border rounded-lg">
      <div className="p-4 border-b">
        <div className="flex items-center justify-between">
          <span className="text-lg font-bold">Your Cart</span>
          <ShoppingCart className="h-5 w-5" />
        </div>
      </div>
      <div className="p-4">
        {cart.length === 0 ? (
          <p className="text-center text-gray-500 my-4">Your cart is empty</p>
        ) : (
          <div className="h-[300px] pr-4 overflow-y-auto">
            {cart.map((item, index) => (
              <div key={index} className="flex justify-between items-center mb-4">
                <div className="flex items-center space-x-4">
                  <img
                    src={item.imageUrl}
                    alt={item.name}
                    className="w-12 h-12 rounded object-cover"
                  />
                  <div>
                    <h4 className="font-semibold">{item.name}</h4>
                    <p className="text-sm text-gray-500">{item.price} Ruppees</p>
                  </div>
                </div>
                <button
                  className="text-red-500 hover:text-red-700"
                  onClick={() => removeFromCart(item.id)}
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            ))}
          </div>
        )}
      </div>
      <hr />
      <div className="p-4">
        <div className="flex justify-between w-full mb-4">
          <span className="font-semibold">Total:</span>
          <span className="font-bold">{totalPrice.toFixed(2)} Ruppees</span>
        </div>
        <Link to="/checkout" className="w-full">
          <button
            className={`w-full py-2 px-4 text-white font-bold rounded ${cart.length === 0 ? 'bg-gray-300' : 'bg-blue-500 hover:bg-blue-600'}`}
            disabled={cart.length === 0}
          >
            Proceed to Checkout
          </button>
        </Link>
      </div>
    </div>
  );
}

export default Cart;
