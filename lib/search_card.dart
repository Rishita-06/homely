import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard(
      {super.key,
      required this.ontap,
      required this.imageUrl,
      required this.name,
      required this.time1,
      required this.author1});
  final VoidCallback ontap;
  final String imageUrl;
  final String name;
  final String time1;
  final String author1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFFe4f7ff),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: const Color(0xFFe4f7ff),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 20.0),
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      'Age:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Text(
                          'DISEASE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: const Color(0xFFe4f7ff),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
