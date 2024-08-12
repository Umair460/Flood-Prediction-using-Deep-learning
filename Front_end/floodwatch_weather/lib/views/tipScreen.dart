import 'dart:convert';
import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Safety Tips'),
        backgroundColor: Colors.blue.shade700, // Custom color for AppBar
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/safety_tips.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final List<dynamic> data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.all(8.0), // Padding around the ListView
              itemBuilder: (context, index) {
                final heading = data[index]['heading'];
                final tips = List<Map<String, dynamic>>.from(data[index]['tips']);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700, // Custom color for heading
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tips.length,
                      itemBuilder: (context, tipIndex) {
                        final tip = tips[tipIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.blue.shade700, width: 1.0), // Border with custom color
                              ),
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    tip['image'],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  tip['text'],
                                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(color: Colors.blue.shade700),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
