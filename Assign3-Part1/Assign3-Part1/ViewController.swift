//
//  ViewController.swift
//  Assign3-Part1
//
//  Created by Venkatanathan Annamalai on 2/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecond(_ sender: Any) {
        
        performSegue(withIdentifier: "segueToSecond", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecond" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.welcomeStr = "Welcome \(txtFirstName.text!), \(txtLastName.text!)"
        }
    }
    
}

