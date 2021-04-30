//
//  MenuTableViewCell.swift
//  SushiVeslaTestApp
//
//  Created by Игорь on 28.04.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var selectionIndicator: UIView!
//    var screenNameLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor(named: "Secondary Background")

        selectionIndicator = UIView()
        contentView.addSubview(selectionIndicator)
        selectionIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            .isActive = true
        selectionIndicator.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        selectionIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            .isActive = true
        selectionIndicator.widthAnchor.constraint(equalToConstant: 4.0).isActive = true

//        screenNameLabel = UILabel()
//        screenNameLabel.textColor = UIColor(named: "Main Text")
//        contentView.addSubview(screenNameLabel)
//        screenNameLabel.leadingAnchor.constraint(
//            equalTo: selectionIndicator.trailingAnchor, constant: 8
//        ).isActive = true
//        screenNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
//            .isActive = true
//        screenNameLabel.bottomAnchor.constraint(
//            equalTo: contentView.bottomAnchor, constant: -8
//        ).isActive = true
//        screenNameLabel.trailingAnchor.constraint(
//            equalTo: contentView.trailingAnchor, constant: -8
//        ).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            selectionIndicator.backgroundColor = UIColor(named: "Project Orange")
        } else {
            selectionIndicator.backgroundColor = .clear
        }
    }
}
