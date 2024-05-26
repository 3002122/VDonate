import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  print('Running on Web');
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDrCbfhBLgPG3nD9bP_NCfzv1bl_iljJv4",
          appId: "1:1051755635958:android:78989ac32f1def6a7978d7",
          messagingSenderId: "1051755635958",
          projectId: "vdonate-9a1b2",
          ),
      );
}