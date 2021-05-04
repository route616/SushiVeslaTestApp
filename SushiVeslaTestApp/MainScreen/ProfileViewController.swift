//
//  ProfileViewController.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class ProfileViewController: UIViewController, CustomNavigationControllerProtocol {
    var mainView: UIView? { return view }
    var viewController: UIViewController? { return self }
    
    var navigationDelegate: CustomNavigationControllerDelegate?
    
    private var navigationBar: UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Main Background")
        prepareNavigationBar()
    }

    private func prepareNavigationBar() {
        navigationBar = UINavigationBar(
            frame: CGRect(
                x: 0, 
                y: 0, 
                width: view.frame.width, 
                height: (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                    (self.navigationController?.navigationBar.frame.height ?? 0.0)
            )
        )

        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = UIColor(named: "Secondary Background")

        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: 34)
        titleLabel.textColor = UIColor(named: "Main Text")
        titleLabel.text = "Profile"

        let menuButton = UIButton()
        menuButton.frame.size = CGSize(width: 30, height: 30)
        menuButton.setImage(UIImage(named: "Menu Button Image"), for: .normal)
        menuButton.addTarget(self, action: #selector(pushMenuButton), for: .touchUpInside)

        let menuButtonItem = UIBarButtonItem(customView: menuButton)

        let titleItem = UINavigationItem()
        titleItem.titleView = titleLabel
        titleItem.rightBarButtonItem = menuButtonItem

        navigationBar.setItems([titleItem], animated: false)
        view.addSubview(navigationBar)
    }

    @objc private func pushMenuButton() {
        navigationDelegate?.backUpChildView()
    }
}
