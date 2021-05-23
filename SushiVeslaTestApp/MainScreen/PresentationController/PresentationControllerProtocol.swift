//
//  PresentationControllerProtocol.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 29.04.2021.
//

import UIKit

protocol PresentationControllerProtocol {
    var mainView: UIView? { get }
    var viewController: UIViewController? { get }

    func setPresentationDelegate(presentationDelegate: PresentationControllerDelegate)
}
