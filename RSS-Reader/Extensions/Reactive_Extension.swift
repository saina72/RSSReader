//
//  Reactive_Extension.swift
//  RSS-Reader
//
//  Created by MBAir on 12/5/21.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                vc.startAnimating()
            } else {
                vc.stopAnimating()
            }
        })
    }
    
}
