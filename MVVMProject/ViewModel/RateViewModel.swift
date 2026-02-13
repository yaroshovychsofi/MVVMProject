//
//  RateViewModel.swift
//  MVVMProject
//
//  Created by Софія Ярошович on 13.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import Foundation

class RateViewModel {
    var onUpdate: ((String) -> Void)?
    var onLoading: ((Bool) -> Void)?
    var onError: ((String) -> Void)?
    
    private let service: NetworkServiceProtocol

    init(service: NetworkServiceProtocol) {
        self.service = service
    }

    func fetchRate() {
        onLoading?(true)
        service.fetchRate { [weak self] result in
            DispatchQueue.main.async {
                self?.onLoading?(false)
                switch result {
                case .success(let rate):
                    let formattedRate = String(format: "%.2f", rate.rate)
                    self?.onUpdate?("\(rate.fromCurrency) → \(rate.toCurrency) = \(formattedRate)")
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
