//
//  HelpViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class HelpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Help"
    }
}

extension HelpViewController: Identifiable {
    typealias ID = Int

    var id: Int {
        return 6
    }
}
