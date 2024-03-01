//
//  ViewController.swift
//  PlistDataParsing
//
//  Created by Droadmin on 26/09/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var name = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        // Do any additional setup after loading the view.
    }

    func getData(){
        
        guard let path = Bundle.main.path(forResource: "JsonPlist", ofType: "plist") else {
            print("path not found")
            return
        }

        if let dict = NSDictionary(contentsOfFile: path) {
            name = dict.object(forKey: "RootPartArray") as? [String] ?? ["nil"]
            print(name)
            tableView.reloadData()
        }else{
            print("RootPartArray is not a valid String array")
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.nameLbl.text = name[indexPath.row]
        cell.backgroundColor = .cyan
        return cell
    }


}

