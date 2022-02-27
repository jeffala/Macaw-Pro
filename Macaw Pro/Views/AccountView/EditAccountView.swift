
//  EditAccountView.swift


import SwiftUI


struct EditAccountView: View {
    @StateObject private var viewModel = EditAccountViewModel()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section("Profile") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    Picker("Gender", selection: $viewModel.user.gender) {
                        ForEach(viewModel.user.genderOptions, id: \.self) { value in
                            Text(value)
                        }
                    }
                    TextField("Email", text: $viewModel.user.email)
                    TextField("Profession", text: $viewModel.user.proType)
                        .autocapitalization(.none)
                }
                
                Section("Service 1") {
                        TextField("Service Name", text: $viewModel.user.service1Name)
                        TextField("Price", value: $viewModel.user.service1Price, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    Button("Done", action: {
                        hideKeyboard()
                    })
                })
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    Button("Save", action: {
                        viewModel.saveData()
                    })
                })
            }
            .navigationTitle("Edit Account")
        }
    }
}


struct EditProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountView()
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif



