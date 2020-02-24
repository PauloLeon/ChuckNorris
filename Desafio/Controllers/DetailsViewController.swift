//
//  DetailsViewController.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage


class DetailsViewController: UIViewController, StoryboardInstantiable {
        
    var chosenCategory: String?
    
    let detailsViewModel = DetailsViewModel()
    let disposeBag = DisposeBag()
    let kCornerButton: CGFloat = 8.0
    let kImagePlaceholder = "LogoLaunch"
    
    @IBOutlet weak var imageJoke: UIImageView!
    @IBOutlet weak var labelJoke: UILabel!
    @IBOutlet weak var linkButtonJoke: UIButton! {
        didSet {
            linkButtonJoke.layer.cornerRadius = kCornerButton
            linkButtonJoke.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        setupAccessibility()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
    }
                    
    private func setupNavigationBar() {
        guard let titleNavigation = chosenCategory else { return }
        title = titleNavigation.capitalizingFirstLetter()
    }
    
    private func bindUI() {
        LoadingView.showActivityIndicatory(view: view)
        
        linkButtonJoke.rx.tap.bind {
            self.openURL()
        }.disposed(by: disposeBag)
        
        detailsViewModel.joke.asObservable().subscribe(onNext: { _ in
            self.imageJoke.sd_setImage(with: URL(string: self.detailsViewModel.getImageJoke()), placeholderImage: UIImage(named: self.kImagePlaceholder))
            self.labelJoke.text = self.detailsViewModel.getTextJoke()
        }).disposed(by: disposeBag)
        
        detailsViewModel.isLoadingFinish.asObservable().subscribe(onNext: { value in
            if value {
                LoadingView.stopActivityIndicator(view: self.view)
            }
        }).disposed(by: disposeBag)

        if let category = chosenCategory {
            detailsViewModel.getJoke(category: category)
        }

    }
    
    private func setupAccessibility() {
        imageJoke.isAccessibilityElement = false
        labelJoke.isAccessibilityElement = true
        linkButtonJoke.isAccessibilityElement = true
        
        guard let navController = navigationController,
            let titleNavBar = navController.navigationBar.topItem else {
                accessibilityElements = [labelJoke as Any, linkButtonJoke as Any]
            return
        }
        
        titleNavBar.accessibilityTraits = .header
        accessibilityElements = [navController.navigationItem.backBarButtonItem as Any, titleNavBar, labelJoke as Any, linkButtonJoke as Any]
    }
    
    private func openURL() {
        guard let url = URL(string: self.detailsViewModel.getUrlJoke()) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

}
