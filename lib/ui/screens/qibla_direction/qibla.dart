import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:prophetspath/ui/screens/qibla_direction/qibla_compass.dart';

class QiblaDirection extends StatelessWidget {
  const QiblaDirection({super.key});
  static String routeName = "/qibla";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: FutureBuilder(
          future: FlutterQiblah.androidDeviceSensorSupport(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.hasData) {
              return const QiblaCompass();
            } else {
              return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
