//
//  CellAdvertise.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import UIKit

class CellAdvertise: UITableViewCell {
    
    var objectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = ColorsScheme.backgroundSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let category: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = ColorsScheme.backgroundSubtitle
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        let photoStackView = UIStackView(arrangedSubviews: [objectImageView])
        photoStackView.axis = .vertical
        photoStackView.alignment = .fill
        photoStackView.distribution = .fillEqually
        photoStackView.spacing = 5
        photoStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photoStackView)
        
        let generalStackView = UIStackView(arrangedSubviews: [titleStackView, categoryStackView, photoStackView])
        generalStackView.axis = .vertical
        generalStackView.alignment = .fill
        generalStackView.spacing = 5
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(generalStackView)
        
        NSLayoutConstraint.activate([
            generalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            generalStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            generalStackView.bottomAnchor.constraint(lessThanOrEqualTo: margins.bottomAnchor,constant: -5),
            titleStackView.heightAnchor.constraint(equalToConstant: 64.0),
            categoryStackView.heightAnchor.constraint(equalToConstant: 32.0),
            photoStackView.heightAnchor.constraint(equalToConstant: 300.0)
        ])
    }
    
    func setupCell(title: String, category: String, imageView: UIImageView) {
        self.title.text = title
        self.category.text = category
        self.objectImageView = imageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
