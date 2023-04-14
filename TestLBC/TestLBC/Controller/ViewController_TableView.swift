//
//  ViewController_TableView.swift
//  TestLBC
//
//  Created by Guillaume on 07/03/2023.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableViews
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        advertises.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        450.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CellAdvertise else {
            return UITableViewCell()
        }
        var objectCategory = ""
        if let category = Category.id[advertises[indexPath.row].categoryId] {
            objectCategory = category
        } else {
            objectCategory = "Inconnue"
        }
        let image = UIImageView()
        guard let imageUrl = advertises[indexPath.row].imagesUrl["thumb"] else {
            cell.backgroundColor = UIColor.blue
            return UITableViewCell()
        }
        guard let URLUnwrapped = URL(string: imageUrl) else {
            let error = APIErrors.invalidURL
            // Gestion des alertes
            if let errorMessage = error.errorDescription, let errorTitle = error.failureReason {
                allErrors(errorMessage: errorMessage, errorTitle: errorTitle)
            }
            return UITableViewCell()
        }
        image.load(url: URLUnwrapped)
        
        cell.setupCell(title: advertises[indexPath.row].title,
                       category: objectCategory,
                       urgent: advertises[indexPath.row].isUrgent,
                       price: advertises[indexPath.row].price)
        cell.backgroundView = image
        cell.backgroundView?.contentMode = .scaleAspectFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Touché")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let advertiseViewController = AdvertiseViewController()
        advertiseViewController.titleLabel.text = advertises[indexPath.row].title
        advertiseViewController.advertiseDescription.text = advertises[indexPath.row].description
        
        let navVC = UINavigationController(rootViewController: advertiseViewController)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
