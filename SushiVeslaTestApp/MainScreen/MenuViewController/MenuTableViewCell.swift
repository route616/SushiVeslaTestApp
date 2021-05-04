import UIKit


class MenuTableViewCell: UITableViewCell {
    var selectionIndicator: UIView!
    var screenNameLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = UIColor(named: "Secondary Background")

        prepareSelectionIndicator()
        prepareScreenNameLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            selectionIndicator.backgroundColor = UIColor(named: "Project Orange")
            screenNameLabel.font = UIFont(name: "AvenirNext-Bold", size: 16)
        } else {
            selectionIndicator.backgroundColor = .clear
            screenNameLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
        }
    }

    private func prepareSelectionIndicator() {
        selectionIndicator = UIView()
        contentView.addSubview(selectionIndicator)
        selectionIndicator.translatesAutoresizingMaskIntoConstraints = false
        selectionIndicator.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor
        ).isActive = true
        selectionIndicator.topAnchor.constraint(
            equalTo: contentView.topAnchor, constant: 8
        ).isActive = true
        selectionIndicator.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor, constant: -8
        ).isActive = true
        selectionIndicator.widthAnchor.constraint(equalToConstant: 4.0).isActive = true
    }

    private func prepareScreenNameLabel() {
        screenNameLabel = UILabel()
        screenNameLabel.textColor = UIColor(named: "Main Text")
        screenNameLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
        contentView.addSubview(screenNameLabel)
        screenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        screenNameLabel.leadingAnchor.constraint(
            equalTo: selectionIndicator.trailingAnchor, constant: 24
        ).isActive = true
        screenNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8)
            .isActive = true
        screenNameLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor, constant: -8
        ).isActive = true
        screenNameLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor, constant: -8
        ).isActive = true
    }
}
