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
