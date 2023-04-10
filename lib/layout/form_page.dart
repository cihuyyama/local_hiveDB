import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:local_hivedb/layout/home_page.dart';
import 'package:local_hivedb/main.dart';
import 'package:local_hivedb/model/contact.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late Box<Contact> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('databaseContact');
    print("contactsBox.length: ${box.values.length}");
  }

  String? name;
  String? email;
  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your phone',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    phone = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                  onPressed: () {
                    Contact ct = Contact(
                      name: name!,
                      email: email!, 
                      phone: phone!
                      );

                      box.add(ct);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage(),)
                    // )
                  },
                  child: const Text('Save')
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}