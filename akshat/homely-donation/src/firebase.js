// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getFirestore } from 'firebase/firestore';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
        apiKey: "AIzaSyCpPaJGvtPL3N7pJM0Zq-eVe2NMxfrA5Ts",
        authDomain: "home-less-hore.firebaseapp.com",
        projectId: "home-less-hore",
        storageBucket: "home-less-hore.appspot.com",
        messagingSenderId: "919524899349",
        appId: "1:919524899349:web:894f15e5ae88257d1bec1c"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

export { db };