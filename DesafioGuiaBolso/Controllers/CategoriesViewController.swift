//
//  ViewController.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol CategoriesViewControllerDelegate: class {
  func CategoriesViewControllerDidSelectChosenCategory(_ chosenCategory: String)
}

class CategoriesViewController: UIViewController, StoryboardInstantiable {
    
    let categorieViewModel =  CategoriesViewModel()
    let disposeBag = DisposeBag()
    let kReuseIdentifier = "CategorieReuseIdentifier"
    let kNavigationTitle = "Categories"
    let kTableViewCellHeight: CGFloat = 88.0
    
    weak var delegate: CategoriesViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rx.setDelegate(self).disposed(by: disposeBag)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        title = kNavigationTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func bindUI() {
        LoadingView.showActivityIndicatory(view: view)
        categorieViewModel.categories.bind(to: tableView.rx.items(cellIdentifier: kReuseIdentifier)) { row, categorie, cell in
            LoadingView.stopActivityIndicator(view: self.view)
            if let categorieCell = cell as? CategorieTableViewCell {
                categorieCell.cellCategorieConfigName = categorie
            }
            self.setupAccessibility()
        }.disposed(by: disposeBag)
        categorieViewModel.getCategories()
    }
    
    private func setupAccessibility() {
        tableView.isAccessibilityElement = true
        guard let navController = navigationController,
            let titleNavBar = navController.navigationBar.topItem else {
                accessibilityElements = [tableView as Any]
            return
        }
        titleNavBar.accessibilityTraits = .header
        accessibilityElements = [ titleNavBar, tableView as Any]
    }
    
   
}

extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorieViewModel.setChosenCategory(row: indexPath.row)
        delegate?.CategoriesViewControllerDidSelectChosenCategory(categorieViewModel.chosenCategory)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTableViewCellHeight
    }
}

