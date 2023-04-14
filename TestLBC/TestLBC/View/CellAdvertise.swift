//
//  CellAdvertise.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import UIKit

class CellAdvertise: UITableViewCell {
    
    private var urgent: Bool = false
    
    private let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = ColorsScheme.backgroundSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    private let category: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = ColorsScheme.backgroundSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    private let price: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = ColorsScheme.backgroundSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let margins = layoutMarginsGuide
        
        let titleStackView = UIStackView(arrangedSubviews: [title])
        titleStackView.axis = .vertical
        titleStackView.alignment = .fill
        titleStackView.distribution = .fillEqually
        titleStackView.spacing = 5
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleStackView)
        
        let categoryStackView = UIStackView(arrangedSubviews: [category])
        categoryStackView.axis = .vertical
        categoryStackView.alignment = .fill
        categoryStackView.distribution = .fillEqually
        categoryStackView.spacing = 5
        categoryStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryStackView)
        
        let priceStackView = UIStackView(arrangedSubviews: [price])
        priceStackView.axis = .horizontal
        priceStackView.alignment = .fill
        priceStackView.distribution = .fillEqually
        priceStackView.spacing = 5
        priceStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceStackView)
        
        let generalStackView = UIStackView(arrangedSubviews: [titleStackView, categoryStackView])
        generalStackView.axis = .vertical
        generalStackView.alignment = .fill
        generalStackView.spacing = 5
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(generalStackView)
        
        NSLayoutConstraint.activate([
            generalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            generalStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            generalStackView.heightAnchor.constraint(equalToConstant: 101),
            
            titleStackView.heightAnchor.constraint(equalToConstant: 64.0),
            categoryStackView.heightAnchor.constraint(equalToConstant: 32.0),
            
            priceStackView.heightAnchor.constraint(equalToConstant: 32),
            priceStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            priceStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10),
            priceStackView.widthAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    func setupCell(title: String, category: String, urgent: Bool, price: Int) {
        self.title.text = title
        self.category.text = category
        self.urgent = urgent
        self.price.text = String(price) + " €"
        
        if self.urgent {
            self.title.backgroundColor = ColorsScheme.backgroundUrgent
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
