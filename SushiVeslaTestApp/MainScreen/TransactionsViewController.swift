//
//  TransactionsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class TransactionsViewController: UIViewController, CustomNavigationControllerProtocol {
    var mainView: UIView? { return view }    
    var viewController: UIViewController? { return self }
    
    var navigationDelegate: CustomNavigationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Transactions"
    }
}
