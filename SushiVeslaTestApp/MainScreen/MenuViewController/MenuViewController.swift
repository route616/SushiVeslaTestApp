//
//  MainViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 27.04.2021.
//

import UIKit

class MenuViewController: UIViewController, CustomNavigationControllerProtocol {
    var mainView: UIView? { return view }
    var viewController: UIViewController? { return self }
    
    var navigationDelegate: CustomNavigationControllerDelegate?
    
    // Menu Items
    private let viewControllers: [(String, CustomNavigationControllerProtocol)] = [
        ("Home", HomeViewController()),
        ("Profile", ProfileViewController()),
        ("Accounts", AccountsViewController()),
        ("Transactions", TransactionsViewController()),
        ("Stats", StatsViewController()),
        ("Settings", SettingsViewController()),
        ("Help", HelpViewController())
    ]

    private let stackViewWidthRatio: CGFloat = 210 / 375
    private let profileViewHeightRatio: CGFloat = 107 / 812

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

    // Close button
    private var closeButton: UIButton!

    // Safe area
    private var safeArea: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Secondary Background")
        drawView()
    }

    // MARK: Prepare and draw UI elements
    private func prepareProfileView() {
        profileImageView = UIImageView(image: UIImage(named: "Profile Image"))
        profileImageView.contentMode = .scaleAspectFit

        profileNameLabel = UILabel()
        profileNameLabel.font = UIFont(name: "AvenirNext-Demibold", size: 16)
        profileNameLabel.textColor = UIColor(named: "Main Text")
        profileNameLabel.textAlignment = .left
        profileNameLabel.text = "Carol Black"

        profileCityLabel = UILabel()
        profileCityLabel.font = UIFont(name: "AvenirNext-Medium", size: 10)
        profileCityLabel.textColor = UIColor(named: "Tertiary Text")
        profileCityLabel.textAlignment = .left
        profileCityLabel.text = "Seattle, Washington"

        let nameAndCityStackView = UIStackView(
            arrangedSubviews: [profileNameLabel, profileCityLabel]
        )
        nameAndCityStackView.axis = .vertical
        nameAndCityStackView.distribution = .equalCentering
        nameAndCityStackView.alignment = .fill

        let profileGeneralStackView = UIStackView(
            arrangedSubviews: [profileImageView, nameAndCityStackView]
        )
        profileGeneralStackView.axis = .horizontal
        profileGeneralStackView.distribution = .fillProportionally
        profileGeneralStackView.alignment = .center

        profileView = UIView()
        profileView.backgroundColor = UIColor(named: "Main Background")
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.widthAnchor.constraint(
            equalToConstant: view.frame.width * stackViewWidthRatio
        ).isActive = true
        profileView.heightAnchor.constraint(
            equalToConstant: view.frame.height * profileViewHeightRatio
        ).isActive = true
        profileView.layer.cornerRadius = 50
        profileView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        profileView.addSubview(profileGeneralStackView)

        profileGeneralStackView.translatesAutoresizingMaskIntoConstraints = false
        profileGeneralStackView.leadingAnchor.constraint(
            equalTo: profileView.leadingAnchor
        ).isActive = true
        profileGeneralStackView.topAnchor.constraint(
            equalTo: profileView.topAnchor
        ).isActive = true
        profileGeneralStackView.trailingAnchor.constraint(
            equalTo: profileView.trailingAnchor
        ).isActive = true
        profileGeneralStackView.bottomAnchor.constraint(
            equalTo: profileView.bottomAnchor
        ).isActive = true
        profileGeneralStackView.isLayoutMarginsRelativeArrangement = true
        profileGeneralStackView.layoutMargins = UIEdgeInsets(
            top: 10, left: 10, bottom: 10, right: 10
        )
    }

    private func prepareMenu() {
        menuTableView = UITableView()
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Menu Cell")
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.rowHeight = 50
        menuTableView.separatorStyle = .none
        menuTableView.backgroundColor = .clear
        let indexPath = IndexPath(row: 0, section: 0)
        menuTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)

        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.widthAnchor.constraint(
            equalToConstant: view.frame.width * stackViewWidthRatio
        ).isActive = true
        menuTableView.heightAnchor.constraint(
            equalToConstant: CGFloat(viewControllers.count * 50)
        ).isActive = true
    }

    private func prepareLogoutButton() {
        logoutButton = UIButton()
        logoutButton.backgroundColor = .clear
        logoutButton.setTitle("\u{23FB} Logout", for: .normal)
        logoutButton.setTitleColor(UIColor(named: "Main Text"), for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 16)        
        logoutButton.contentHorizontalAlignment = .left
        logoutButton.frame.size = CGSize(width: 210, height: 50)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.widthAnchor.constraint(
            equalToConstant: view.frame.width * stackViewWidthRatio - 24
        ).isActive = true
    }

    private func prepareVersionLabel() {
        versionLabel = UILabel()
        versionLabel.font = UIFont(name: "AvenirNext-Medium", size: 10)
        versionLabel.textColor = UIColor(named: "Secondary Text")
        versionLabel.textAlignment = .left
        versionLabel.text = AppDelegate.version
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.widthAnchor.constraint(
            equalToConstant: view.frame.width * stackViewWidthRatio - 24
        ).isActive = true
    }

    private func prepareCloseButton() {
        closeButton = UIButton()
        closeButton.setTitle("×", for: .normal)
        closeButton.setTitleColor(UIColor(named: "Main Text"), for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        closeButton.addTarget(self, action: #selector(pushCloseButton), for: .touchUpInside)
        view.addSubview(closeButton)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: profileNameLabel.bottomAnchor).isActive = true
        closeButton.trailingAnchor.constraint(
            equalTo: view.trailingAnchor, constant: -24
        ).isActive = true
    }

    private func drawView() {
        prepareProfileView()
        prepareMenu()
        prepareLogoutButton()
        prepareVersionLabel()

        let stackView = UIStackView(
            arrangedSubviews: [profileView, menuTableView, logoutButton, versionLabel]
        )
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .trailing
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(
            equalTo: view.widthAnchor, multiplier: stackViewWidthRatio
        ).isActive = true

        prepareCloseButton()
    }

    @objc private func pushCloseButton() {
        navigationDelegate?.backUpChildView()
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationDelegate?.present(
            viewController: viewControllers[indexPath.row].1
        )
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }

    func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Menu Cell", for: indexPath
        ) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        cell.screenNameLabel.text = viewControllers[indexPath.row].0
        return cell
    }
}
