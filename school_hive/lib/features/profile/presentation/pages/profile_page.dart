import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage('https://unsplash.com/photos/XQWfro4LrVs'),
                ),
              ),
            ),
          ),
          const Text(
            'Lidia Daniel',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Text(
            '5th year student\nLove working on UI/UX',
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              prefixIcon: Icon(Icons.alternate_email),
            ),
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: 'Phone Number',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              prefixIcon: Icon(Icons.alternate_email),
            ),
          ),
        ],
      ),
    );
  }
}
