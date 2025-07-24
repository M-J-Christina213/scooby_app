plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // Required for Firebase
    id("dev.flutter.flutter-gradle-plugin") // Flutter Gradle plugin (after Android/Kotlin)
}

android {
    namespace = "com.example.flutter_application_scooby"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.flutter_application_scooby"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // Temporary for release builds
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM: handles versions automatically
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))

    // Firebase core services (add/remove based on your use case)
    implementation("com.google.firebase:firebase-analytics")      // Optional
    implementation("com.google.firebase:firebase-auth")           // For authentication
    implementation("com.google.firebase:firebase-firestore")      // For Firestore DB
    implementation("com.google.firebase:firebase-database")       // For Realtime Database
    implementation("com.google.firebase:firebase-messaging")      // For push notifications
}
