import { useState, useEffect } from 'react';
// import Razorpay from 'razorpay';
import styles from './Donation.module.css';

const oldAgeHomesData = [
    {
      id: 1,
      name: 'Sunrise Old Age Home',
      address: 'Pune, Maharashtra',
      state: 'Maharashtra',
      district: 'Pune',
      description: 'A safe and caring environment for elderly residents in Pune. Sunrise focuses on providing high-quality care, medical attention, and emotional support for all its members.',
      contact: '+91-1234567890',
      website: 'www.sunriseoldhome.com',
      capacity: 75,
      currentOccupancy: 68,
      urgentNeeds: ['Medical equipment', 'Recreational materials'],
      donationUsage: 'Your donations help us provide better care, improve facilities, and organize engaging activities for our residents.',
      donationOptions: [
        { amount: 1000, description: 'Provides meals for one resident for a week' },
        { amount: 5000, description: 'Sponsors medical care for one resident for a month' },
        { amount: 10000, description: 'Contributes to facility maintenance and upgrades' }
      ],
      impactStory: 'Last year, donations helped us upgrade our physiotherapy equipment, significantly improving the mobility of 15 residents.',
      taxBenefits: '50% tax deduction under Section 80G of the Income Tax Act',
      donationNumber: 5000
    },
    {
      id: 2,
      name: 'Golden Years Retirement Home',
      address: 'Bangalore, Karnataka',
      state: 'Karnataka',
      district: 'Bangalore',
      description: 'Golden Years Retirement Home provides a friendly community for the elderly in Bangalore with comfortable living spaces, regular health check-ups, and recreational activities.',
      contact: '+91-0987654321',
      website: 'www.goldenyearsretirement.com',
      capacity: 100,
      currentOccupancy: 92,
      urgentNeeds: ['Wheelchairs', 'Art supplies for therapy'],
      donationUsage: 'Donations are used to enhance the quality of life for our residents through better facilities, activities, and care.',
      donationOptions: [
        { amount: 2000, description: 'Supports recreational activities for a week' },
        { amount: 7500, description: 'Provides medical supplies for a month' },
        { amount: 15000, description: 'Helps in upgrading living quarters' }
      ],
      impactStory: 'With recent donations, we started a music therapy program that has shown remarkable improvement in the mood and cognitive functions of our residents with dementia.',
      taxBenefits: '100% tax exemption under Section 80G of the Income Tax Act',
      donationNumber: 3000
    },
    {
      id: 3,
      name: 'Happy Days Old Age Home',
      address: 'Mumbai, Maharashtra',
      state: 'Maharashtra',
      district: 'Mumbai',
      description: 'Located in the heart of Mumbai, Happy Days offers comprehensive care services including daily assistance, meals, medical care, and social activities.',
      contact: '+91-1122334455',
      website: 'www.happydaysoldhome.com',
      capacity: 60,
      currentOccupancy: 55,
      urgentNeeds: ['Bed linens', 'Nutritional supplements'],
      donationUsage: 'Your donations help us maintain our facilities, provide quality care, and organize engaging activities for our residents.',
      donationOptions: [
        { amount: 1500, description: 'Provides personal care items for a resident for a month' },
        { amount: 6000, description: 'Sponsors a resident\'s meals for a month' },
        { amount: 12000, description: 'Contributes to medical equipment upgrades' }
      ],
      impactStory: 'Thanks to generous donations, we were able to create a small library last year, which has become a favorite spot for many residents.',
      taxBenefits: '50% tax deduction under Section 80G of the Income Tax Act',
      donationNumber: 4000
    },
    {
      id: 4,
      name: 'Silver Lining Care Home',
      address: 'Chennai, Tamil Nadu',
      state: 'Tamil Nadu',
      district: 'Chennai',
      description: 'Silver Lining Care Home offers a peaceful and supportive environment for elderly individuals, ensuring their well-being through professional care and personalized attention.',
      contact: '+91-6677889900',
      website: 'www.silverliningsseniorcare.com',
      capacity: 80,
      currentOccupancy: 72,
      urgentNeeds: ['Physiotherapy equipment', 'Garden furniture'],
      donationUsage: 'Donations are utilized to enhance our care programs, upgrade medical equipment, and improve the overall living experience of our residents.',
      donationOptions: [
        { amount: 2500, description: 'Supports a resident\'s rehabilitation sessions for a week' },
        { amount: 8000, description: 'Provides specialized care for a dementia patient for a month' },
        { amount: 20000, description: 'Contributes to facility expansions and improvements' }
      ],
      impactStory: 'Recent donations allowed us to install a lift, greatly improving accessibility for our residents with mobility issues.',
      taxBenefits: '100% tax exemption under Section 80G of the Income Tax Act',
      donationNumber: 3500
    },
    {
      id: 5,
      name: 'Elder Care Sanctuary',
      address: 'Hyderabad, Telangana',
      state: 'Telangana',
      district: 'Hyderabad',
      description: 'Elder Care Sanctuary in Hyderabad provides a holistic approach to elderly care with a focus on health, comfort, and social inclusion.',
      contact: '+91-2233445566',
      website: 'www.eldercaresanctuary.org',
      capacity: 90,
      currentOccupancy: 85,
      urgentNeeds: ['Hearing aids', 'Recreational games'],
      donationUsage: 'Your generous donations help us continually improve our care standards, introduce innovative programs, and create a vibrant living environment for our residents.',
      donationOptions: [
        { amount: 3000, description: 'Sponsors wellness activities for a week' },
        { amount: 10000, description: 'Provides advanced medical care for a resident for a month' },
        { amount: 25000, description: 'Contributes to technology upgrades for resident care' }
      ],
      impactStory: 'Donations last year helped us implement a new cognitive stimulation program, which has shown promising results in slowing down cognitive decline in our residents.',
      taxBenefits: '50% tax deduction under Section 80G of the Income Tax Act',
      donationNumber: 4500
    }
  ];

function Donation() {
  const [state, setState] = useState('');
  const [district, setDistrict] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [filteredHomes, setFilteredHomes] = useState(oldAgeHomesData);
  const [selectedHome, setSelectedHome] = useState(null);
  const [donationAmount, setDonationAmount] = useState(0);

  useEffect(() => {
    const filteredHomes = getFilteredOldAgeHomes(state, district, searchTerm);
    setFilteredHomes(filteredHomes);
  }, [state, district, searchTerm]);

  const handleDonate = () => {
    // const razorpayOptions = {
    //   key: 'your_razorpay_key',
    //   amount: selectedHome?.donationAmount || 1000,
    //   name: selectedHome?.name || 'Old Age Home',
    //   description: 'Donation for improving the lives of the residents',
    //   handler: function (response) {
    //     console.log('Payment Successful', response);
    //   },
    //   prefill: {
    //     name: 'Your Name',
    //     email: 'your-email@example.com',
    //   },
    //   theme: {
    //     color: '#3498DB',
    //   },
    // };
    // const rzp1 = new Razorpay(razorpayOptions);
    // rzp1.open();
  };

  return (
    <div className={styles.donationContainer}>
      <h1 className="text-4xl font-bold text-center my-4" >Support Our Old Age Homes</h1>
      <p className="text-2xl font-bold text-center my-4">Your donation makes a difference. Find a home and contribute to their well-being.</p>

      <div className={styles.filterSection}>
        <input
          type="text"
          placeholder="Search by name or phone..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className={styles.searchBar}
        />

        <select
          value={state}
          onChange={(e) => setState(e.target.value)}
          className={styles.filter}
        >

          <option value="">Select State</option>
          <option value="Maharashtra">Maharashtra</option>
          <option value="Karnataka">Karnataka</option>
          <option value="Tamil Nadu">Tamil Nadu</option>
          <option value="Telangana">Telangana</option>
        </select>

        <select
          value={district}
          onChange={(e) => setDistrict(e.target.value)}
          className={styles.filter}
        >
          <option value="">Select District</option>
          <option value="Pune">Pune</option>
          <option value="Bangalore">Bangalore</option>
          <option value="Mumbai">Mumbai</option>
          <option value="Chennai">Chennai</option>
          <option value="Hyderabad">Hyderabad</option>
        </select>
      </div>

      <div className={styles.resultsSection}>
        {filteredHomes.length > 0 ? (
          filteredHomes.map((home) => (
            <div
              key={home.id}
              className={styles.homeCard}
              onClick={() => setSelectedHome(home)}
            >
              <h3>{home.name}</h3>
              <p>{home.address}</p>
              <p>Capacity: {home.capacity}</p>
              <p>Current Occupancy: {home.currentOccupancy}</p>
              <button className={styles.moreInfoButton}>More Info</button>
            </div>
          ))
        ) : (
          <p>No homes found</p>
        )}
      </div>

      {selectedHome && (
        <div className={styles.modal} onClick={() => setSelectedHome(null)}>
          <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
            <h3>{selectedHome.name}</h3>
            <p>{selectedHome.description}</p>
            <p>Address: {selectedHome.address}</p>
            <p>Contact: {selectedHome.contact}</p>
            <p>Website: <a href={selectedHome.website} target="_blank" rel="noopener noreferrer">{selectedHome.website}</a></p>
            <p>Capacity: {selectedHome.capacity}</p>
            <p>Current Occupancy: {selectedHome.currentOccupancy}</p>
            
            <h4>Urgent Needs:</h4>
            <ul>
              {selectedHome.urgentNeeds.map((need, index) => (
                <li key={index}>{need}</li>
              ))}
            </ul>
            
            <h4>Donation Usage:</h4>
            <p>{selectedHome.donationUsage}</p>
            
            <h4>Donation Options:</h4>
            {selectedHome.donationOptions.map((option, index) => (
              <div key={index} className={styles.donationOption}>
                <p>₹{option.amount}: {option.description}</p>
                <button onClick={() => setDonationAmount(option.amount)}>Select</button>
              </div>
            ))}
            
            <h4>Impact Story:</h4>
            <p>{selectedHome.impactStory}</p>
            
            <h4>Tax Benefits:</h4>
            <p>{selectedHome.taxBenefits}</p>
            
            <div className={styles.donationSection}>
              <input
                type="number"
                value={donationAmount}
                onChange={(e) => setDonationAmount(e.target.value)}
                placeholder="Enter donation amount"
              />
              <button onClick={handleDonate} className={styles.donateButton}>
                Donate ₹{donationAmount}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function getFilteredOldAgeHomes(state, district, searchTerm) {
  return oldAgeHomesData.filter(
    (home) =>
      (state === '' || home.state === state) &&
      (district === '' || home.district === district) &&
      (home.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        home.contact.includes(searchTerm))
  );
}

export default Donation;