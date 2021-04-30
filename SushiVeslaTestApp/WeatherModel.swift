//
//  WeatherModel.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 22.04.2021.
//

import Foundation

struct WeatherModel {
    let temperature: Int
    let icon: Data?

    static let mock = WeatherModel(
        temperature: 34,
        icon: try? Data(contentsOf: URL(fileURLWithPath: "Weather Icon"))
    )
}
