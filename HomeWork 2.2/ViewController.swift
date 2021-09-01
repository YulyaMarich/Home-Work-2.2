//
//  ViewController.swift
//  HomeWork 2.2
//
//  Created by Julia on 30.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupUI()
        changeViewColor()
    }
    
   
    @IBAction func changeRedSliderValue() {
        redSliderValue.text = string(redSlider)
        changeViewColor()
    }
    
    @IBAction func changeGreenSliderValue() {
        greenSliderValue.text = string(greenSlider)
        changeViewColor()
    }
    
    @IBAction func changeBlueSliderValue() {
        blueSliderValue.text = string(blueSlider)
        changeViewColor()
    }


    private func initialSetupUI() {
        redSliderValue.text = string(redSlider)
        greenSliderValue.text = string(greenSlider)
        blueSliderValue.text = string(blueSlider)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func string(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    
    private func changeViewColor() {
        let redColor = CGFloat(redSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        
        colorView.backgroundColor = UIColor(red: redColor,
                                            green: greenColor,
                                            blue: blueColor,
                                            alpha: 1)
    }
}
