//
//  StepperViewController.swift
//  Elementos
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

class StepperViewController: UIViewController {
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = String(Int(self.stepper.value))
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 50
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.addTarget(self, action: #selector(self.actionStepper), for: .touchUpInside)
        return stepper
    }()
    
    @objc func actionStepper(_ sender: UIStepper) {
        self.valueLabel.text = String(Int(sender.value))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        self.view.addSubview(stepper)
        self.view.addSubview(valueLabel)
        self.setUpConsraints()
    }
    
    private func setUpConsraints() {
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            stepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stepper.centerYAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 20),
        ])
    }
}
