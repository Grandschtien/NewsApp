//
//  ViewController.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    private var news = News()
    private var indexPathFOrSelectedCourse: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        MainNetworkService.getNews {[weak self] news in
            self?.news = news
            self?.mainTableView.reloadData()
        }
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfArticles = news.articles?.count else {
            return 0
        }
        return countOfArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainCell else { return UITableViewCell()}
        
        guard let article = news.articles?[indexPath.row] else { return UITableViewCell() }
        cell.configurate(arcticle: article)
        return cell
    }
    
    
}
//MARK:- TableView delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPathFOrSelectedCourse = indexPath
        performSegue(withIdentifier: "newsItem", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK:- Prepare for segue

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "newsItem", let destinationVC = segue.destination as? NewsItemViewController else { return }
        destinationVC.indexPathForSelectedNewsItem = self.indexPathFOrSelectedCourse
    }
}
