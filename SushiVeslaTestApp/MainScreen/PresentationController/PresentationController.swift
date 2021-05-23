//
//  PresentationController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 01.05.2021.
//

import UIKit

class PresentationController: UIViewController {
    private var rootViewController: PresentationControllerProtocol!
    private var childViewController: PresentationControllerProtocol!

    private var childView: UIView!

    private let resizeRatio: CGFloat = 0.678
    private let modRotationAngle: CGFloat = 345.0 * CGFloat.pi / 180.0
    private let offsetRatio: CGFloat = 167.09 / 375

    // MARK: Initializtion
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(
        rootViewController: PresentationControllerProtocol, 
        startViewController: PresentationControllerProtocol
    ) {
        super.init(nibName: nil, bundle: nil)
        self.rootViewController = rootViewController
        self.childViewController = startViewController
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        rootViewController.setPresentationDelegate(presentationDelegate: self)
        childViewController.setPresentationDelegate(presentationDelegate: self)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareChildView()
        placeRootViewController()
        placeChildViewController(childViewController: childViewController)
    }

    // MARK: Main controllers presentation
    private func prepareChildView() {
        childView = UIView()
        childView.frame = view.bounds
        view.addSubview(childView)
    }

    private func placeRootViewController() {
        guard let rootVC = rootViewController.viewController else { return }
        guard let rootView = rootViewController.mainView else { return }
        addChild(rootVC)
        rootView.frame = view.bounds
        rootVC.didMove(toParent: self)
        view.insertSubview(rootView, at: 0)
    }

    private func placeChildViewController(
        childViewController: PresentationControllerProtocol
    ) {
        guard let childVC = childViewController.viewController else { return }
        guard let childVCView = childViewController.mainView else { return }
        addChild(childVC)
        childVC.didMove(toParent: self)
        childVCView.frame = childView.bounds
        childView.addSubview(childVCView)
    }
}

// MARK: - CustomNavigationControllerDelegate
extension PresentationController: PresentationControllerDelegate {
    // MARK: Navigation
    func present(viewController: PresentationControllerProtocol) {
        guard let currentVC = childViewController.viewController else { return }
        currentVC.willMove(toParent: nil)
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParent()
        childViewController = viewController
        childViewController.setPresentationDelegate(presentationDelegate: self)
        placeChildViewController(childViewController: childViewController)
        backUpChildView()
    }

    func moveSideChildView() {
        UIView.animate(withDuration: 0.3) {
            let transform = CGAffineTransform(rotationAngle: self.modRotationAngle)
                .concatenating(CGAffineTransform(scaleX: self.resizeRatio, y: self.resizeRatio))
                .concatenating(
                    CGAffineTransform(translationX: self.view.frame.width * self.offsetRatio, y: 0)
                )
            self.childView.transform = transform
            self.childView.layer.cornerRadius = 30
            self.childView.layer.masksToBounds = true
        }
    }

    func backUpChildView() {
        UIView.animate(withDuration: 0.3) {
            self.childView.transform = .identity
            self.childView.layer.cornerRadius = 0
            self.childView.layer.masksToBounds = true
        }
    }
}
