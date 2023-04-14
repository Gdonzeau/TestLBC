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
    private var areCategoriesLoaded: Bool = false {
        didSet {
            if areCategoriesLoaded {
                reloadButton.isHidden = false
                activityIndicator.isHidden = true
            } else {
                reloadButton.isHidden = true
                activityIndicator.isHidden = false
            }
        }
    }
    private var isListingLoaded: Bool = false

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
        loadingCategory()
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
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 5
        text.translatesAutoresizingMaskIntoConstraints = false

        tableObjects.layer.masksToBounds = true
        tableObjects.layer.cornerRadius = 5
        tableObjects.translatesAutoresizingMaskIntoConstraints = false
        
        reloadButton.backgroundColor = ColorsScheme.backgroundButton
        reloadButton.layer.cornerRadius = 5
        reloadButton.setTitle("Charger les annonces", for: .normal)
        reloadButton.addTarget(self, action: #selector(loadingData), for: .touchUpInside)

        // MARK: - Contraints
        
        let margins = view.layoutMarginsGuide
        
        let buttonStackView = UIStackView(arrangedSubviews: [reloadButton, activityIndicator])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //GlobalStackView
        let globalStackView = UIStackView(arrangedSubviews: [text, tableObjects, buttonStackView])
        globalStackView.axis = .vertical
        globalStackView.alignment = .fill
        globalStackView.spacing = 5
        globalStackView.translatesAutoresizingMaskIntoConstraints = false
        globalStackView.addArrangedSubview(text)
        globalStackView.addArrangedSubview(tableObjects)
        globalStackView.addArrangedSubview(buttonStackView)

        view.addSubview(globalStackView)
        
        NSLayoutConstraint.activate([
            globalStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            globalStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            globalStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            globalStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            text.heightAnchor.constraint(equalToConstant: 50),
            tableObjects.heightAnchor.constraint(greaterThanOrEqualToConstant: 400),
            buttonStackView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupTableView() {
        tableObjects.register(CellAdvertise.self,forCellReuseIdentifier: cellReuseIdentifier)
        tableObjects.dataSource = self
        tableObjects.delegate = self
    }
    
    private func loadingCategory() {
        callingAPI(url: Urls.categories)
    }
    
    @objc private func loadingData() {
        //test()
        callingAPI(url: Urls.listing)
         
    }
    
    private func callingAPI(url: String) { // Remplacer par le call API
        reloadButton.isHidden = true // On cache le bouton pour éviter une succession de call.
        activityIndicator.startAnimating()
        advertises = []
        tableObjects.reloadData()
        
        ServiceAPI.shared.getDataFromAPI(stringAdress: url) { result in
            switch result {
                case.success(let data):
                    if let advertises = try? JSONDecoder().decode([Advertise]?.self, from: data as! Data) {
                        print("Data Advertise")
                        for advertise in advertises {
                            self.advertises.append(advertise)
                            self.isListingLoaded = true
                        }
                        self.tableObjects.reloadData()
                        self.reloadButton.isHidden = false
                        self.activityIndicator.stopAnimating()
                        
                    } else if let data = try? JSONDecoder().decode([CategoryDowloaded]?.self, from: data as! Data) {
                        print("Data Category")
                        Category.id = [:]
                        for category in data {
                            Category.id[category.id] = category.name
                        }
                        self.areCategoriesLoaded = true
                    } else {
                        let error: APIErrors = .decodingError
                        if let errorMessage = error.errorDescription, let errorTitle = error.failureReason {
                            self.allErrors(errorMessage: errorMessage, errorTitle: errorTitle)
                        }
                    }
                case.failure(let error):
                    if let errorMessage = error.errorDescription, let errorTitle = error.failureReason {
                        self.allErrors(errorMessage: errorMessage, errorTitle: errorTitle)
                    }
            }
        }
        tableObjects.reloadData()
    }
    
    func allErrors(errorMessage: String, errorTitle: String) {
        let alertVC = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

