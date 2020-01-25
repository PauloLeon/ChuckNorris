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

    let kReuseIdentifier = "CategorieReuseIdentifier"
    let kTableViewCellSegue = "segueDetail"
    let kNavigationTitle = "Categories"
    let kTableViewCellHeight: CGFloat = 88.0
    let categorieViewModel = CategoriesViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationBar()
        setupUI()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kTableViewCellSegue {
            // to-do
        }
    }
    
    private func setupNavigationBar() {
        title = kNavigationTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setupUI() {
        categorieViewModel.categories.bind(to: tableView.rx.items(cellIdentifier: kReuseIdentifier)) { row, model, cell in
                self.categorieViewModel.configTableViewCell(cell: cell, joke: model)
        }.disposed(by: disposeBag)
        
        categorieViewModel.getCategories()
    }
}

extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: kTableViewCellSegue, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kTableViewCellHeight
    }
}

