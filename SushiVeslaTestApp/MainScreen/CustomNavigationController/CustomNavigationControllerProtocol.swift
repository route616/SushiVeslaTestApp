//
//  CustomNavigationControllerProtocol.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 29.04.2021.
//

import UIKit

protocol CustomNavigationControllerProtocol {
    var mainView: UIView? { get }
    var viewController: UIViewController? { get }
    var navigationDelegate: CustomNavigationControllerDelegate? { get set }
}
