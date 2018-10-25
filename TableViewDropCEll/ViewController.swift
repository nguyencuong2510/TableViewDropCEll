//
//  ViewController.swift
//  TableViewDropCEll
//
//  Created by admin on 10/24/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import UIKit

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbTableView: UITableView!
    var index = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbTableView.delegate = self
        tbTableView.dataSource = self
        
        tbTableView.register(UINib(nibName: TableViewCell.className, bundle: nibBundle), forCellReuseIdentifier: TableViewCell.className)
        
        tbTableView.estimatedRowHeight = 100
        tbTableView.rowHeight = UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.className, for: indexPath) as! TableViewCell
        cell.isShow = index.contains(indexPath) ? true : false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell1 = tableView.cellForRow(at: indexPath) as? TableViewCell else { return }
        tableView.beginUpdates()
        cell1.isShow = cell1.isShow ? false : true
        tableView.endUpdates()
        if index.contains(indexPath) {
            print(index.firstIndex(of: indexPath) ?? 0)
            index.remove(at: index.firstIndex(of: indexPath) ?? 0)
        } else {
            index.append(indexPath)
        }
    }
}

