-injars build
-injars lib/jopt-simple-4.9.jar(!META-INF/**)
-injars lib/json-simple-1.1.1.jar(!META-INF/**)
-injars lib/lanterna-3.0.0-beta1.jar(!META-INF/**)
# JNA is library because we package everything back in
-libraryjars ext/jnasmartcardio/jnasmartcardio.jar
-libraryjars  <java.home>/lib/rt.jar
-libraryjars  <java.home>/lib/jce.jar
-outjars optimized-apdu4j.jar
-dontobfuscate
-dontoptimize
# APDUReplayProvider is supposed to be used by others
-keep public class apdu4j.APDUReplayProvider {*;}
-keep public class apdu4j.APDUReplayProvider$* {*;}
# Everything about RemoteTerminal is kept
-keep public class apdu4j.remote.RemoteTerminal {*;}
-keep public class apdu4j.remote.SocketTransport {*;}
-keep public class apdu4j.LoggingCardTerminal {*;}
-keep public class apdu4j.TerminalManager {
    public <methods>;
}
-keep public class apdu4j.ISO7816 {
    public <fields>;
}
# Command line utility
-keep public class apdu4j.SCTool {
    public static void main(java.lang.String[]);
}
# For enum-s (why this is not default?)
-keepclassmembers,allowoptimization enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-printseeds
-dontnote