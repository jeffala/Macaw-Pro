

import SwiftUI


struct StatsView: View {
    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>
    
    var body: some View {
        
        Text("Stats View")

    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}

