//
//  LoadingView.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 25/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class LoadingView {
    
    static let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let kZero: CGFloat = 0.0

    static func showActivityIndicatory(view: UIView) {
        let bounds = UIScreen.main.bounds
        activityIndicator.frame = CGRect(x: kZero, y: kZero, width: bounds.size.width, height: bounds.size.height);
        activityIndicator.backgroundColor = UIColor.getBackgroundColorForLoading()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.isUserInteractionEnabled = false
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
       
    static func stopActivityIndicator(view: UIView) {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
