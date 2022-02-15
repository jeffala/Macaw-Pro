//
//  ContentView.swift
//  Macaw Pro
//
//  Created by Jeff Licona on 11/21/21.
//

import SwiftUI


struct MainView: View {
    
    var body: some View {
        ZStack {
            TabView {
                BrowseView()
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Browse")
                    }
                
                BookView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Book")
                    }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
