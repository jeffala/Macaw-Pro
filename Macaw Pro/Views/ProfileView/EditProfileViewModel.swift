//
//  EditProfileViewModel.swift
//  Macaw Pro
//
//  Created by Jeff Licona on 2/17/22.
//

import Foundation
import Firebase
import FirebaseFirestore


class EditProfileViewModel: ObservableObject {
    @Published var user = User()
    private var db = Firestore.firestore()
    
    func saveData() {
        db.collection("Users").document().setData([
            "First Name": user.firstName,
            "Last Name": user.lastName,
            "Birth Date": user.birthdate,
            "Gender": user.gender,
            "Profession": user.proType,
            "Email": user.email,
            "Place of Business": [
                "Business Name": user.bizName,
                "Address": [
                    "Street": user.street,
                    "Apt or Unit #": user.apartmntOrUnitNum,
                    "City": user.city,
                    "State": user.state,
                    "Zip Code": user.zipCode
                ]
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
