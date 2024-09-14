import 'package:flutter/material.dart';
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
                    // Define action on tap here
                  },
                  name: 'Amit Singh',
                  age: '65',
                  disease: 'Diabetes',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Priya Kumari',
                  age: '70',
                  disease: 'Hypertension',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Rajesh Kumar',
                  age: '68',
                  disease: 'Asthma',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Sunita Agarwal',
                  age: '72',
                  disease: 'Cancer',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Anil Kapoor',
                  age: '75',
                  disease: 'Heart Disease',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Rekha Singhal',
                  age: '80',
                  disease: 'Arthritis',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Vikram Ghotra',
                  age: '74',
                  disease: 'Migraines',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Neeta Gupta',
                  age: '77',
                  disease: 'Stroke',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Ravi Lakhanpal',
                  age: '69',
                  disease: 'Epilepsy',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Suman Seth',
                  age: '73',
                  disease: 'Multiple Sclerosis',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
