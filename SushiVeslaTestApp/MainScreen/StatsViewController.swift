//
//  StatsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class StatsViewController: UIViewController, CustomNavigationControllerProtocol {
    var mainView: UIView? { return view }    
    var viewController: UIViewController? { return self }

    var navigationDelegate: CustomNavigationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }

    @objc private func backToMainMenu(_ sender: UIButton) {
        
    }
}
