

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct MacawApp: App {
    @AppStorage("userSignIn") private var userSignIn: Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreenView()
                .environment(\.userSignIn, $userSignIn)
        }
    }
    
    
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
