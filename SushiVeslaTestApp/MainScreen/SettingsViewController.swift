//
//  SettingsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    var presentationDelegate: PresentationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Settings"
    }
}

extension SettingsViewController: PresentationControllerProtocol {
    var viewController: UIViewController? { self }
    var mainView: UIView? { view }
    
    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate) {
        self.presentationDelegate = presentationDelegate
    }
}
