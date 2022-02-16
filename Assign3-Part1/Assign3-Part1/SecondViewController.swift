//
//  SecondViewController.swift
//  Assign3-Part1
//
//  Created by Venkatanathan Annamalai on 2/15/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWindow: UILabel!
    
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWindow.text = welcomeStr

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }


}
