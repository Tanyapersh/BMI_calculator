

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue: String = "0.0"
    var calculatorBrain = CalculaterBrain()
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   

    
    
    
    @IBAction func heightSliderPressed(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = calculatorBrain.calculateBmi(height, weight)
        bmiValue = calculatorBrain.bmiString(bmi: bmi)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
            destinationVC.color = calculatorBrain.getColor()
            destinationVC.advice = calculatorBrain.getAdvice()
            
        }
    }
    
    
}
