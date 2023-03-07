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
        40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CellAdvertise else {
            return UITableViewCell()
        }
        cell.setupCell(text: String(advertises[indexPath.row].id))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Touché")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
