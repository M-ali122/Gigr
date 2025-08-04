import 'package:flutter/material.dart';
import 'package:newgigr/view/navbar_screen.dart';
import 'package:newgigr/widgets/custome_button.dart';
import 'package:newgigr/widgets/custome_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Enter Old Password',
               icon: Icons.lock
            ),
            CustomTextField(
              hintText: 'Enter New Password',
               icon: Icons.lock
            ),
            CustomTextField(
              hintText: 'Confirm Password',
               icon: Icons.lock
            ),
            Spacer(),
            CustomeButton(
              title: 'Updated Password',
                onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => NavBarScreen(),)
                );
              }
            )
          ],
        ),
      ),
    );
  }
}