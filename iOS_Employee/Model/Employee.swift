//
//  Employee.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//

struct EmployeeResponse: Decodable {
    let status: String
    let data: [Employee] // Array of Employee objects
    let message: String
}

struct Employee: Identifiable, Hashable, Decodable {
    let id: Int
    let employee_name: String // Match the API key exactly
    let employee_salary: Int // Match the type (Int)
    let employee_age: Int // Match the type (Int)
    let profile_image: String? // Make it optional

    enum CodingKeys: String, CodingKey { // For property name mapping
        case id
        case employee_name
        case employee_salary
        case employee_age
        case profile_image
    }
}
