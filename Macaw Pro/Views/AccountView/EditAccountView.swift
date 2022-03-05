

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
                
                Section("Services") {
                    TextField("Name of Service", text: $viewModel.services.service1Name)
                    TextField("Price of Service", value: $viewModel.services.service1Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service2Name)
                    TextField("Price of Service", value: $viewModel.services.service2Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service3Name)
                    TextField("Price of Service", value: $viewModel.services.service3Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service4Name)
                    TextField("Price of Service", value: $viewModel.services.service4Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service5Name)
                    TextField("Price of Service", value: $viewModel.services.service5Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                // Due to 10 textfield limit per Section = new Section
                Section("More Services") {
                    TextField("Name of Service", text: $viewModel.services.service6Name)
                    TextField("Price of Service", value: $viewModel.services.service6Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service7Name)
                    TextField("Price of Service", value: $viewModel.services.service7Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service8Name)
                    TextField("Price of Service", value: $viewModel.services.service8Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service9Name)
                    TextField("Price of Service", value: $viewModel.services.service9Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    TextField("Name of Service", text: $viewModel.services.service10Name)
                    TextField("Price of Service", value: $viewModel.services.service10Price, format: .currency(code: Locale.current.currencyCode ?? "USD"))
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




