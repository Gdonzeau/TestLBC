//
//  AdvertiseViewController.swift
//  TestLBC
//
//  Created by Guillaume on 13/03/2023.
//

import UIKit

class AdvertiseViewController: UIViewController {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    let advertiseDescription: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.isEditable = false
        textView.isSelectable = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Retour",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        setupView()
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    private func setupView() {
        titleLabel.backgroundColor = .blue
        //titleLabel.frame = CGRect(x: 100, y: 100, width: 300, height: 32)
        view.addSubview(titleLabel)
        view.addSubview(advertiseDescription)
        
        let margins = view.layoutMarginsGuide
        
        let globalStackView = UIStackView(arrangedSubviews: [titleLabel, advertiseDescription])
        globalStackView.axis = .vertical
        globalStackView.alignment = .fill
        globalStackView.spacing = 5
        globalStackView.translatesAutoresizingMaskIntoConstraints = false
        globalStackView.addArrangedSubview(titleLabel)
        globalStackView.addArrangedSubview(advertiseDescription)
        
        view.addSubview(globalStackView)
        
        NSLayoutConstraint.activate([
            globalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            globalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            globalStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            globalStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: globalStackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: globalStackView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: globalStackView.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            advertiseDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
        ])
    }
    
}


