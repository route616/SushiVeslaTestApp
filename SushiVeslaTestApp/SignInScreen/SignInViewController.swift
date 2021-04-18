//
//  SignInViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 16.04.2021.
//

import UIKit

class SignInViewController: UIViewController {
    // MARK: - UI Elements
    private var sideLogoImageView: UIImageView!

    private var currentTimeLabel: UILabel!
    private var currentDateLabel: UILabel!
    private var currentWeatherLabel: UILabel!
    private var currentWeatherIconImageView: UIImageView!

    private var centerLogoImageView: UIImageView!
    private var appNameLabel: UILabel!
    private var appDescriptionLabel: UILabel!

    private var signInButton: UIButton!
    private var createAnAccountButton: UIButton!
}

extension SignInViewController: SignInViewProtocol {
    func setWeatherView(weatherModel: WeatherModel) {
        <#code#>
    }
}
