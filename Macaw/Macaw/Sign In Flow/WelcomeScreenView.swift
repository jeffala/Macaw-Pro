//
//  WelcomeScreenView.swift
//  Macaw
//
//  Created by Jeff Licona on 12/11/21.
//

import SwiftUI

struct WelcomeScreenView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.white.ignoresSafeArea(.all)
                    VStack {
                        Image("test-log")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                            .padding()
                        Text("Welcome to Macaw")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color.black).opacity(0.7)
                        
                        Spacer().frame(height: 150)
                        
                        NavigationLink(destination: SignInScreenView().environment(\.userSignIn, userSignIn)) {
                            PrimaryButton(title: "Get Started")
                                .padding(.bottom)
                                .padding(.bottom)
                                .padding(.bottom)
                                .padding(.bottom)
                                .padding()
                        }
                        
                        VStack {
                            Text("Need to manage business appointments? Use Macaw Pro")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}


struct PrimaryButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(Color.red)
            .cornerRadius(15.0)
    }
}

