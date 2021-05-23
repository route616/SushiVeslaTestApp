//
//  AccountsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class AccountsViewController: UIViewController {
    private var presentationDelegate: PresentationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Accounts"
    }
}

extension AccountsViewController: PresentationControllerProtocol {
    var viewController: UIViewController? { self }
    var mainView: UIView? { view }
    
    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate) {
        self.presentationDelegate = presentationDelegate
    }
}
