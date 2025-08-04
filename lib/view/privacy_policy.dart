import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PrivacyPolicyContent(),
      ),
    );
  }
}

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(title: '1. Introduction'),
          SectionText(
              text: 'We value your privacy and are committed to protecting your personal information. '
              'This Privacy Policy explains how we collect, use, and safeguard your data.'),

          SectionTitle(title: '2. Information We Collect'),
          SectionText(
              text: 'We may collect personal information such as name, email, phone number, and location. '
              'We also collect usage data to improve our services.'),

          SectionTitle(title: '3. How We Use Your Information'),
          SectionText(
              text: 'We use your information to provide and improve our services, communicate with you, '
              'and ensure safety and compliance with laws.'),

          SectionTitle(title: '4. Data Security'),
          SectionText(
             text:  'We implement appropriate security measures to protect your data from unauthorized access, '
              'disclosure, or alteration.'),

          SectionTitle(title: '5. Third-Party Services'),
          SectionText(
             text:  'We may share your data with third-party services for analytics, payment processing, '
              'or other features, but only with your consent.'),

          SectionTitle(title: '6. Your Rights'),
          SectionText(
              text:  'You have the right to access, update, or delete your personal data. '
              'Contact us at support@example.com for any privacy-related queries.'),

          SectionTitle(title: '7. Changes to This Policy'),
          SectionText(
              text: 'We may update this Privacy Policy from time to time. Please review it periodically for any changes.'),

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
