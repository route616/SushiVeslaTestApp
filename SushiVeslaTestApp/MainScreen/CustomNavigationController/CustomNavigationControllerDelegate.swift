//
//  CustomNavigationControllerDelegate.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 01.05.2021.
//

import UIKit

protocol CustomNavigationControllerDelegate {
    func present(viewController: CustomNavigationControllerProtocol)
    func moveSideChildView()
    func backUpChildView()
}
