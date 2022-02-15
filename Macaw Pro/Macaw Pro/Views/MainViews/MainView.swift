
import SwiftUI

struct MainView: View {
//    @Environment(\.userSignIn) private var userSignIn: Binding<Bool>


    var body: some View {
        ZStack {
            TabView {
                AppointmentsView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Appointments")
                    }
                
                StatsView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Stats")
                    }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("More")
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
