//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Eng.Aseel on 02/10/2024.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    var calculatorBrain = CalculatorBrain()
    @IBAction func heightSliderChanged(_ sender: UISlider) {
       let heightVal = String(format: "%.2f", sender.value) //Height with 2 decimal places
        heightLabel.text = "\(heightVal)m"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func WeightSliderChanged(_ sender: UISlider) {
        let weightVal = String(Int(sender.value))
        weightLabel.text = "\(weightVal)Kg"

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)

        performSegue(withIdentifier: "goToResult" , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
        
    
}

