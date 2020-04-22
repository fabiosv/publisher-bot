package xyz.company.publisher_mobile

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.facebook.FacebookSdk
import com.facebook.appevents.AppEventsLogger

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

    override fun onCreate() {
        super.onCreate()
        FacebookSdk.sdkInitialize(getApplicationContext())
        AppEventsLogger.activateApp(this)
    }
}
