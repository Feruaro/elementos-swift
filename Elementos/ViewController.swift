//
//  ViewController.swift
//  Elementos
//
//  Created by Fernanda Ayres Ruaro on 25/03/25.
//

import UIKit

class MyTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBarController()
    }
    
    private func setUpTabBarController() {
        let telaSwitch = UINavigationController(rootViewController: SwitchViewController())
        let telaSlider = UINavigationController(rootViewController: SliderViewController())
        let telaProgress = UINavigationController(rootViewController: ProgressViewController())
        let telaStepper = UINavigationController(rootViewController: StepperViewController())
        let telaTableView = UINavigationController(rootViewController: TableViewViewController())
        
        self.setViewControllers([telaSwitch, telaSlider, telaProgress, telaStepper, telaTableView], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = self.tabBar.items else {return}
        self.setUpItemsTabBar(items)
        
        
    }
    
    private func setUpItemsTabBar(_ items: [UITabBarItem]) {
        let titulos = ["Switch", "Slider", "Progress", "Stepper", "TableView"]
        let images = ["back", "search", "usuario", "ajuste", "lixeira"]
        
        for item in items {
            guard let index = items.firstIndex(of: item) else { continue }
            item.title = titulos[index]
            item.image = UIImage(named: images[index])
        }
    }
    
}
