//
//  EmployeeListViewModel.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//
import Combine
import SwiftUI

class EmployeeListViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchEmployees()
    }

    func fetchEmployees() {
        isLoading = true
        errorMessage = nil

        APIManager.shared.fetchEmployees() // Use the APIManager
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("API Error: \(error)") // Debugging
                case .finished:
                    break
                }
            }, receiveValue: { employees in
                self.employees = employees
            })
            .store(in: &cancellables)
    }
}
