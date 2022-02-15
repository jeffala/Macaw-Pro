
//  EditAccountInfoView.swift


import SwiftUI
import Firebase
import FirebaseFirestore

struct EditAccountInfoView: View {
    @State var user = User()
    
    private var db = Firestore.firestore()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $user.firstName)
                    TextField("Last Name", text: $user.lastName)
                    DatePicker("Birthdate", selection: $user.birthdate, displayedComponents: .date)
                    Picker("Sex",
                           selection: $user.gender) {
                        ForEach(User.GenderOptions.allCases, id: \.self) { sex in
                            Text(sex.rawValue)
                        }
                    }
                           .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Type of Professional", text: $user.proType)
                    TextField("Email", text: $user.email)
                        .autocapitalization(.none)
                } header: {
                    Text("user information")
                }
                
                Section {
                    TextField("Business Name", text: $user.bizName)
                    TextField("Street", text: $user.street)
                    TextField("Apartment or Unit #", text: $user.apartmntOrUnitNum)
                    TextField("City", text: $user.city)
                    TextField("Zip Code", text: $user.zipCode)
                } header: {
                    Text("Business Info")
                }
            }
            .navigationTitle("Edit Account Info")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save") {
                        // Calling function to add user input data
                        saveUserData()
                    }
                }
            }
        }
    }
    
    
    func saveUserData() {
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



struct EditAccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountInfoView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif



