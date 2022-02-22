

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth
import Firebase
import GoogleSignIn


struct SignInScreenView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    @StateObject private var viewModel = SignInScreenViewModel()

    
    func authenticate(credential: ASAuthorizationAppleIDCredential) {
        // Getting Token...
        guard let token = credential.identityToken else {
            print("Error with Firebase")
            return
        }
        
        // Token String...
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("Error with Token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com",
                                                          idToken: tokenString,
                                                          rawNonce: viewModel.nonce)
        
        Auth.auth().signIn(with: firebaseCredential) { (result, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            // User succesfully logged into Firebase...
            print("Logged in Successful")
            
            // Directing user to Main page...
            self.userSignIn.wrappedValue = true
            viewModel.switchView = self.userSignIn.wrappedValue
        }
    }
    
    var body: some View {
        if viewModel.switchView {
            MainView()
        } else {
            VStack {
                Text("Sign in")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y: -70)
                
                VStack(spacing: 45) {
                    
                    // Apple Sign in
                    
                    SignInWithAppleButton { (request) in
                        
                        viewModel.nonce = viewModel.randomNonceString()
                        
                        request.requestedScopes = [.email, .fullName]
                        request.nonce = viewModel.sha256(viewModel.nonce)
                        
                    } onCompletion: { (result) in
                        
                        // getting error or success...
                        
                        switch result {
                        case .success(let user):
                            
                            
                            print("Signed in with Apple.")
                            
                            
                            // Do login with Firebase...
                            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                                print("error with firebase")
                                return
                            }
                            
                            authenticate(credential: credential)
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .frame(width: 300, height: 50)
                    
                    
                    // Google Sign in
                    Button {
                        handleSignin()
                    } label: {
                        HStack(spacing: 15) {
                            Image("google1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(.trailing)
                            
                            
                            Text("Sign in with Google")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 0.70)
                    )
                    
                    
                    // E-mail Sign in
                    NavigationLink (destination: SignInWithEmailView().environment(\.userSignIn, userSignIn)) {
                        HStack {
                            Spacer()
                            Image(systemName:"envelope").imageScale(.large)
                                .padding(.trailing)
                                .foregroundColor(.black)
                            
                            Text("Sign in with Email")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0.70)
                        )
                    }
                }
                
                // Terms Text...
                Text(viewModel.getAttributedString(string: "By continuing, you agree to the our Terms of Service"))
                // Need to add files for Terms of Service
                    .font(.body)
                    .foregroundColor(.gray)
                    .kerning(1.1)
                    .lineSpacing(8)
                    .multilineTextAlignment(.center)
                    .offset(y: 170)
                
            }
            .onAppear {
                viewModel.switchView = self.userSignIn.wrappedValue
            }
        }
    }
    
    
    // Handle Sign in for Google...
    func handleSignin() {
        
        // Google Sign in...
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) { [self] user, error in
            
            if let error = error {
                print(error.localizedDescription)
                
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            // Firebase Auth...
            
            Auth.auth().signIn(with: credential) { result, err in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                //Displaying User Name...
                guard let user = result?.user else {
                    return
                }
                
                
                print(user.displayName ?? "Success!")
                
                
                // Updating User as Logged in
                userSignIn.wrappedValue = true
                
                // Taking user to MainView
                viewModel.switchView = self.userSignIn.wrappedValue
                
            }
        }
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}


// Extending View to get screen bounds...
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Retreiving RootView Controller
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}


