//
//  UIStoryBoard_Extension.swift
//  RSS-Reader
//
//  Created by MBAir on 12/7/21.
//

import UIKit

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    
    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardInitiable {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Could not instantiate \(T.storyboardIdentifier)")
        }
        return viewController
    }
}
