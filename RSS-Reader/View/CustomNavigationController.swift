//
//  CustomNavigationController.swift
//  RSS-Reader
//
//  Created by MBAir on 12/8/21.
//

import UIKit

class CustomNavigationController: UINavigationController {
    //MARK:- Controller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK:- Setup UI
    func setupUI() {
        self.navigationBar.tintColor = .black
    }
}
