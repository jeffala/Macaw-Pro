
import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase



class SignInScreenViewModel: ObservableObject {
    @Published var nonce = ""
    @Published var switchView = false
    
     
    // MARK: Sign in with Apple
    // Helpers for Apple Login with Firebase...
    
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
    // Attributted String..
    func getAttributedString(string: String) -> AttributedString {
        
        var attributedString = AttributedString(string)
        
        // Applying Black color and Bold to only Terms of Service text...
        if let range = attributedString.range(of: "Terms of Service") {
            attributedString[range].foregroundColor = .black
            //            attributedString[range].font = .body.bold()
        }
        return attributedString
    }
}


// MARK: Environment Value For Login

struct LoginValueKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = Binding.constant(false)
}

extension EnvironmentValues {
    var userSignIn: Binding<Bool> {
        get { self[LoginValueKey.self] }
        set { self[LoginValueKey.self] = newValue }
    }
}

