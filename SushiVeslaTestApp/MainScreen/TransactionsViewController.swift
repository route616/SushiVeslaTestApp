//
//  TransactionsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class TransactionsViewController: UIViewController {
    var presentationDelegate: PresentationControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Transactions"
    }
}

extension TransactionsViewController: PresentationControllerProtocol {
    var viewController: UIViewController? { self }
    var mainView: UIView? { view }
    
    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate) {
        self.presentationDelegate = presentationDelegate
    }
}
