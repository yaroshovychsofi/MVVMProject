//
//  NetworkService.swift
//  MvcProject
//
//  Created by Софія Ярошович on 11.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    func fetchRate(completion: @escaping (Result<ExchangeRate, any Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let success = Bool.random()
            if success {
                let rate = ExchangeRate(fromCurrency: "USD",
                                        toCurrency: "UAH",
                                        rate: Double.random(in: 40.0...45.0))
                DispatchQueue.main.async {
                    completion(.success(rate))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.serverError))
                }
            }
        }
    }
}
