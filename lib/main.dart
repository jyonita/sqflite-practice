import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/details.dart';

import 'package:flutter_application_1/db_test.dart';

void main() {
  runApp(const MyApp());
}

Future<List<Users>> fetchUsers() async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      List<Users> users = usersFromJson(response.body);
      return users;

      // final jsonResponse = json.decode(jsonString);
      // Users user = Users.fromJson(jsonResponse);
      // print(user.username);

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users');
    }
  } on Exception catch (e) {
    return [];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning API call, also using Listview builder',
      home: HomePageAPICall(),
    );
  }
}

class HomePageAPICall extends StatefulWidget {
  const HomePageAPICall({Key? key}) : super(key: key);

  @override
  State<HomePageAPICall> createState() => _HomePageAPICallState();
}

class _HomePageAPICallState extends State<HomePageAPICall> {
  late Future<List<Users>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API call with list view builder'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Users>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // List<Users> data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserProfileScreen(
                                  user: snapshot.data![index],
                                );
                              }));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            tileColor: Colors.grey[100],
                            title: Text(
                              // data[index].id,
                              snapshot.data![index].name!,

                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data![index].id.toString(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Text("Sorry, could not fetch data");
          },
        ),
      ),
    );
  }
}
