//
//  EmployeeList.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//
import SwiftUI

struct EmployeeListView: View {
    @StateObject var viewModel = EmployeeListViewModel()

    var body: some View {
        NavigationStack {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    ForEach(viewModel.employees) { employee in
                        NavigationLink(value: employee) {
                            EmployeeRow(employee: employee)
                        }
                    }
                }
            }
            .navigationTitle("Employees")
            .navigationDestination(for: Employee.self) { employee in
                EmployeeDetailView(employee: employee)
            }
        }
    }
}
