//
//  AccountsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class AccountsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Accounts"
    }
}

extension AccountsViewController: Identifiable {
    typealias ID = Int

    var id: Int {
        return 2
    }
}
