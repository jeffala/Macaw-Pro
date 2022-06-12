//
//  ProfilePhotoView.swift
//  Macaw Pro
//
//  Created by Jeff Licona on 6/12/22.
//

import SwiftUI

struct ProfilePhotoView: View {
    @State private var isShowingPhotoPicker = false
    
    var body: some View {
        Image(uiImage: UIImage(named: "default-avatar")!)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .padding()
            .onTapGesture { isShowingPhotoPicker = true }
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                PhotoPicker()                
            })
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView()
    }
}
