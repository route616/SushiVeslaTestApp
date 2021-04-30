//
//  SignInPresenterProtocol.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 17.04.2021.
//

import Foundation

protocol SignInPresenterProtocol: class {
    init(view: SignInViewProtocol, weatherModel: WeatherModel)
    func presentWeather()
}
