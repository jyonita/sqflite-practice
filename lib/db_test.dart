import 'dart:async';

import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Open the database and store the reference.
  final database = openDatabase(
    //Set the path to the database. Note: Using the 'join' function
    //from the path package is best practice to ensure the path is
    //correctly constructed for each platform.
    join(await getDatabasesPath(), 'users_database.db'),
    //When the database is first created, create a table to store users.
    onCreate: (db, version) => db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT UNIQUE, username TEXT, email TEXT )',
    ),
    version: 1,
  );

  //Define a function that inserts users into the database
  Future<void> insertUsers(Users users) async {
    //Get a reference to the database.
    final db = await database;

    //Insert the Users into the correct table. You might also specify the
    // conflictAlgorithm to use in case the same user is inserted twice.

    // In this case, replace any previous data.
    await db.insert(
      'users',
      users.toJson(),
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  //A method that retrives all the users from the User table.
  Future<List<Users>?> users() async {
    //Get a reference to the database.
    final db = await database;

    //Query the table for all the Users.
    final List<Map<String, dynamic>> maps = await db.query('users');
    //Convert the List<Map<String, dynamic>> into a List<Users>.
    List<Users> users = [];
    for (Map<String, dynamic> user in maps) {
      users.add(Users.fromJson(user));
    }
    return users;
    // return List.generate(maps.length, (i) {
    //   return Users(
    //     id: maps[i]['id'],
    //     name: maps[i]['name'],
    //     username: maps[i]['username'],
    //     email: maps[i]['email'],
    //   );
    // });
  }

  Future<void> updateUsers(Users user) async {
    //Get a reference to the database.
    final db = await database;
    //Update the given User
    await db.update(
      'users',
      user.toJson(),
      //Ensure that the User has a matching id.
      where: user.id!.toString(),
      //Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
  }

  //Create a User and add it to users table
}
