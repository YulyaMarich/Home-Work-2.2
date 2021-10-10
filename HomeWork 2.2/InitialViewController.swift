//
//  InitialViewController.swift
//  HomeWork 2.2
//
//  Created by Julia on 28.09.2021.
//

import UIKit

class InitialViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSettingVC = segue.destination as! ColorSettingViewController
        colorSettingVC.delegate = self
        colorSettingVC.changedcolorView = view.backgroundColor ?? .white
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

extension InitialViewController: BackroundColorDelegate {
    func changeColor(_ color: UIColor) {
        view.backgroundColor = color
        
    }
}
