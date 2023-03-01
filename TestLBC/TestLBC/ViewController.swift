//
//  ViewController.swift
//  TestLBC
//
//  Created by Guillaume on 01/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let text = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.backgroundColor = .gray
        
        text.text = "Hello World"
        text.adjustsFontForContentSizeCategory = true
        text.backgroundColor = .black
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.contentMode = .scaleAspectFit
        text.translatesAutoresizingMaskIntoConstraints = false
        
        // view.addSubview(text)
        
        // MARK: - Contraints
        
        let margins = view.layoutMarginsGuide
        
        let titleStackView = UIStackView(arrangedSubviews: [text])
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.distribution = .fillEqually
        titleStackView.spacing = 5
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleStackView)
        
        //GlobalStackView
        let globalStackView = UIStackView(arrangedSubviews: [titleStackView])
        globalStackView.axis = .vertical
        globalStackView.alignment = .fill
        globalStackView.spacing = 5
        globalStackView.translatesAutoresizingMaskIntoConstraints = false
        globalStackView.addArrangedSubview(titleStackView)
        view.addSubview(globalStackView)
        
        NSLayoutConstraint.activate([
            globalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            globalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            globalStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            globalStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor,constant: -40),
            
            titleStackView.heightAnchor.constraint(equalToConstant: 32.0)
        ])
    }


}

