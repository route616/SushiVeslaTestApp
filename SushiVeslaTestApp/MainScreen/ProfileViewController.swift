//
//  ProfileViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Profile"
    }
}

extension ProfileViewController: Identifiable {
    typealias ID = Int

    var id: ID {
        return 1
    }
}
