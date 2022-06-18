import SwiftUI

struct AccountImageView: View {
    @State private var isShowingPhotoPicker = false
    
    // This is the image that goes to the server.
    @State private var profileImage = UIImage(named: "default-avatar")!

    var body: some View {
            Image(uiImage: profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .onTapGesture { isShowingPhotoPicker = true }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPicker(profileImage: $profileImage)
        }
    }
}
struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountImageView()
    }
}
