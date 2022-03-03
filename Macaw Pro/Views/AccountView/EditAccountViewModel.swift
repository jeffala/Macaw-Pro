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
    @Published var services = Services()
    
    private var db = Firestore.firestore()
    
    func saveData() {
        db.collection("Users").document().setData([
            "First Name": user.firstName,
            "Last Name": user.lastName,
            "Gender": user.gender,
            "Profession": user.proType,
            "Email": user.email,
            "Services": [
                "service1Name:" : services.service1Name,
                "service1Price" : services.service1Price,
                
                "service2Name" : services.service2Name,
                "service2Price" : services.service2Price,
                
                "service3Name" : services.service3Name,
                "service3Price" : services.service3Price,
                
                "service4Name" : services.service4Name,
                "service4Price" : services.service4Price,
                
                "service5Name" : services.service5Name,
                "service5Price" : services.service5Price,
                
                "service6Name" : services.service6Name,
                "service6Price" : services.service6Price,
                
                "service7Name" : services.service7Name,
                "service7Price" : services.service7Price,
                
                "service8Name" : services.service8Name,
                "service8Price" : services.service8Price,
                
                "service9Name" : services.service9Name,
                "service9Price" : services.service9Price,
                
                "service10Name" : services.service10Name,
                "service10Price" : services.service10Price
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
