//
//  NetworkServiceProtocol.swift
//  MVPProject
//
//  Created by Софія Ярошович on 12.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    // Function is called on the main thread
    func fetchRate(completion: @escaping (Result<ExchangeRate, NetworkError>) -> Void)
}
