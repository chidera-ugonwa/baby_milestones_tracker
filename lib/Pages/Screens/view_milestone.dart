import 'package:baby_milestones_tracker/Pages/Screens/edit_milestone.dart';
import 'package:flutter/material.dart';

class ViewMilestone extends StatefulWidget {
  const ViewMilestone(
      {super.key,
      required this.photoUrl,
      required this.title,
      required this.date,
      required this.desc});
  final String photoUrl;
  final String title;
  final String date;
  final String desc;

  @override
  State<ViewMilestone> createState() => _ViewMilestoneState();
}

class _ViewMilestoneState extends State<ViewMilestone> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
          actions: [
            TextButton(
              child: const Text(
                'Edit',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditMilestone(
                              photoUrl: widget.photoUrl,
                              title: widget.title,
                              desc: widget.desc,
                              date: widget.date,
                            )));
              },
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.photoUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.desc,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              )
            ])));
  }
}
