
//  EditProfileView.swift


import SwiftUI


struct EditProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    DatePicker("Birthdate", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    TextField("Profession", text: $viewModel.user.proType)
                    TextField("Email", text: $viewModel.user.email)
                        .autocapitalization(.none)
                    Picker("Gender", selection: $viewModel.user.gender) {
                        ForEach(viewModel.user.genderOptions, id: \.self) { value in
                            Text(value)
                        }
                    }
                } header: {
                    Text("Your information")
                }
                Section {
                    TextField("Business Name", text: $viewModel.user.bizName)
                    TextField("Street", text: $viewModel.user.street)
                    TextField("Apartment or Unit #", text: $viewModel.user.apartmntOrUnitNum)
                    TextField("City", text: $viewModel.user.city)
                    Picker("State", selection: $viewModel.user.state) {
                        ForEach(viewModel.user.stateArray, id: \.self) { value in
                            Text(value)
                        }
                    }
                    
                    TextField("Zip Code", text: $viewModel.user.zipCode)
                } header: {
                    Text("business information")
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save") {
                        // Calling function to store user input data
                        viewModel.saveData()
                    }
                }
            }
        }
    }
}



struct EditProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif



