import 'package:flutter/material.dart';
import 'package:homely/model_page.dart';
import 'package:homely/search_card.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'All Residents',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Diabetes',
                            name: 'Amit',
                            age: '65',
                            id: '102319076',
                            room: '210',
                            food: 'Vegeterian\nLactose Intolerant',
                            home: 'Pune\nMaharashtra',
                            care: 'Rajesh',
                            date: '21-09-2022',
                            contact: '9711239472',
                            activity: 'Potter, Gardening',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Amit',
                  age: '65',
                  disease: 'Diabetes',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Hyper-\ntension',
                            name: 'Priya',
                            age: '70',
                            id: '102319678',
                            room: '239',
                            food: 'Vegetarian',
                            home: 'Ahmedabad',
                            care: 'Sita',
                            date: '15-01-2024',
                            contact: '9567890123',
                            activity: 'Music\nGardening',
                          ),
                        ),
                      );
                    });
                  },
                  name: 'Priya',
                  age: '70',
                  disease: 'Hyper-\ntension',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Asthma',
                            name: 'Rajesh',
                            age: '68',
                            id: '102378976',
                            room: '105',
                            food: 'Non-Vegetarian',
                            home: 'Pune',
                            care: 'Amit',
                            date: '10-12-2023',
                            contact: '9456789012',
                            activity: 'Photography\nTraveling',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Rajesh',
                  age: '68',
                  disease: 'Asthma',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Cancer',
                            name: 'Sunita',
                            age: '72',
                            id: '102313874',
                            room: '190',
                            food: 'Vegan',
                            home: 'Jaipur',
                            care: 'Anita',
                            date: '11-05-2023',
                            contact: '9345678901',
                            activity: 'Hiking\nReading',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Sunita',
                  age: '72',
                  disease: 'Cancer',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Heart\nDisease',
                            name: 'Anil',
                            age: '75',
                            id: '102387076',
                            room: '340',
                            food: 'Vegetarian',
                            home: 'Hyderabad',
                            care: 'Vikram',
                            date: '30-10-2023',
                            contact: '9234567890',
                            activity: 'Yoga\nCooking',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Anil',
                  age: '75',
                  disease: 'Heart\nDisease',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Arthritis',
                            name: 'Rekha',
                            age: '80',
                            id: '102365076',
                            room: '270',
                            food: 'Non-Vegetarian',
                            home: 'Kolkata',
                            care: 'Neeta',
                            date: '25-09-2023',
                            contact: '9123456789',
                            activity: 'Swimming\nWriting',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Rekha',
                  age: '80',
                  disease: 'Arthritis',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Migraines',
                            name: 'Vikram',
                            age: '74',
                            id: '104519076',
                            room: '301',
                            food: 'Vegetarian',
                            home: 'Chennai',
                            care: 'Arjun',
                            date: '20-08-2023',
                            contact: '9999988888',
                            activity: 'Music\nPainting',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Vikram',
                  age: '74',
                  disease: 'Migraines',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Stroke',
                            name: 'Neeta',
                            age: '77',
                            id: '102317896',
                            room: '135',
                            food: 'Vegan',
                            home: 'Bengaluru',
                            care: 'Pooja',
                            date: '15-07-2023',
                            contact: '9988766554',
                            activity: 'Cycling\nGardening',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Neeta',
                  age: '77',
                  disease: 'Stroke',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Epilepsy',
                            name: 'Ravi',
                            age: '69',
                            id: '102314596',
                            room: '238',
                            food: 'Non-Vegetarian',
                            home: 'Delhi',
                            care: 'Ravi',
                            date: '12-06-2023',
                            contact: '9876543210',
                            activity: 'Travelling\nPhotography',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Ravi',
                  age: '69',
                  disease: 'Epilepsy',
                ),
                SearchCard(
                  ontap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModelPage(
                            ontap: () {},
                            disease: 'Multiple\nSclerosis',
                            name: 'Suman',
                            age: '73',
                            id: '102317000',
                            room: '101',
                            food: 'Vegetarian\nLactose Intolerant',
                            home: 'Mumbai',
                            care: 'Isha',
                            date: '05-10-2023',
                            contact: '9820012345',
                            activity: 'Reading\nCooking',
                          ),
                        ),
                      );
                    });
                    // Define action on tap here
                  },
                  name: 'Suman',
                  age: '73',
                  disease: 'Multiple\nSclerosis',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
