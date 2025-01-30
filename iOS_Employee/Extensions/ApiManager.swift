//
//  ApiManager.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//
import SwiftUI
import Combine
import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}

    func fetchEmployees() -> AnyPublisher<[Employee], Error> {
        guard let url = URL(string: APIConstants.baseURL) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher() // ✅ Fix: Use Fail instead of Empty
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: EmployeeResponse.self, decoder: JSONDecoder())
            .map(\.data)
            .eraseToAnyPublisher()
    }
}

