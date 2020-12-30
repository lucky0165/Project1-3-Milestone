//
//  ViewController.swift
//  Project1-3-Milestone
//
//  Created by Łukasz Rajczewski on 30/12/2020.
//

import UIKit

class ViewController: UITableViewController {

    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.shuffle()

        tableView.rowHeight = 80
    
    }
    
    // MARK: - Table view methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
   
        
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.imageView?.layer.borderColor = UIColor.gray.cgColor
        cell.imageView?.layer.borderWidth = 1
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
        
            detailVC.selectedImage = countries[indexPath.row]
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }


}

