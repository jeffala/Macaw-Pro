import SwiftUI

struct ProfileImageView: View {
    @State private var isShowingPhotoPicker = false
    
    // This is the image that goes to the server.
    @State private var profileImage = UIImage(named: "default-avatar")!

    var body: some View {
            Image(uiImage: profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .onTapGesture { isShowingPhotoPicker = true }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(profileImage: $profileImage)
        }
    }
}
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
