//
//  PostsTableVC.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit
import Alamofire
import SafariServices

class PostsTableVC: UITableViewController {
    
    private static let mostViewedURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private static let mostSharedURL = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private static let mostEmailedURL = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private var posts: [PostDTO] = []
    // MARK: реестрація cell і для collection  і для table???
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PostViewCell.self, forCellReuseIdentifier: "postCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostViewCell

        let post = posts[indexPath.row]
        cell.configureCell(with: post)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPost = posts[indexPath.row]
        
        if let url = URL(string: selectedPost.url) {
            let safariViewController = SFSafariViewController(url: url)
            navigationController?.pushViewController(safariViewController, animated: true)
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    // MARK: повторюються функції, чи можна уникнути?
    func fetchDataMostViewed(){
        guard let urlMostViewed = URL(string: PostsTableVC.mostViewedURL) else { return }
        
        request(urlMostViewed).validate().responseData { response in
            
            switch response.result {
            case .success(let value):
                do {
                    self.posts = try JSONDecoder().decode(ResponseDTO.self, from: value).posts
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchDataMostEmailed(){
        guard let urlMostEmailed = URL(string: PostsTableVC.mostEmailedURL) else { return }
        
        request(urlMostEmailed).validate().responseData { response in
            
            switch response.result {
            case .success(let value):
                do {
                    self.posts = try JSONDecoder().decode(ResponseDTO.self, from: value).posts
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDataMostShared(){
        guard let urlMostShared = URL(string: PostsTableVC.mostSharedURL) else { return }
        
        request(urlMostShared).validate().responseData { response in
            
            switch response.result {
            case .success(let value):
                do {
                    self.posts = try JSONDecoder().decode(ResponseDTO.self, from: value).posts
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
