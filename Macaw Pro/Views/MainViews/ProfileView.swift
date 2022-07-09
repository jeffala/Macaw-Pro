import SwiftUI
import Firebase
// import GoogleSignIn

var userSampleData: User = User(id: "000",
                                firstName: "Jeff",
                                lastName: "Licona",
                                gender: "Male",
                                genderOptions: ["Male", "Female", "Decline to answer"],
                                proType: "Barber",
                                email: "jeffalalg94@gmail.com")

var servicesSampleData: Services = Services(service1Name: "Hair Cut", service1Price: 30, service2Name: "Fade", service2Price: 15, service3Name: "Kid Hair cut", service3Price: 25, service4Name: "Beard", service4Price: 15, service5Name: "Mustach", service5Price: 10, service6Name: "Woman Hair cut", service6Price: 50, service7Name: "Hair cut with beard", service7Price: 70, service8Name: "Head shave", service8Price: 25, service9Name: "black mask", service9Price: 15, service10Name: "Royal skin fade", service10Price: 25)

struct ProfileView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    // @State private var isLoggedOut = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        ProfileImageView()
                            .padding()
                        VStack(alignment: .leading) {
                            Text("\(userSampleData.firstName) \(userSampleData.lastName)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            Text(userSampleData.proType)
                                .font(.system(size: 20))
                        }
                        Spacer()
                    }
                }
                VStack(spacing: 1) {
                Text("My Services")
                    .font(.system(size: 20))
                    .bold()
                ServicesView()
                }
                .padding(.vertical)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    NavigationLink("Edit", destination: EditProfileView())})
            }
            .navigationTitle("Profile")
        }
    }
}

struct ServicesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(servicesSampleData.service1Name)
                Spacer()
                Text("$\(servicesSampleData.service1Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service2Name)
                Spacer()
                Text("$\(servicesSampleData.service2Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service3Name)
                Spacer()
                Text("$\(servicesSampleData.service3Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service4Name)
                Spacer()
                Text("$\(servicesSampleData.service4Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service5Name)
                Spacer()
                Text("$\(servicesSampleData.service5Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service6Name)
                Spacer()
                Text("$\(servicesSampleData.service6Price, specifier: "%.2f")")
            }
            .padding()
            HStack {
                Text(servicesSampleData.service7Name)
                Spacer()
                Text("$\(servicesSampleData.service7Price, specifier: "%.2f")")
            }
            .padding()
            
        }
        .font(.system(size: 18))
        .padding()
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
