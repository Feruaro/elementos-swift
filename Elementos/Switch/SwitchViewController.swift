//
//  SwitchViewController.swift
//  Elementos
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

class SwitchViewController: UIViewController {
    
    lazy var checkSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.isOn = false //estado inicial
        switchView.onTintColor = .systemBlue
        switchView.addTarget(self, action: #selector(self.tappedSwitch), for: .touchUpInside)
        return switchView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    @objc func tappedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.label.text = "on"
            self.label.textColor = .white
            
            self.view.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1.0)
        } else {
            self.label.text = "off"
            self.label.textColor = .black
            
            self.view.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 1, alpha: 1.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.checkSwitch)
        self.view.addSubview(self.label)
        self.setUpConsraints()
        self.tappedSwitch(self.checkSwitch)
    }
    
    private func setUpConsraints() {
        NSLayoutConstraint.activate([
            checkSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            checkSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.checkSwitch.bottomAnchor, constant: 10)
        ])
    }
}
