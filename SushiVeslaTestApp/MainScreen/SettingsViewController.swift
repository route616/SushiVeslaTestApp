//
//  SettingsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Settings"
    }
}

extension SettingsViewController: Identifiable {
    typealias ID = Int

    var id: Int {
        return 5
    }
}
