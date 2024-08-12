import 'dart:convert';
import 'package:floodwatch_weather/views/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(
        height2: 100,height1: 80,
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/contact_info.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data.toString().isEmpty) {
            return Center(child: Text('No data found.'));
          } else {
            final List<dynamic> data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final category = data[index]['category'];
                final contacts = List<Map<String, dynamic>>.from(data[index]['contacts']);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      itemBuilder: (context, contactIndex) {
                        final contact = contacts[contactIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Material(
                            elevation: 4.0,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.indigo, width: 1.0),
                              ),
                              child: ListTile(
                                leading: contact.containsKey('image')
                                    ? Image.asset(
                                  contact['image'],
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                )
                                    : null,
                                title: Text(
                                  contact['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  contact['description'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                trailing: contact.containsKey('phone')
                                    ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      contact['phone'],
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                    Text(
                                      contact['email'],
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                  ],
                                )
                                    : GestureDetector(
                                  onTap: () => _launchURL(contact['link']),
                                  child: Icon(
                                    Icons.link,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(color: Colors.indigo),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  // Function to open URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
