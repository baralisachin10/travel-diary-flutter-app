import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Travel Diary'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey,
                          child: Icon(
                            Icons.account_circle,
                            size: 40,
                          ),
                        ),
                        title: Text('Sachin'),
                        subtitle: Text('date'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //caption area
                      const Text(
                        'what a exciting moment. I enjoyed a lot here.😲',
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // image
                      Image.asset(
                        'lib/assets/images/horseriding.jpg',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //second post
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.grey,
                          child: Icon(
                            Icons.account_circle,
                            size: 40,
                          ),
                        ),
                        title: Text('Sachin'),
                        subtitle: Text('date'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //caption area
                      const Text(
                        'what a exciting moment. I enjoyed a lot here.😲',
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // image
                      Image.asset(
                        'lib/assets/images/horseriding.jpg',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
