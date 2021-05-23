//
//  PresentationControllerDelegate.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 01.05.2021.
//

import UIKit

protocol PresentationControllerDelegate {
    func present(viewController: PresentationControllerProtocol)
    func moveSideChildView()
    func backUpChildView()
}
