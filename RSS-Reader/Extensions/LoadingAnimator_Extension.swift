//
//  Extensions.swift
//  RSS-Reader
//
//  Created by MBAir on 12/4/21.
//

import UIKit

extension loadingAnimator where Self: UIViewController {
    func startAnimating() {
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.style = .large
        loadingIndicator.color = .black
        loadingIndicator.backgroundColor = .clear
        loadingIndicator.restorationIdentifier = "loadingView"
        loadingIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        loadingIndicator.frame = CGRect(x: (UIScreen.main.bounds.width-100)/2, y: (UIScreen.main.bounds.height-100)/2, width: 100, height: 100)
        view.addSubview(loadingIndicator)
        view.insertSubview(loadingIndicator, at: 3)
        loadingIndicator.startAnimating()
        loadingIndicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
    }
    
    func stopAnimating() {
        for item in view.subviews
        where item.restorationIdentifier == "loadingView" {
            UIView.animate(withDuration: 0.3, animations: {
                item.alpha = 0
            }) { (_) in
                item.removeFromSuperview()
                
            }
        }
    }
}


