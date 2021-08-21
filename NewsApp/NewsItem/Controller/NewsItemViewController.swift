//
//  NewsItemViewController.swift
//  NewsApp
//
//  Created by Егор Шкарин on 19.08.2021.
//

import UIKit


class NewsItemViewController: UIViewController {
    private enum DataStyle {
        case name
        case content
        case date
        case author
        case image
    }
    var indexPathForSelectedNewsItem: IndexPath?
    var imageUrl: String?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsImage.image = UIImage(named: "photo.fill")
        fetchName(indexPath: indexPathForSelectedNewsItem ?? IndexPath())
        fetchContent(indexPath: indexPathForSelectedNewsItem ?? IndexPath())
        fetchDate(indexPath: indexPathForSelectedNewsItem ?? IndexPath())
        fetchAuthor(indexPath: indexPathForSelectedNewsItem ?? IndexPath())
        fetchImage()
    }
    
}
//MARK:- Fetching content
extension NewsItemViewController {
    private func fetchImage() {
        NewsItemNetworkManager.dowloadImage(url: imageUrl ?? "") { image in
            DispatchQueue.main.async {
                self.newsImage.image = image ?? UIImage(named: "photo.fill")
                self.newsImage.contentMode = .scaleAspectFit
            }
        }
    }
    private func fetchName(indexPath: IndexPath) {
        NewsItemNetworkManager.getNewsItem {[weak self] news in
            DispatchQueue.main.async {
                self?.nameLabel.text = news.articles?[indexPath.row].title
            }
        }
    }
    
    private func fetchContent(indexPath: IndexPath) {
        NewsItemNetworkManager.getNewsItem {[weak self] news in
            DispatchQueue.main.async {
                self?.contentLabel.text = news.articles?[indexPath.row].content
            }
        }
    }
    private func fetchDate(indexPath: IndexPath) {
        NewsItemNetworkManager.getNewsItem {[weak self] news in
            DispatchQueue.main.async {
                guard let date = news.articles?[indexPath.row].publishedAt else { return }
                guard let upperBound = date.index(date.endIndex, offsetBy: -11, limitedBy: date.startIndex) else { return }
                self?.dateLabel.text = String(date[...upperBound])
            }
        }
    }
    private func fetchAuthor(indexPath: IndexPath) {
        NewsItemNetworkManager.getNewsItem {[weak self] news in
            DispatchQueue.main.async {
                self?.authorLabel.text = news.articles?[indexPath.row].author
            }
        }
    }

    
}
