//
//  ProgressViewController.swift
//  Elementos
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var totalCountProgress = Progress(totalUnitCount: 100)
    var valueProgress: Int = 0
    
    lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        self.totalCountProgress.completedUnitCount = 0
        progress.progress = Float(totalCountProgress.fractionCompleted)
        progress.tintColor = .systemBlue
        return progress
    }()
    
    lazy var carregarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Carregar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 221/255, green: 160/255, blue: 221/255, alpha: 1.0)
        button.addTarget(self, action: #selector(actionCarregarButton), for: .touchUpInside)
        return button
    }()
    
    @objc func actionCarregarButton() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(carregarProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func carregarProgressView() {
        if valueProgress >= 100 {
            return
        }
        
        valueProgress += 1
        self.totalCountProgress.completedUnitCount = Int64(valueProgress)
        self.progressView.progress = Float(self.totalCountProgress.fractionCompleted)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1, green: 240/255, blue: 245/255, alpha: 1.0)
        self.view.addSubview(self.progressView)
        self.view.addSubview(self.carregarButton)
        self.setUpConsraints()
    }
    
    private func setUpConsraints() {
        NSLayoutConstraint.activate([
            self.progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.progressView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.progressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 64),
            self.progressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -64),
            
            self.carregarButton.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 30),
            self.carregarButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            self.carregarButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100),
        ])
    }

}
