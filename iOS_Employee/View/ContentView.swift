import SwiftUI
import Combine


struct EmployeeRow: View {
    let employee: Employee
    
    var body: some View {
        HStack {
            // Profile Image
            if let imageUrlString = employee.profile_image, let imageUrl = URL(
                string: imageUrlString
            ) {
                AsyncImage(url: imageUrl) { phase in
                    // ... (success, failure, empty handling as before)
                }
            } else {
                Image(systemName: "person.crop.circle.fill") // Default image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(employee.employee_name).font(.headline)
                Text("Age: \(employee.employee_age)").font(.subheadline)
                // ... other employee details
            }
        }
    }
}

