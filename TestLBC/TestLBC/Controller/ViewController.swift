//
//  ViewController.swift
//  TestLBC
//
//  Created by Guillaume on 01/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let text = UILabel()
    private let tableObjects = UITableView()
    private let reloadButton = UIButton()
    private let activityIndicator = UIActivityIndicatorView()

    let cellReuseIdentifier = "cellAdvertise"
    var advertises : [Advertise] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        setupTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.stopAnimating()
        loadingData()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.backgroundColor = ColorsScheme.background

        text.text = "Test Le Bon Coin"
        text.adjustsFontForContentSizeCategory = true
        text.backgroundColor = ColorsScheme.backgroundTitle
        text.textColor = ColorsScheme.text
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.contentMode = .scaleAspectFit
        text.translatesAutoresizingMaskIntoConstraints = false

        tableObjects.layer.masksToBounds = true
        tableObjects.translatesAutoresizingMaskIntoConstraints = false
        
        reloadButton.backgroundColor = ColorsScheme.backgroundButton
        reloadButton.layer.cornerRadius = 5
        reloadButton.setTitle("Mise à jour", for: .normal)
        reloadButton.addTarget(self, action: #selector(loadingData), for: .touchUpInside)

        // MARK: - Contraints
        
        let margins = view.layoutMarginsGuide
        
        let titleStackView = UIStackView(arrangedSubviews: [text])
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableStackView = UIStackView(arrangedSubviews: [tableObjects])
        tableStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonStackView = UIStackView(arrangedSubviews: [reloadButton, activityIndicator])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //GlobalStackView
        let globalStackView = UIStackView(arrangedSubviews: [titleStackView, tableStackView, buttonStackView])
        globalStackView.axis = .vertical
        globalStackView.alignment = .fill
        globalStackView.spacing = 5
        globalStackView.translatesAutoresizingMaskIntoConstraints = false
        globalStackView.addArrangedSubview(titleStackView)
        globalStackView.addArrangedSubview(tableStackView)
        globalStackView.addArrangedSubview(buttonStackView)

        view.addSubview(globalStackView)
        
        NSLayoutConstraint.activate([
            globalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            globalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            globalStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            //globalStackView.bottomAnchor.constraint(lessThanOrEqualTo: margins.bottomAnchor,constant: -120),
            globalStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor,constant: -120),
            
            titleStackView.heightAnchor.constraint(equalToConstant: 32.0),
            tableStackView.heightAnchor.constraint(equalToConstant: 320.0),
            buttonStackView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupTableView() {
        tableObjects.register(CellAdvertise.self,forCellReuseIdentifier: cellReuseIdentifier)
        tableObjects.dataSource = self
        tableObjects.delegate = self
    }
    
    @objc private func loadingData() { // Remplacer par le call API
        reloadButton.isHidden = true // On cache le bouton pour éviter une succession de call.
        activityIndicator.startAnimating()
        advertises = []
        tableObjects.reloadData()
        
        let url = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
        ServiceAPI.shared.getAdvertises(stringAdress: url) { result in
            switch result {
                case.success(let advertises):
                    print("***** Résutat")
                    print(advertises)
                    for advertise in advertises {
                        self.advertises.append(advertise)
                    }
                    self.tableObjects.reloadData()
                    self.reloadButton.isHidden = false
                    self.activityIndicator.stopAnimating()
                case.failure(let error):
                    print("***** Erreur")
                    print(error)
            }
        }
        tableObjects.reloadData()
    }
    


}

