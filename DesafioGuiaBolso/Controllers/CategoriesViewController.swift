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

class CategoriesViewController: UIViewController {
        
    let categorieViewModel = CategoriesViewModel()
    let disposeBag = DisposeBag()
    let kReuseIdentifier = "CategorieReuseIdentifier"
    let kTableViewCellSegue = "segueDetail"
    let kNavigationTitle = "Categories"
    let kTableViewCellHeight: CGFloat = 88.0
    
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
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kTableViewCellSegue {
            if let vc = segue.destination as? DetailsViewController {
                vc.chosenCategory = categorieViewModel.chosenCategory
            }
        }
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
                categorieCell.categorieLabel.text = categorie
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
        performSegue(withIdentifier: kTableViewCellSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTableViewCellHeight
    }
}

