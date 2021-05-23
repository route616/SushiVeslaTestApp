//
//  ProfileViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    private var presentationDelegate: PresentationControllerDelegate?

    private var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main Background")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        presentationDelegate?.moveSideChildView()
    }
}

extension ProfileViewController: PresentationControllerProtocol {
    var viewController: UIViewController? { self }
    var mainView: UIView? { view }
    
    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate) {
        self.presentationDelegate = presentationDelegate
    }
}
