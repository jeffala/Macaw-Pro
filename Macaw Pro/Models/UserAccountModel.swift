

import SwiftUI
import FirebaseFirestoreSwift


struct User: Identifiable, Equatable, Codable {
    @DocumentID var id: String?
    var firstName: String = ""
    var lastName: String = ""
    var gender: String = ""
    var genderOptions = ["Male", "Female", "Decline to answer"]
    var proType: String = ""
    var email: String = ""
}

struct Services: Equatable, Codable {
    var service1Name: String = ""
    var service1Price: Double = 0.0
    
    var service2Name: String = ""
    var service2Price: Double = 0.0
    
    var service3Name: String = ""
    var service3Price: Double = 0.0
    
    var service4Name: String = ""
    var service4Price: Double = 0.0
    
    var service5Name: String = ""
    var service5Price: Double = 0.0
    
    var service6Name: String = ""
    var service6Price: Double = 0.0
    
    var service7Name: String = ""
    var service7Price: Double = 0.0
    
    var service8Name: String = ""
    var service8Price: Double = 0.0
    
    var service9Name: String = ""
    var service9Price: Double = 0.0
    
    var service10Name: String = ""
    var service10Price: Double = 0.0
    
}



    
