import 'package:flutter/material.dart';
import 'package:homely/search_card.dart';

class Profilepagehe extends StatefulWidget {
  const Profilepagehe({super.key});

  @override
  State<Profilepagehe> createState() => _ProfilepageheState();
}

class _ProfilepageheState extends State<Profilepagehe> {
  final List<Map<String, String>> caretakers = [
    {'name': 'Rajesh', 'age': '40', 'specialty': 'Nursing'},
    {'name': 'Sita', 'age': '35', 'specialty': 'Physical\nTherapy'},
    {'name': 'Amit', 'age': '50', 'specialty': 'Therapy'},
    {'name': 'Anita', 'age': '45', 'specialty': 'Speech\nTherapy'},
    {'name': 'Vikram', 'age': '55', 'specialty': 'Geriatric\nCare'},
    {'name': 'Neeta', 'age': '30', 'specialty': 'Medical\nAssistance'},
    {'name': 'Arjun', 'age': '60', 'specialty': 'Mental\nHealth'},
    {'name': 'Pooja', 'age': '28', 'specialty': 'Home\nCare'},
    {'name': 'Ravi', 'age': '65', 'specialty': 'Palliative\nCare'},
    {'name': 'Isha', 'age': '40', 'specialty': 'Emergency\nCare'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter caretakers based on the search query
    final filteredCaretakers = caretakers.where((caretaker) {
      return caretaker['name']!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'All Caretakers',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            Column(
              children: filteredCaretakers.map((caretaker) {
                return SearchCard(
                  ontap: () {
                    // Define action on tap here
                  },
                  name: caretaker['name']!,
                  age: caretaker['age']!,
                  disease: caretaker[
                      'specialty']!, // Using 'specialty' to match the property
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
