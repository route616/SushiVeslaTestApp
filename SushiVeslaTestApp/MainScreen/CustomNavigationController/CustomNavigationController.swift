//
//  CustomNavigationController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 01.05.2021.
//

import UIKit

class CustomNavigationController: UIViewController {
    private var rootViewController: CustomNavigationControllerProtocol! {
        didSet {
            placeRootViewController()
            rootViewController.navigationDelegate = self
        }
    }
    private var currentChildViewController: CustomNavigationControllerProtocol! {
        didSet {
            currentChildViewController.navigationDelegate = self
            placeChildViewController(childViewController: currentChildViewController)
        }
    }
    private var childControllerView: UIView!

    private let resizeRatio: CGFloat = 0.678
    private let modRotationAngle: CGFloat = 345.0 * CGFloat.pi / 180.0
    private let offsetRatio: CGFloat = 167.09 / 375

    // MARK: Initializtion
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(
        rootViewController: CustomNavigationControllerProtocol, 
        startViewController: CustomNavigationControllerProtocol
    ) {
        super.init(nibName: nil, bundle: nil)
        self.rootViewController = rootViewController
        self.currentChildViewController = startViewController
        self.rootViewController.navigationDelegate = self
        self.currentChildViewController.navigationDelegate = self
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsLayout()
        prepareChildControllerView()
        placeRootViewController()
        placeChildViewController(childViewController: currentChildViewController)
    }

    // MARK: Main controllers representation
    private func prepareChildControllerView() {
        childControllerView = UIView()
        childControllerView.frame = view.frame
        view.addSubview(childControllerView)
    }

    private func placeRootViewController() {
        guard let rootVC = rootViewController.viewController else { return }
        guard let rootVCView = rootViewController.mainView else { return }
        addChild(rootVC)
        rootVCView.frame = view.frame
        rootVC.didMove(toParent: self)
        view.insertSubview(rootVCView, at: 0)
    }

    private func placeChildViewController(
        childViewController: CustomNavigationControllerProtocol
    ) {
        guard let childVC = childViewController.viewController else { return }
        guard let childVCView = childViewController.mainView else { return }
        addChild(childVC)
        childVCView.frame = childControllerView.frame
        childVC.didMove(toParent: self)
        childControllerView.addSubview(childVCView)
    }
}

// MARK: - CustomNavigationControllerDelegate
extension CustomNavigationController: CustomNavigationControllerDelegate {
    // MARK: Navigation
    func present(viewController: CustomNavigationControllerProtocol) {
        guard let currentVC = currentChildViewController.viewController else { return }
        backUpChildView()
        currentVC.willMove(toParent: nil)
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParent()
        currentChildViewController = viewController
    }

    func moveSideChildView() {
        UIView.animate(withDuration: 0.3) {
            let transform = CGAffineTransform(rotationAngle: self.modRotationAngle)
                .concatenating(CGAffineTransform(scaleX: self.resizeRatio, y: self.resizeRatio))
                .concatenating(
                    CGAffineTransform(translationX: self.view.frame.width * self.offsetRatio, y: 0)
                )
            self.childControllerView.transform = transform
            self.childControllerView.layer.cornerRadius = 30
            self.childControllerView.layer.masksToBounds = true
        }
    }

    func backUpChildView() {
        UIView.animate(withDuration: 0.3) {
            self.childControllerView.transform = .identity
            self.childControllerView.layer.cornerRadius = 0
            self.childControllerView.layer.masksToBounds = true
        }
    }
}
