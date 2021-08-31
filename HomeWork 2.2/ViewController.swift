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
        
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func changeViewColor() {
        let redColor = CGFloat(redSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        
        colorView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    @IBAction func changeRedSliderValue() {
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        changeViewColor()
    }
    
    @IBAction func changeGreenSliderValue() {
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        changeViewColor()
    }
    
    @IBAction func changeBlueSliderValue() {
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        changeViewColor()
    }
}

