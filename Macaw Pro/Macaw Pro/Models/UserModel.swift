

import SwiftUI
import FirebaseFirestoreSwift


struct User: Identifiable, Codable {
    
    // User info
    @DocumentID var id: String?
    var firstName: String = ""
    var lastName: String = ""
    var birthdate: Date = Date()
    
    var gender: String = (GenderOptions(rawValue: "") ?? GenderOptions.female).rawValue
    
    enum GenderOptions: String, CaseIterable {
        case male = "Male"
        case female = "Female"
        case preferNot = "Prefer not say"
    }
    
    var proType: String = ""
    var email: String = ""
    
    // Business info
    var bizName: String = ""
    var street: String = ""
    var city: String = ""
    var apartmntOrUnitNum: String = ""
    var zipCode: String = ""
    

}
