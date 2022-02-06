//
//  ViewController.swift
//  CreateTableView-HW2
//
//  Created by Venkatanathan Annamalai on 2/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let images = ["Dosa","Idiappam","Idly","Kichidi","Paniyaram","Parotta","Pongal","Puri","Upma","Vada"]
    
    let foodNames = ["Dosa","Idiappam","Idly","Kichidi","Paniyaram","Parotta","Pongal","Puri","Upma","Vada"]

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        
        cell.lblCell.text = foodNames[indexPath.row]
        
        return cell
    }

}

