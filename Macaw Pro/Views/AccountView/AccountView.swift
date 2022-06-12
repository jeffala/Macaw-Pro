import SwiftUI
import Firebase
import GoogleSignIn
import PhotosUI

struct Photo: Identifiable {
    var data: Data
    var id: String {
        return data.base64EncodedString()
    }
}

struct AccountView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    // This is the Image that needs to go to FireStore
    @State private var avatarImage = UIImage(named: "default-avatar")!
    //    @State private var isLoggedOut = false
    var user: User = User(id: "000", firstName: "Jeff",
                          lastName: "Licona", gender: "Male",
                          genderOptions: ["Male", "Female", "Decline to answer"],
                          proType: "Barber", email: "jeffalalg94@gmail.com")
    @State private var selectedPhotos = [PhotosPickerItem]()
    @State private var photos = [Photo]()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPhotos, selectionBehavior: .ordered,  matching: .images, preferredItemEncoding: .automatic) {
                    Image("default-avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 1204, height: 120)
                        .clipShape(Circle())
                }
            }
            .navigationTitle("Account profile")
            
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
