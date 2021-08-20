//
//  NewsItemViewController.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import UIKit

class NewsItemViewController: UIViewController {

    var indexPathForSelectedNewsItem: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(indexPathForSelectedNewsItem ?? IndexPath())
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
