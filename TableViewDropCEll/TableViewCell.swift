//
//  TableViewCell.swift
//  TableViewDropCEll
//
//  Created by admin on 10/24/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var contrain1: NSLayoutConstraint!
    @IBOutlet weak var contrain2: NSLayoutConstraint!
    
    @IBOutlet weak var numberAnswear: UILabel!
    @IBOutlet weak var answear: UILabel!
    
    
    var isShow: Bool = false {
        didSet {
            if isShow {
                contrain1.priority = .defaultLow
                contrain2.priority = .defaultHigh
                UIView.animate(withDuration: 0.2, animations: {
                    self.answear.alpha = 1
                    self.numberAnswear.alpha = 1
                }) { (_) in
                    self.answear.isHidden = false
                    self.numberAnswear.isHidden = false
                }
            } else {
                contrain1.priority = .defaultHigh
                contrain2.priority = .defaultLow
                    self.answear.alpha = 0
                    self.numberAnswear.alpha = 0
                self.answear.isHidden = true
                self.numberAnswear.isHidden = true
                
            }
        }
    }
    
    override func prepareForReuse() {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
