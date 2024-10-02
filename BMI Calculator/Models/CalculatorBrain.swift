//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Eng.Aseel on 02/10/2024.
//

import UIKit
struct CalculatorBrain{
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
         let bmiValue =  weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue , advice: "Eat more pies!" , color: UIColor.blue)
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue , advice: "Fit well!" , color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue , advice: "Eat less pies!" , color: UIColor.red)

        }
    }
    
    func getBMIValue() -> String {
        let bmiIn1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiIn1DecimalPlace
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
}
