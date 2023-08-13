import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4gHNePt_PJL2MfYrUZ4HImGwRD8cZF98',
    appId: '1:796639073022:android:bf0a2aa454cdce684f8baf',
    messagingSenderId: '796639073022',
    projectId: 'signinsignup-dad5a',
    storageBucket: 'signinsignup-dad5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfe_vGKNg1OMcFSrU_pq0mn3PSVe-W-TM',
    appId: '1:796639073022:ios:dc199663f6aadeaf4f8baf',
    messagingSenderId: '796639073022',
    projectId: 'signinsignup-dad5a',
    storageBucket: 'signinsignup-dad5a.appspot.com',
    iosClientId:
        '796639073022-obp4t7ppef2cpmjg9oijkvto0st781sq.apps.googleusercontent.com',
    iosBundleId: 'com.example.evaliaFlutter',
  );
}
