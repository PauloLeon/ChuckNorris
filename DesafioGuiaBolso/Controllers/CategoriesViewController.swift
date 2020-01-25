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
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
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
        categorieViewModel.categories.bind(to: tableView.rx.items(cellIdentifier: kReuseIdentifier)) { row, model, cell in
                self.categorieViewModel.configTableViewCell(cell: cell, categorie: model)
            }.disposed(by: disposeBag)
        categorieViewModel.getCategories()
    }
    
    private func showActivityIndicatory(view: UIView) {
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.isUserInteractionEnabled = false
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func stopActivityIndicator(view: UIView) {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
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

