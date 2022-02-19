
import SwiftUI
import Firebase
import GoogleSignIn



struct AccountView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    @State private var isLoggedOut = false

    
    var body: some View {
        VStack {
            PrimaryButton(title: "Profile Information")
            
            Spacer()
                .frame(maxHeight: 50)
            
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
        .padding()
        .padding()
    }
}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}







