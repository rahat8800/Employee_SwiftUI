//
//  EmployeeDetails.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//
import SwiftUI

struct EmployeeDetailView: View {
    let employee: Employee

    var body: some View {
        ScrollView { // Use ScrollView for content that might overflow
            VStack(alignment: .leading, spacing: 20) {
                // Profile Image (with placeholder)
                AsyncImage(url: URL(string: employee.profile_image ?? "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200) // Larger image
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                    case .empty:
                        if employee.profile_image == nil || employee.profile_image == "" {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.gray)
                        } else {
                            ProgressView()
                                .frame(width: 200, height: 200)
                        }
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(maxWidth: .infinity) // Center the image

                // Employee Details
                Text(employee.employee_name)
                    .font(.title)
                    .bold()

                Text("ID: \(employee.id)")
                    .font(.headline)

                Text("Age: \(employee.employee_age)") // Or Int(employee.employee_age) ?? "N/A" if it's a String
                    .font(.headline)

                Text("Salary: \(employee.employee_salary)") // Format as currency if needed
                    .font(.headline)

                // Add other details as needed...
            }
            .padding() // Add padding around the VStack
            .frame(maxWidth: .infinity, alignment: .leading) // Align content to the left
        }
        .navigationTitle(employee.employee_name) // Set navigation title
    }
}
