import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var profileImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    // No need to update for my use case.
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.50), let compressedImage = UIImage(data: data) else {
                    // Show error or alert
                    return
                }
                photoPicker.profileImage = compressedImage
            } else {
                // return an error show alert.
                print("Make sure to select a photo.\(Error.self)")
            }
            picker.dismiss(animated: true)
        }
    }
}
