//
//  Photopicker.swift
//  Macaw Pro
//
//  Created by Jeff Licona on 6/12/22.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
}


// Curently @ 07:00
