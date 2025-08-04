import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TermsConditionsContent(),
      ),
    );
  }
}

class TermsConditionsContent extends StatelessWidget {
  const TermsConditionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(title: '1. Acceptance of Terms'),
          SectionText(
            text: 'By using this app, you agree to be bound by these Terms and Conditions. '
              'If you do not agree with any part of the terms, please do not use the app.'),

          SectionTitle(title: '2. User Responsibilities'),
          SectionText(
             text: 'You agree to use the app only for lawful purposes. You must not misuse, modify, or attempt to hack the application.'),

          SectionTitle(title: '3. Intellectual Property'),
          SectionText(
             text: 'All content, trademarks, and data on this app, including software, design, and text, are the property of the company and protected by copyright laws.'),

          SectionTitle(title: '4. Limitation of Liability'),
          SectionText(
             text: 'We are not liable for any indirect, incidental, or consequential damages arising from your use of the app.'),

          SectionTitle(title: '5. Termination'),
          SectionText(
             text: 'We reserve the right to suspend or terminate your access to the app if you violate these terms.'),

          SectionTitle(title: '6. Changes to Terms'),
          SectionText(
             text: 'We may update these Terms and Conditions at any time without prior notice. Continued use of the app signifies your acceptance of the changes.'),

          SectionTitle(title: '7. Contact Us'),
          SectionText(
             text: 'If you have any questions about these Terms and Conditions, please contact us at support@example.com.'),

          SizedBox(height: 20),
          Text(
            'Effective Date: August 4, 2025',
            style: TextStyle(fontStyle: FontStyle.italic),
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
