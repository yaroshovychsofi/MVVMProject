//
//  NetworkError.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case serverError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serverError:
            return "Please try again in a moment."
        }
    }
}
