//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Georgi Sirakov on 7.01.23.
//

import UIKit

class CalculateViewController: UITableViewController {
    
    var calculatorBrain = CalcolatorBrain()
    var bmiValue1 = "0.0"
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSliderLabel: UISlider!
    @IBOutlet weak var weightSliderLabel: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value))+"Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let weight = weightSliderLabel.value
        let height = heightSliderLabel.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "gotToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotToResult" {
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue2 = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}
