//
//  PostsTableVC.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit
import Alamofire

class PostsTableVC: UITableViewController {
    
    private static let mostViewedURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private static let mostSharedURL = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private static let mostEmailedURL = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private var posts: [PostDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()

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
        guard let urlMostEmailed = URL(string: PostsTableVC.mostViewedURL) else { return }
        
        request(urlMostEmailed).responseJSON { responseJSON in
            print(responseJSON)
        }
    }
    
    func fetchDataMostShared(){
        guard let urlMostShared = URL(string: PostsTableVC.mostViewedURL) else { return }
        
        request(urlMostShared).responseJSON { responseJSON in
            print(responseJSON)
        }
    }
}
