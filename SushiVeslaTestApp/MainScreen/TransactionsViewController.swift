//
//  TransactionsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class TransactionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Transactions"
    }
}

extension TransactionsViewController: Identifiable {
    typealias ID = Int

    var id: Int {
        return 3
    }
}
