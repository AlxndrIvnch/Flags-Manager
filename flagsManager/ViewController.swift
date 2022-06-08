//
//  ViewController.swift
//  hackingwithswift16
//
//  Created by Aleksandr on 30.05.2022.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.title = "Choose country flag"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix(".png") {
                flags.append(item)
            }
        }
        
        flags.sort()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return flags.count / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(flags[indexPath.row + indexPath.section * 2].uppercased())"
        content.image = UIImage(named: flags[indexPath.row + indexPath.section * 2])
        content.imageProperties.cornerRadius = 3
        content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flags[indexPath.row + indexPath.section * 2]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 
        return String(flags[section * 2].dropLast(7))
    }
}

 
