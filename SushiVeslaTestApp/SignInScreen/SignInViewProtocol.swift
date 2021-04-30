//
//  SignInViewProtocol.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 17.04.2021.
//

import Foundation

protocol SignInViewProtocol: class {
    func setWeatherView(temperature: Int, icon: Data?)
    func setTimeAndDateView(current: Date)
}
