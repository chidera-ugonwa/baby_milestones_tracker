import 'package:baby_milestones_tracker/Pages/Screens/view_milestone.dart';
import 'package:flutter/material.dart';
import '../Screens/create_milestone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isLoading = true;
  List<Map> items = [];
  // final FirebaseService _fService = FirebaseService();

  Future getMilestones() async {
    await FirebaseFirestore.instance
        .collection('userData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('milestones')
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          var data = docSnapshot.data();
          items.add({
            'title': data['title'],
            'date': data['date'],
            'desc.': data['desc.'],
            'photoLink': data['photoLink']
          });
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getMilestones();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewMilestone()));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/image2.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              child: const Stack(
                children: [
                  Positioned(
                    bottom: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Afternoon",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Ada & Obi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 0, 20.0),
              child: Text(
                'Milestones',
                style: TextStyle(fontSize: 24),
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8.0,
                        crossAxisCount: 2,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GridTile(
                            footer: Text(
                              items[index]['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewMilestone(
                                              date: items[index]['date'],
                                              photoUrl: items[index]
                                                  ['photoLink'],
                                              title: items[index]['title'],
                                              desc: items[index]['desc.'],
                                            )));
                              },
                              child: Image.network(
                                items[index]['photoLink'],
                                fit: BoxFit.cover,
                              ),
                            ));
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
