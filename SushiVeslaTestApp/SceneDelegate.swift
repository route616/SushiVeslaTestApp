//
//  SceneDelegate.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 16.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = PresentationController(
            rootViewController: MenuViewController(), startViewController: HomeViewController()
        )
        window?.makeKeyAndVisible()
    }
}

