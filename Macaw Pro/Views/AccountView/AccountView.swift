
import SwiftUI
import Firebase
import GoogleSignIn



struct AccountView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    @State private var isLoggedOut = false
    
//    var user: User = User(id: "000", firstName: "Jeff", lastName: "Licona", gender: "Male", proType: "Barber", email: "k=jdfd", service1Name: "Pickle Slap", service1Price: 100)
        
    
    var body: some View {
        NavigationView {
            VStack(spacing: 35 ) {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .redacted(reason: .placeholder)
                    
                    VStack(spacing: 8) {
//                        Text("\(user.firstName + " " + user.lastName)")
//                            .font(.headline)
//                        Text("\(user.proType)")
//                            .font(.subheadline)
                    }
                }
                Text("Services")
            }
            .navigationTitle("Account")
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
}



struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}


extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}







