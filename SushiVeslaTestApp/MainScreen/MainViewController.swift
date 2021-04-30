//
//  MainViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 27.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    private let viewControllers: [String: UIViewController] = [
        "Home": HomeViewController(),
        "Profile": ProfileViewController(),
        "Accounts": AccountsViewController(),
        "Transactions": TransactionsViewController(),
        "Stats": StatsViewController(),
        "Settings": SettingsViewController(),
        "Help": HelpViewController()
    ]

    private let resizeRatio: CGFloat = 0.678
    private let modRotationAngle: CGFloat = 15.0 * CGFloat.pi / 180.0
    private let offsetRatio: CGFloat = 167.09 / 375

    // MARK: UI elements
    // Top left profile view
    private var profileImageView: UIView!
    private var profileNameLabel: UILabel!
    private var profileCityLabel: UILabel!
    private var profileView: UIView!

    // Menu
    private var menuTableView: UITableView!
    private var logoutButton: UIButton!
    private var versionLabel: UILabel!

    private var leftSideStackView: UIStackView!

    // Child ViewController
    private var childControllerView: UIView!
    private var currentChildViewController: UIViewController!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Secondary Background")

        menuTableView = UITableView()
        menuTableView.frame = CGRect(
            x: view.frame.origin.x,
            y: view.frame.origin.y,
            width: view.frame.width / 3,
            height: view.frame.height
        )
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Menu Cell")
        menuTableView.rowHeight = 40
        menuTableView.backgroundColor = .clear
        menuTableView.separatorColor = .clear
        view.addSubview(menuTableView)

        currentChildViewController = viewControllers[0].value

        childControllerView = UIView(frame: view.frame)
        if let statsVC = viewControllers["Stats"] as? StatsViewController {
            putToChildView(viewController: statsVC)
            statsVC.delegate = self
        }
        view.addSubview(childControllerView)
    }

    // MARK: Prepare UI elements
    private func prepareProfileView() {
        profileImageView = UIImageView(image: UIImage(named: "Profile Image"))
        profileImageView.contentMode = .scaleToFill

        profileNameLabel = UILabel()
        profileNameLabel.font = UIFont(name: "AvenirNext-Demibold", size: 16)
        profileNameLabel.textColor = UIColor(named: "Main Text")
        profileNameLabel.textAlignment = .left
        profileNameLabel.text = "Carol Black"

        profileCityLabel = UILabel()
        profileCityLabel.font = UIFont(name: "AvenirNext", size: 10)
        profileCityLabel.textColor = UIColor(named: "Quarternary Text")
        profileCityLabel.textAlignment = .left
        profileCityLabel.text = "Seattle, Washington"

        let nameAndCityStackView = UIStackView(
            arrangedSubviews: [profileNameLabel, profileCityLabel]
        )
        nameAndCityStackView.axis = .vertical
        nameAndCityStackView.distribution = .fillProportionally
        nameAndCityStackView.alignment = .fill

        let profileGeneralStackView = UIStackView(
            arrangedSubviews: [profileImageView, nameAndCityStackView]
        )
        profileGeneralStackView.axis = .horizontal
        profileGeneralStackView.distribution = .fillProportionally
        profileGeneralStackView.alignment = .fill

        profileView = UIView()
        profileView.backgroundColor = UIColor(named: "Main Background")
        profileView.layer.cornerRadius = 50
        profileView.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner
        ]
        profileView.addSubview(profileGeneralStackView)
    }

    private func prepareMenu() {
        menuTableView = UITableView()
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Menu Cell")
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

    private func putToChildView(viewController: UIViewController) {
        addChild(viewController)
        childControllerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    private func removeFromChildView(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeFromChildView(viewController: currentChildViewController)
        currentChildViewController = viewControllers[indexPath.row].value
        putToChildView(viewController: currentChildViewController)
        UIView.animate(withDuration: 0.2) {
            self.childControllerView.transform = .identity
            self.childControllerView.layer.cornerRadius = 0
            self.childControllerView.layer.masksToBounds = true
        }
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Menu Cell", for: indexPath
        ) as! MenuTableViewCell
        cell.textLabel?.text = viewControllers[indexPath.row].key
        if indexPath.row == 0 {
            cell.setSelected(true, animated: true)
        }
        return cell
    }
}

// MARK: - MenuDelegate
extension MainViewController: MenuDelegate {
    func willMoveToSide() {
        UIView.animate(withDuration: 0.2) {
            self.childControllerView.transform = self.childControllerView.transform
                .translatedBy(x: self.view.frame.width * self.offsetRatio, y: 0)
            self.childControllerView.transform = self.childControllerView.transform
                .rotated(by: -self.modRotationAngle)
            self.childControllerView.transform = self.childControllerView.transform
                .scaledBy(x: self.resizeRatio, y: self.resizeRatio)
            self.childControllerView.layer.cornerRadius = 30
            self.childControllerView.layer.masksToBounds = true
        }
    }
}
