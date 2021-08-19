//
//  ViewController.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
