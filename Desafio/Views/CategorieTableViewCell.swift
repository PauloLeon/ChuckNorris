//
//  CategorieTableViewCell.swift
//  DesafioGuiaBolso
//
//  Created by Paulo Rosa on 24/01/20.
//  Copyright © 2020 Paulo Rosa. All rights reserved.
//

import UIKit

class CategorieTableViewCell: UITableViewCell {

    @IBOutlet weak var categorieLabel: UILabel!
    
    public var cellCategorieConfigName : String? {
        didSet {
            self.categorieLabel.text = cellCategorieConfigName
            self.categorieLabel.accessibilityTraits = .staticText
            self.categorieLabel.accessibilityLabel = cellCategorieConfigName
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
