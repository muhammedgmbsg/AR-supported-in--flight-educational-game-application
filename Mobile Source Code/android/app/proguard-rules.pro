# ARCore & Sceneform
-keep class com.google.ar.core.** { *; }
-dontwarn com.google.ar.core.**

-keep class com.google.ar.sceneform.** { *; }
-dontwarn com.google.ar.sceneform.**

# Plugin’in kendi paket adını koru
-keep class com.difrancescogianmarco.arcore_flutter_plugin.** { *; }

# Flutter platform-view ve method channel reflection’ını koru
-keep class io.flutter.plugin.common.MethodChannel { *; }
-keep class io.flutter.plugin.common.BinaryMessenger { *; }
-keep class io.flutter.plugin.platform.PlatformView { *; }

# Kotlin metadata (required for data class reflection, vsync, vb.)
-keep class kotlin.Metadata { *; }

# Annotation’lar, run-time reflection için önemli olabilir
-keepattributes *Annotation*

# Native bridge’ler
-keepclasseswithmembernames class * {
    native <methods>;
}
# -------------------------
# Aşağıya missing_rules.txt’den kopyaladıklarınızı yapıştırın:
-keep class com.google.ar.sceneform.animation.AnimationEngine { *; }
-keep class com.google.ar.sceneform.animation.AnimationLibraryLoader { *; }
-keep class com.google.ar.sceneform.assets.Loader { *; }
-keep class com.google.ar.sceneform.assets.ModelData { *; }
-keep class com.google.devtools.build.android.desugar.runtime.ThrowableExtension { *; }
-keep class j$.util.function.Consumer$*-CC { *; }
# -------------------------
