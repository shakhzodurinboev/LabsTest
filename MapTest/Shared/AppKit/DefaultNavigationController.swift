//
//  DefaultNavigationController.swift
//  MapTest
//
//  Created by shakhzodurinboev on 24/09/21.
//

import UIKit

class DefaultNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = Colors.background
        setNav()
    }
    
}

extension UINavigationController: UINavigationControllerDelegate{
    func setNav(color:UIColor = Colors.black,backColor:UIColor = Colors.background,trasncluent:Bool = false) {
        let font = Fonts.montserrat_semiBold.withSize(16)
        navigationBar.isTranslucent = trasncluent
        navigationBar.tintColor = color
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: font]
            navBarAppearance.shadowImage = UIImage()
            navBarAppearance.backgroundColor = backColor
            navBarAppearance.shadowColor = .clear
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        }else{
            navigationBar.barTintColor = backColor
            navigationBar.backgroundColor = backColor
            navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor:color, NSAttributedString.Key.font: font]
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .never
        }
    }
}

