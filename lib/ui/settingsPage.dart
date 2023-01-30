import 'package:clean_settings_nnbd/clean_settings_nnbd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receipies/main.dart';
import 'package:receipies/ui/home_about/aboutPage.dart';
import 'package:receipies/ui/home_feedback/feedbackPage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int counter = 0;
  String theme = 'Light';
  bool smartReply = false;
  String? autoReplyMessage;
  int daysOfMailToSync = 5;

  bool disableDemoItems = false;

  bool smartCompose = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          ' Settings',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: SettingContainer(
        sections: [
          SettingSection(
            title: 'Appearance',
            items: [
              SettingRadioItem<String>(
                priority: disableDemoItems
                    ? ItemPriority.disabled
                    : ItemPriority.normal,
                title: 'Theme',
                displayValue: '$theme theme',
                selectedValue: theme,
                items: [
                  SettingRadioValue('Light', 'Light'),
                  SettingRadioValue('Dark', 'Dark'),
                ],
                onChanged: (v) => setState(() => theme = v),
              ),
            ],
          ),
          SettingSection(
            title: 'Indox',
            items: [
              SettingItem(
                title: 'Feedback',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackPage()),
                  );
                },
              ),
            ],
          ),
          SettingSection(
            title: 'More',
            items: [
              SettingItem(
                title: 'Press',
                displayValue: counter.toString(),
                onTap: () => setState(() => counter++),
                priority: disableDemoItems
                    ? ItemPriority.disabled
                    : ItemPriority.normal,
              ),
            ],
          ),
          SettingSection(
            title: 'About',
            items: [
              SettingItem(
                title: 'About the app',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
