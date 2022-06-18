import SwiftUI
import Firebase
// import GoogleSignIn

struct ProfileView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    // @State private var isLoggedOut = false
    
    var user: User = User(id: "000", firstName: "Jeff", lastName: "Licona",
                          gender: "Male", genderOptions: ["Male", "Female",
                          "Decline to answer"], proType: "Barber", email: "jeffalalg94@gmail.com")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        ProfileImageView()
                            .padding()
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            Text(user.proType)
                                .font(.system(size: 20))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        NavigationLink("Edit", destination: EditProfileView())})
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//    Button("Log Out") {
//
//        // Log out User...
//            DispatchQueue.global(qos: .background).async {
//            try? Auth.auth().signOut()
//            }
//
//        // Google Log out User...
//        GIDSignIn.sharedInstance.signOut()
//
//
//        // Taking user out of logged in view...
//        self.isLoggedOut = true
//
//        // Setting userSigned back to false
//        self.userSignIn.wrappedValue = false
//    }
//    .fullScreenCover(isPresented: $isLoggedOut, onDismiss: nil) {
//        WelcomeScreenView()
//    }
