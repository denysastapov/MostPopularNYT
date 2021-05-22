//
//  PostsTableVC.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit
import Alamofire

class PostsTableVC: UITableViewController {
    
    private var mostViewedURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private var mostSharedURL = "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private var mostEmailedURL = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=yJGSH39dJ6BebKaopA4ytH1HtjN2zRHU"
    
    private var posts: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostViewCell

        let post = posts[indexPath.row]
        cell.configureCell(with: post)

        return cell
    }
    
//    func fetchDataMostViewed(){
//        guard let urlMostViewed = URL(string: mostViewedURL) else { return }
//
//        request(urlMostViewed).validate().responseJSON { dataResponse in
//
//            switch dataResponse.result {
//                case .success(let value):
//                    self.posts = Result.getPosts(from: value)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
    func fetchDataMostViewed(){
        guard let url = URL(string: mostViewedURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Result].self, from: data)
                print(posts)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchDataMostEmailed(){
        guard let urlMostEmailed = URL(string: mostViewedURL) else { return }
        
        request(urlMostEmailed).responseJSON { responseJSON in
            print(responseJSON)
        }
    }
    
    func fetchDataMostShared(){
        guard let urlMostShared = URL(string: mostViewedURL) else { return }
        
        request(urlMostShared).responseJSON { responseJSON in
            print(responseJSON)
        }
    }
    

}
