//
//  SliderViewController.swift
//  Elementos
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

class SliderViewController: UIViewController {
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .systemBlue
        slider.addTarget(self, action: #selector(self.tappedSlider), for: .touchUpInside)
        return slider
    }()
    
    lazy var minimumValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "0"
        return label
    }()
    
    lazy var maximumValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "100"
        return label
    }()
    
    @objc func tappedSlider(_ sender: UISlider) {
        let alpha = CGFloat(sender.value) / 100
        self.view.backgroundColor = UIColor(red: 0, green: 206/255, blue: 209/255, alpha: alpha)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 206/255, blue: 209/255, alpha: 0)
        self.view.addSubview(self.slider)
        self.view.addSubview(self.minimumValueLabel)
        self.view.addSubview(self.maximumValueLabel)
        self.setUpConsraints()
    }
    
    private func setUpConsraints() {
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 64),
            slider.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
            
            minimumValueLabel.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 0),
            minimumValueLabel.leadingAnchor.constraint(equalTo: self.slider.leadingAnchor),
            
            maximumValueLabel.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 0),
            maximumValueLabel.trailingAnchor.constraint(equalTo: self.slider.trailingAnchor),
        ])
    }
}
