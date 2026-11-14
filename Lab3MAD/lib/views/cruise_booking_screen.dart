import 'package:flutter/material.dart';
import 'widgets/image_section.dart';
import 'widgets/title_section.dart';
import 'widgets/button_section.dart';
import 'widgets/text_section.dart';
import 'widgets/preference_section.dart';

class CruiseBookingScreen extends StatelessWidget {
  const CruiseBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cruise Booking App'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            // Landscape Mode: Flexible Side-by-Side Split Pane
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        ImageSection(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        TitleSection(),
                        ButtonSection(),
                        TextSection(),
                        PreferenceSection(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Portrait Mode: Vertical Single Column ListView
            return ListView(
              children: const [
                ImageSection(),
                TitleSection(),
                ButtonSection(),
                TextSection(),
                PreferenceSection(),
              ],
            );
          }
        },
      ),
    );
  }
}