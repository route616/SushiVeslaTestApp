//
//  Utilities.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 29.04.2021.
//

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}
