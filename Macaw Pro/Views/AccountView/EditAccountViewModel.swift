//
//  EditProfileViewModel.swift
//  Macaw Pro
//
//  Created by Jeff Licona on 2/17/22.
//

import Foundation
import Firebase
import FirebaseFirestore


class EditAccountViewModel: ObservableObject {
    @Published var user = User()
    private var db = Firestore.firestore()
    
    func saveData() {
        db.collection("Users").document().setData([
            "First Name": user.firstName,
            "Last Name": user.lastName,
            "Gender": user.gender,
            "Profession": user.proType,
            "Email": user.email,
            "Services": [
                user.service1Name : user.service1Price
            ]
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document sucessfully written!")
            }
        }
    }
}
