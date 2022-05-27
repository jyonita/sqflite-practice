import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/user.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({required this.user, Key? key}) : super(key: key);

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    print("Card Clicked");
                  },
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[100],
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            // data[index].id,
                            user.email!,

                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.phone ?? '',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.company?.name ?? '',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.address?.city ?? '',
                          ),
                          Text(
                            user.url ?? '',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
