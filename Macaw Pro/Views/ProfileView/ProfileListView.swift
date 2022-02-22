
import SwiftUI


struct ProfileListView: View {
    
    let user: User = User(id: "000", firstName: "Jeff", lastName: "Licona", birthdate: Date("1994-08-19"), gender: "Male", proType: "Hair Stylist", email: "jeffalalg94@gmail.com", bizName: "Licona's Touch", street: "22325 SW 66th Ave", apartmntOrUnitNum: "2405", city: "Boca Raton", zipCode: "33428")
    
    
    var body: some View {
        NavigationView {
            List(0 ..< 1) { item in
                HStack {
                    Text("Name")
                        .font(.headline)
                    Text("\(user.firstName + user.lastName)")
                }
                
                HStack {
                    Text("Profession")
                        .font(.headline)
                    Text("\(user.proType)")
                }
                
                HStack {
                    Text("Name of Businees")
                        .font(.headline)
                    Text("\(user.bizName)")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
    }
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
