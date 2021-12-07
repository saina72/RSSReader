//
//  UITableView_Extension.swift
//  RSS-Reader
//
//  Created by MBAir on 12/5/21.
//
import Foundation
import UIKit

public extension UITableView {
    
    //MARK:- Registers tableViewCell
    func register(nibName: String) {
        register(nibName: nibName, withReuseIdentifier: nibName)
    }
    
    func register(nibName: String, withReuseIdentifier: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: nibName)
    }
    
}

