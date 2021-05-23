//
//  SignInViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 16.04.2021.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - UI Elements
    // Side Logo
    private var sideLogoImageView: UIImageView!

    // Main View
    private var mainStackView: UIStackView!

    // Top stack
    private var currentTimeLabel: UILabel!
    private var currentDateLabel: UILabel!
    private var currentWeatherLabel: UILabel!
    private var currentWeatherIconImageView: UIImageView!

    private var timeAndWeatherStackView: UIStackView!
    private var topStackView: UIStackView!

    // Center stack
    private var centerLogoImageView: UIImageView!
    private var appNameLabel: UILabel!
    private var appDescriptionLabel: UILabel!

    private var centerStackView: UIStackView!

    // Bottom stack
    private var signInButton: UIButton!
    private var createAnAccountButton: UIButton!

    private var bottomStackView: UIStackView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main Background")

        drawSideLogo()
        drawMainStackView()
    }

    // Preparing UI elements
    private func drawSideLogo() {
        guard let sideLogoImage = UIImage(named: "Side Logo") else { return }
        let imageRatio = sideLogoImage.size.width / sideLogoImage.size.height
        sideLogoImageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: imageRatio * view.frame.height,
                height: view.frame.height
            )
        )
        sideLogoImageView.image = sideLogoImage
        sideLogoImageView.contentMode = .scaleToFill
        view.addSubview(sideLogoImageView)
    }

    private func prepareTopStack() {
        currentTimeLabel = UILabel()
        currentTimeLabel.backgroundColor = UIColor.clear
        currentTimeLabel.font = UIFont(name: "AvenirNext-Medium", size: 24)
        currentTimeLabel.textColor = UIColor(named: "Main Text")
        currentTimeLabel.text = "00:00 AM"

        currentWeatherLabel = UILabel()
        currentWeatherLabel.font = UIFont(name: "AvenirNext-Demibold", size: 13)
        currentWeatherLabel.textColor = UIColor(named: "Main Text")
        currentWeatherLabel.text = "--℃"

        currentDateLabel = UILabel()
        currentDateLabel.font = UIFont(name: "AvenirNext-Medium", size: 13)
        currentDateLabel.textColor = UIColor(named: "Tertiary Text")
        currentDateLabel.text = "Jan.01.1970 | Thursday"

        currentWeatherIconImageView = UIImageView(image: UIImage(named: "Weather Icon"))
        currentWeatherIconImageView.contentMode = .scaleAspectFit
        currentWeatherIconImageView.clipsToBounds = true

        timeAndWeatherStackView = UIStackView(
            arrangedSubviews: [currentTimeLabel, currentWeatherIconImageView, currentWeatherLabel]
        )
        timeAndWeatherStackView.axis = .horizontal
        timeAndWeatherStackView.distribution = .fillProportionally
        timeAndWeatherStackView.spacing = 8

        topStackView = UIStackView(arrangedSubviews: [timeAndWeatherStackView, currentDateLabel])
        topStackView.axis = .vertical
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 8
    }

    private func prepareCenterStack() {
        centerLogoImageView = UIImageView(image: UIImage(named: "Main Logo"))
        centerLogoImageView.contentMode = .scaleAspectFit

        appNameLabel = UILabel()
        appNameLabel.font = UIFont(name: "Ubuntu-Medium", size: 28)
        appNameLabel.textColor = UIColor(named: "Main Text")
        appNameLabel.textAlignment = .left
        appNameLabel.text = "eWalle"

        appDescriptionLabel = UILabel()
        appDescriptionLabel.font = UIFont(name: "AvenirNext-Medium", size: 14)
        appDescriptionLabel.textColor = UIColor(named: "Tertiary Text")
        appDescriptionLabel.numberOfLines = 0
        appDescriptionLabel.textAlignment = .left
        appDescriptionLabel.text = "Open An Account For Digital E-Wallet Solutions.Instant Payouts.\n\nJoin For Free."

        centerStackView = UIStackView(
            arrangedSubviews: [centerLogoImageView, appNameLabel, appDescriptionLabel]
        )
        centerStackView.axis = .vertical
        centerStackView.alignment = .leading
        centerStackView.spacing = 16
    }

    private func prepareBottomStack() {
        // Sign in
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.layer.cornerRadius = 10
        signInButton.backgroundColor = UIColor(named: "Project Orange")
        guard let signInFont = UIFont(name: "AvenirNext-Demibold", size: 16) else { return }
        guard let signInTitleColor = UIColor(named: "Quarternary Text") else { return }
        let signInAttributedTitle = NSAttributedString(
            string: "Sign in →",
            attributes: [
                .font: signInFont,
                .foregroundColor: signInTitleColor
            ]
        )
        signInButton.setAttributedTitle(signInAttributedTitle, for: .normal)

        // Create an account
        createAnAccountButton = UIButton()
        createAnAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAnAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createAnAccountButton.backgroundColor = .clear
        guard let createAccountFont = UIFont(name: "AvenirNext-Regular", size: 16) else { return }
        guard let createTitleColor = UIColor(named: "Main Text") else { return }
        let createAttributedTitle = NSAttributedString(
            string: "Create an account",
            attributes: [
                .font: createAccountFont,
                .foregroundColor: createTitleColor
            ]
        )
        createAnAccountButton.setAttributedTitle(createAttributedTitle, for: .normal)

        // Bottom stack
        bottomStackView = UIStackView(arrangedSubviews: [signInButton, createAnAccountButton])
        bottomStackView.axis = .vertical
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fill
        bottomStackView.spacing = 16
    }

    private func drawMainStackView() {
        prepareTopStack()
        prepareCenterStack()
        prepareBottomStack()

        mainStackView = UIStackView(
            arrangedSubviews: [topStackView, centerStackView, bottomStackView]
        )
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing

        view.addSubview(mainStackView)

        let mainViewStackConstraints = [
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            mainStackView.leadingAnchor.constraint(
                equalTo: sideLogoImageView.trailingAnchor, constant: -40
            ),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28)
        ]
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(mainViewStackConstraints)
    }
}

// MARK: - SignInViewProtocol
extension SignInViewController: SignInViewProtocol {
    func setWeatherView(temperature: Int, icon: Data?) {
        currentWeatherLabel.text = "\(temperature)℃"
        if let icon = icon {
            currentWeatherIconImageView.image = UIImage(data: icon)
        }
    }

    func setTimeAndDateView(current: Date) {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM.dd.yyyy | EEEE"
        timeFormatter.dateFormat = "hh:mm a"
        currentDateLabel.text = dateFormatter.string(from: current)
        currentTimeLabel.text = timeFormatter.string(from: current)
    }
}
