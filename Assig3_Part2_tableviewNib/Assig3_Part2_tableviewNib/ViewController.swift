//
//  ViewController.swift
//  Assig3_Part2_tableviewNib
//
//  Created by Venkatanathan Annamalai on 2/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    let images = ["Dosa","Idiappam","Idly","Kichidi","Paniyaram","Parotta","Pongal","Puri","Upma","Vada"]
        
        let imageLabel = ["Dosa","Idiappam","Idly","Kichidi","Paniyaram","Parotta","Pongal","Puri","Upma","Vada"]
    

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageLabel[indexPath.row]
        
        return cell
    }


}

