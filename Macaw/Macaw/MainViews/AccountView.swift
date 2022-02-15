//
//  AccountView.swift
//  Macaw
//
//  Created by Jeff Licona on 12/4/21.
//

import SwiftUI
import Firebase
import GoogleSignIn


struct AccountView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>

    
    var body: some View {
        
        Text("Need to work on CRUD with firebase.")

    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
