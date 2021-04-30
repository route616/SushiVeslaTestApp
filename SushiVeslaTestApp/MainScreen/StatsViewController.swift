//
//  StatsViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class StatsViewController: UIViewController {
    var delegate: MenuDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal

        
    }

    @objc private func backToMainMenu(_ sender: UIButton) {
        delegate?.willMoveToSide()
    }
}

extension StatsViewController: Identifiable {
    typealias ID = Int

    var id: Int {
        return 4
    }
}
