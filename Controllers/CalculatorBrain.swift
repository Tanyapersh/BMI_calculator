
import Foundation
import UIKit


struct CalculaterBrain {
    
    var bmi: BMI?
    

    
    
    mutating func calculateBmi(_ height: Float, _ weight: Float) -> Float{
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.init(red: 0.68, green: 0.93, blue: 0.93, alpha: 1.0))
        } else if bmiValue < 29.10{
            bmi = BMI(value: bmiValue, advice: "You are perfect, beautiful, the best!", color: UIColor.init(red: 0.46, green: 0.86, blue: 0.46, alpha: 1.0))
        } else{
            bmi = BMI(value: bmiValue, advice: "You are fat pig! And very bed person. Kill yourself!", color: UIColor.init(red: 0.76, green: 0.11, blue: 0.22, alpha: 1.0))
        }
        
        return bmiValue
    }
    
    func bmiString(bmi: Float) -> String {
        return String(format: "%.1f", bmi)
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.gray
    }
    
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
}
