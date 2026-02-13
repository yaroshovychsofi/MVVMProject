//
//  SceneDelegate.swift
//  MVVMProject
//
//  Created by Софія Ярошович on 13.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let networkService = NetworkService()
        let rateViewModel = RateViewModel(service: networkService)
        let viewController = RateViewController(viewModel: rateViewModel)
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        self.window = window
    }
}
