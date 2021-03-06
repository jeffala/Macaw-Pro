import SwiftUI
import Firebase
// import GoogleSignIn

@main
struct MacawPro: App {
    @AppStorage("userSignIn") private var userSignIn: Bool = false
    init() {
        FirebaseApp.configure()
        // Dealing with outdated UI Constraints warnings
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    var body: some Scene {
        WindowGroup {
//            if userSignIn {
//                MainView()
//            } else {
//            WelcomeScreenView()
//                .environment(\.userSignIn, $userSignIn)
//            }
            MainView()
        }
    }

//    func application(_ application: UIApplication, open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey: Any])
//      -> Bool {
//      return GIDSignIn.sharedInstance.handle(url)
//    }
}
