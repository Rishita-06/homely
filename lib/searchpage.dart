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
                            age: '',
                            id: '102319076',
                            room: '210',
                            food: 'Vegeterian\nLactose Intolerant',
                            home: 'Pune\nMaharashtra',
                            care: 'Rajesh',
                            date: '21-09-2022',
                            contact: '9711239472',
                            activity: 'Pottery,Gardening',
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
                    // Define action on tap here
                  },
                  name: 'Priya',
                  age: '70',
                  disease: 'Hyper-\ntension',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Rajesh',
                  age: '68',
                  disease: 'Asthma',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Sunita',
                  age: '72',
                  disease: 'Cancer',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Anil',
                  age: '75',
                  disease: 'Heart\nDisease',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Rekha',
                  age: '80',
                  disease: 'Arthritis',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Vikram',
                  age: '74',
                  disease: 'Migraines',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Neeta',
                  age: '77',
                  disease: 'Stroke',
                ),
                SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: 'Ravi',
                  age: '69',
                  disease: 'Epilepsy',
                ),
                SearchCard(
                  ontap: () {
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
