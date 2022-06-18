import SwiftUI

struct MainView: View {

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
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
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
