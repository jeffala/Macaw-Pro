//
//  SigninViewModel.swift
//  Macaw
//
//  Created by Jeff Licona on 12/22/21.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth


// MARK: Custom Environment Value

struct LoginValueKey: EnvironmentKey {
    static var defaultValue: Binding<Bool> = Binding.constant(false)
}

extension EnvironmentValues {
    var userSignIn: Binding<Bool> {
        get { self[LoginValueKey.self] }
        set { self[LoginValueKey.self] = newValue }
    }
}

// MARK: Sign in with Apple

// helper for Apple Login with Firebase

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

