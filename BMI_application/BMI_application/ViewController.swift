//
//  ViewController.swift
//  BMI_application
//
//  Created by Venkatanathan Annamalai on 5/2/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var txtHeight: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtftConvert: UITextField!
    
    @IBOutlet weak var txtinConvert: UITextField!
    
    @IBOutlet weak var txtkgConvert: UITextField!
    
    @IBOutlet weak var resultBMI: UILabel!
    
    @IBOutlet weak var InchestoCMController: UISegmentedControl!
    
    @IBOutlet weak var lbstoKgController: UISegmentedControl!
    
    var height = 0.0
    var weight = 0.0
    var BMI = 0.0{
        didSet{
            if BMI != 0{
                resultBMI.text = String(format: "%.2f",BMI )
            }
        }
        
    }
    func calculate(_ h: Double,_ w: Double)-> Double{
        return w/pow(h, 2)
    }
    
    
    @IBAction func InchestoCM(_ sender: Any) {
        switch InchestoCMController.selectedSegmentIndex{
        case 0:
            txtinConvert.isHidden = false
            height = (Double(txtftConvert.text!) ?? 0) * 0.3048 +
            (Double(txtinConvert.text!) ?? 0) * 0.0254
        case 1:
            txtinConvert.isHidden = true
            height = (Double(txtftConvert.text!) ?? 0)/100
        default:
            break
        }
        if height * weight != 0 {
            BMI = calculate(height, weight)
        }
 
    }
    
    @IBAction func lbstoKg(_ sender: Any) {
        switch lbstoKgController.selectedSegmentIndex{
        case 0:
            weight = (Double(txtkgConvert.text!) ?? 0) * 0.45359237
        case 1:
            weight = Double(txtkgConvert.text!) ?? 0
        default:
            break
        }
        if height * weight != 0{
            BMI = calculate(height, weight)
        }
    }
    
    @IBAction func calBMI(_ sender: Any) {
        switch InchestoCMController.selectedSegmentIndex{
        case 0:
            height = (Double(txtftConvert.text!) ?? 0) * 0.3048 +
            (Double(txtinConvert.text!) ?? 0) * 0.0254
        case 1:
            height = (Double(txtftConvert.text!) ?? 0)/100
        default:
            break
        }
        switch lbstoKgController.selectedSegmentIndex{
        case 0:
            weight = (Double(txtkgConvert.text!) ?? 0) * 0.45359237
        case 1:
            weight = Double(txtkgConvert.text!) ?? 0
        default:
            break
        }
        if height * weight != 0 {
            BMI = calculate(height, weight)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

