//
//  storyboardInitiable.swift
//  RSS-Reader
//
//  Created by MBAir on 12/7/21.
//

import UIKit

extension StoryboardInitiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
