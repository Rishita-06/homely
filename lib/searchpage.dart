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
      body: Padding(
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
            SearchCard(
              ontap: () {},
              imageUrl: '',
              time1: '',
              name: '',
              author1: '',
            )
          ],
        ),
      ),
    );
  }
}
