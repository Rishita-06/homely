import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.ontap,
    required this.disease,
    required this.name,
    required this.age,
  });
  final VoidCallback ontap;
  final String disease;
  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 15,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFFe4f7ff),
            borderRadius: BorderRadius.circular(30)),
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFFe4f7ff),
                    borderRadius: BorderRadius.circular(20)),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Icon(
                                Icons.account_circle_rounded,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 2.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Text(
                                name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                        ),
                        child: Text(
                          'Age: $age',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Text(
                                disease,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 130.0),
                child: Stack(
                  children: [
                    // The Container
                    GestureDetector(
                      onTap: ontap,
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFF315ee7),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    // The Text on top of the Container
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'VIEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0, // Adjust as needed
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
