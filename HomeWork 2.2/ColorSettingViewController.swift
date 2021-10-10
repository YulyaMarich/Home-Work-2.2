//
//  ColorSettingViewController.swift
//  HomeWork 2.2
//
//  Created by Julia on 30.08.2021.
//

import UIKit

protocol BackroundColorDelegate {
    func changeColor(_ color: UIColor)
}

class ColorSettingViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    // MARK: - Public Properties
    var changedcolorView: UIColor!
    var delegate: BackroundColorDelegate!
    
    // MARK: - Live Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setGeneralSettings()
        makeToolBarButton()
        initialSetupUI()
        changeViewColor()
        colorView.backgroundColor = changedcolorView
        changePositionOfSliders()
        
        redColorTextField.delegate = self
        greenColorTextField.delegate = self
        blueColorTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func pressDoneButton() {
        delegate.changeColor(colorView.backgroundColor ?? .white)
    }
    
    @IBAction func changeRedSliderValue() {
        redSliderValue.text = string(redSlider)
        redColorTextField.text = string(redSlider)
        changeViewColor()
    }
    
    @IBAction func changeGreenSliderValue() {
        greenSliderValue.text = string(greenSlider)
        greenColorTextField.text = string(greenSlider)
        changeViewColor()
    }
    
    @IBAction func changeBlueSliderValue() {
        blueSliderValue.text = string(blueSlider)
        blueColorTextField.text = string(blueSlider)
        changeViewColor()
    }
    
    // MARK: - Public methods
    func makeToolBarButton() {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: self,
                                            action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(pressToolBarDoneButton))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        redColorTextField.inputAccessoryView = toolBar
        greenColorTextField.inputAccessoryView = toolBar
        blueColorTextField.inputAccessoryView = toolBar
    }
    
    @objc func pressToolBarDoneButton() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        if let obtainedValue = Float(text) {
            
            if textField == redColorTextField {
                redSlider.setValue(obtainedValue, animated: true)
                redSliderValue.text = String(redSlider.value)
            } else if textField == greenColorTextField {
                greenSlider.setValue(obtainedValue, animated: true)
                greenSliderValue.text = String(greenSlider.value)
            } else if textField == blueColorTextField {
                blueSlider.setValue(obtainedValue, animated: true)
                blueSliderValue.text = String(blueSlider.value)
            }
        changeViewColor()
        }
    }
    
    // MARK: - Private Methods
    private func changePositionOfSliders() {
        var redColor = CGFloat(0)
        var greenColor = CGFloat(0)
        var blueColor = CGFloat(0)
        var alpha = CGFloat(0)
        
        changedcolorView.getRed(&redColor,
                                green: &greenColor,
                                blue: &blueColor,
                                alpha: &alpha)
        
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        initialSetupUI()
    }
    
    private func initialSetupUI() {
        redColorTextField.text = string(redSlider)
        greenColorTextField.text = string(greenSlider)
        blueColorTextField.text = string(blueSlider)
        
        redSliderValue.text = string(redSlider)
        greenSliderValue.text = string(greenSlider)
        blueSliderValue.text = string(blueSlider)
    }
    
    private func setGeneralSettings() {
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
