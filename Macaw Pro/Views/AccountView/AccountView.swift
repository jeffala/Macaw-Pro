
import SwiftUI
import Firebase
import GoogleSignIn


struct AccountView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    @State private var isShowingPhotoPicker = false
    
    // This is the Image that needs to go to FireStore
    @State private var avatarImage = UIImage(named: "default-avatar")!
    
//    @State private var isLoggedOut = false
    
    
    var user: User = User(id: "000", firstName: "Jeff", lastName: "Licona", gender: "Male", genderOptions: ["Male", "Female", "Decline to answer"], proType: "Barber", email: "jeffalalg94@gmail.com")
        
    
    var body: some View {
        NavigationView {
            VStack(spacing: 35 ) {
                HStack {
                    Image(uiImage: avatarImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .padding()
                        .onTapGesture { isShowingPhotoPicker = true }
                    
                    
                    VStack(spacing: 8) {
                        Text("\(user.firstName + " " + user.lastName)")
                        
                        Text("\(user.proType)")
                    }
                }
                Text("My Services")
                    .font(.title2)
                Spacer()
            }
            .navigationTitle("Account")
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                PhotoPicker(avatarImage: $avatarImage)
            })
        }
    }
}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}




//    Button("Log Out") {
//
//        // Log out User...
////            DispatchQueue.global(qos: .background).async {
//            try? Auth.auth().signOut()
//
////            }
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





