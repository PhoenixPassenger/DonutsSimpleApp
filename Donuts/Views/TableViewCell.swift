//
//  TableViewCell.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .redDonut
        self.selectionStyle = .none
        self.tintColor = .pinkDonut
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    // MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .pinkDonut
        label.font = UIFont.boldSystemFont(ofSize: 26)
        self.addSubview(label)
        return label
    }()

    func set( topping: Topping) {
        titleLabel.text = topping.type
    }
    
}
extension TableViewCell {
    private func setupUI() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
}
