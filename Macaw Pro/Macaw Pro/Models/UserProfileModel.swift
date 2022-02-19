

import SwiftUI
import FirebaseFirestoreSwift


struct User: Identifiable, Equatable, Codable {
    // User info
    @DocumentID var id: String?
    var firstName: String = ""
    var lastName: String = ""
    var birthdate: Date = Date()
    
    var genderOptions = ["Male", "Female", "Decline to answer"]
    var gender: String = ""
    var proType: String = ""
    var email: String = ""
    
    // Business info
    var bizName: String = ""
    var street: String = ""
    var apartmntOrUnitNum: String = ""
    var city: String = ""
    var state: String = ""
    
    var stateArray = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    
    var zipCode: String = ""
}


    
