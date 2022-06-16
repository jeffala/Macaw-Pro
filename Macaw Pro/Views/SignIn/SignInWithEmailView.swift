// import SwiftUI
// import FirebaseAuth
//
// struct SignInWithEmailView: View {
//    @State var email: String = ""
//    @State var password: String = ""
//    var body: some View {
//        VStack {
//                Spacer()
//                Text("Send Email Link")
//                    .font(.system(size: 30))
//                    .bold()
//                    .padding(.bottom, 40)
//                TextField("Email", text: $password)
//                .disableAutocorrection(true)
//                .textInputAutocapitalization(.never)
//                    .padding()
//                    .background(Color.gray.opacity(0.2).cornerRadius(10))
//                    .font(.headline)
//                    .padding(.horizontal)
//            PrimaryButton(title: "Send Sign In Email")
//                .padding()
//            Spacer()
//            Spacer()
//        }
//    }
// }
//
// struct SignInWithEmailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInWithEmailView()
//    }
// }
