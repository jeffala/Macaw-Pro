

import SwiftUI
import FirebaseFirestoreSwift


// Should this actually be a class adopting ObservableObject?

struct User: Identifiable, Equatable, Codable {
    // Profile
    @DocumentID var id: String?
    var firstName: String = ""
    var lastName: String = ""
    var gender: String = ""
    var genderOptions = ["Male", "Female", "Decline to answer"]
    var proType: String = ""
    var email: String = ""
    
    // Services
    var service1Name: String = ""
    var service1Price: Int = 0
}



    
