//
//  HomeViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class HomeViewController: UIViewController, CustomNavigationControllerProtocol {
    var mainView: UIView? {
        return view
    }
    var viewController: UIViewController? {
        return self
    }

    var navigationDelegate: CustomNavigationControllerDelegate?
    
    private var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        prepareMenuButton()
    }

    private func prepareMenuButton() {
        menuButton = UIButton()
        menuButton.setImage(UIImage(named: "Menu Button Image"), for: .normal)
        menuButton.addTarget(self, action: #selector(pushMenuButton), for: .touchUpInside)
        view.addSubview(menuButton)

        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        menuButton.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -25
        ).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    @objc private func pushMenuButton() {
        navigationDelegate?.moveSideChildView()
    }
}
