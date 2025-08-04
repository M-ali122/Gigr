import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: AboutUsContent(),
      ),
    );
  }
}

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(title: 'Who We Are'),
          SectionText(
            text:'We are a passionate team dedicated to delivering high-quality digital solutions. '
              'Our app is designed to provide a smooth, secure, and efficient experience for our users.'),

          SectionTitle(title: 'Our Mission'),
          SectionText(
             text:  'Our mission is to innovate and simplify services for users by using cutting-edge technology, '
              'user-friendly interfaces, and reliable support.'),

          SectionTitle(title: 'What We Offer'),
          SectionText(
             text:  '• Easy-to-use platform\n'
              '• Secure and fast service\n'
              '• Continuous updates and improvements\n'
              '• Responsive customer support'),

          SectionTitle(title: 'Our Team'),
          SectionText(
             text:  'Our team consists of experienced developers, designers, and customer support professionals '
              'working together to provide the best possible experience.'),

          SectionTitle(title: 'Contact Us'),
          SectionText(
             text:  'If you have any questions, feedback, or suggestions, feel free to reach out at:\n'
              '📧 muhammadali@example.com\n'
              '📞 +1 234 567 8900'),

          SizedBox(height: 20),
          Center(
            child: Text(
              'Thank you for choosing our app!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.justify,
    );
  }
}
