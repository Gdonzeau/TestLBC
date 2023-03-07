//
//  CellAdvertise.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import UIKit

class CellAdvertise: UITableViewCell {
    lazy var Title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(Title)
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: topAnchor),
            Title.bottomAnchor.constraint(equalTo: bottomAnchor),
            Title.rightAnchor.constraint(equalTo: rightAnchor),
            Title.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    func setupCell(text: String) {
        Title.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
