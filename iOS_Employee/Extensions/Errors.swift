//
//  Errors.swift
//  iOS_Employee
//
//  Created by Rahat on 31/01/25.
//
import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Decoding Error"
        }
    }
}

