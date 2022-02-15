

import SwiftUI
import FirebaseAuth
import Firebase
import GoogleSignIn

struct BookView: View {
    @State private var isLoggedOut = false
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>


    var body: some View {
        
        Button("Log Out") {
            
            // Log out User...
//            DispatchQueue.global(qos: .background).async {
                try? Auth.auth().signOut()
                
//            }
            
            // Google Log out User...
            GIDSignIn.sharedInstance.signOut()
            
                        
            // Taking user out of logged in view...
            self.isLoggedOut = true
            
            // Setting userSigned back to false
            self.userSignIn.wrappedValue = false
            
            
        }
        .fullScreenCover(isPresented: $isLoggedOut, onDismiss: nil) {
            WelcomeScreenView()
        }
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
