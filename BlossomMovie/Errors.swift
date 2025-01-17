//
//  Errors.swift
//  BlossomMovie
//
//  Created by Carlos Valentin on 1/16/25.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    
   var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "APIConfig file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Data loading failed: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Decoding failed: \(error.localizedDescription)"
        }
    }
}
