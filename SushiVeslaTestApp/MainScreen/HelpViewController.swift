//
//  HelpViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class HelpViewController: UIViewController {
    var presentationDelegate: PresentationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Help"
    }
}

extension HelpViewController: PresentationControllerProtocol {
    var viewController: UIViewController? { self }
    var mainView: UIView? { view }
    
    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate) {
        self.presentationDelegate = presentationDelegate
    }
}
