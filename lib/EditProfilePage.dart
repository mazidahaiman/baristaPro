import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2, // 30% of the screen height
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: ProfilePicture(),
                  ),
                ),
              ),
              Expanded(
                flex: 8, // 70% of the screen height
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: EditProfileForm(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/avatar.png"), // Replace with your image asset
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Ayodele Motunrayo",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class EditProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "First name", hintText: "Ayodele", icon: Icons.person),
        const SizedBox(height: 15),
        CustomTextField(label: "Last name", hintText: "Motunrayo", icon: Icons.person),
        const SizedBox(height: 15),
        CustomTextField(label: "Email address", hintText: "Ayodele.turayo@gmail.com", icon: Icons.email),
        const SizedBox(height: 15),
        CustomTextField(label: "Phone number", hintText: "+234 8146424781", icon: Icons.phone),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: Text("Save changes", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;

  CustomTextField({required this.label, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Make the label bold
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}