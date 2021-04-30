//
//  SignInPresenter.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 17.04.2021.
//

import Foundation

class SignInPresenter: SignInPresenterProtocol {
    private let view: SignInViewProtocol
    private let model: WeatherModel

    required init(view: SignInViewProtocol, weatherModel: WeatherModel) {
        self.view = view
        self.model = weatherModel
    }

    func presentWeather() {
        self.view.setWeatherView(temperature: model.temperature, icon: model.icon)
    }
}
