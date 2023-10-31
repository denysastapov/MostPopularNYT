//
//  PostViewCell.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit
import Alamofire

class PostViewCell: UITableViewCell {

    let postImage: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        let postTitle: UILabel = {
            let labelTitle = UILabel()
            labelTitle.translatesAutoresizingMaskIntoConstraints = false
            return labelTitle
        }()

        let postAbstract: UILabel = {
            let labelAbstract = UILabel()
            labelAbstract.translatesAutoresizingMaskIntoConstraints = false
            return labelAbstract
        }()
    // MARK: пояснити цю частину пліз???
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            addSubview(postImage)
            addSubview(postTitle)
            addSubview(postAbstract)

            NSLayoutConstraint.activate([
                postImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                postImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                postImage.widthAnchor.constraint(equalToConstant: 75),
                postImage.heightAnchor.constraint(equalToConstant: 75),
                
                postTitle.topAnchor.constraint(equalTo: postImage.topAnchor),
                postTitle.leadingAnchor.constraint(equalTo: postImage.trailingAnchor, constant: 10),
                postTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

                postAbstract.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 5),
                postAbstract.leadingAnchor.constraint(equalTo: postImage.trailingAnchor, constant: 10),
                postAbstract.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                postAbstract.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10)
            ])
            postTitle.font = .systemFont(ofSize: 18, weight: .bold)
            postTitle.numberOfLines = 0
            
            postAbstract.numberOfLines = 0
            
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func configureCell(with result: PostDTO) {
        postTitle.text = result.title
        postAbstract.text = result.abstract
        
        // MARK: пояснити цю частину пліз???
        if let imageURL = result.media.first?.mediaMetadata.first?.url, let url = URL(string: imageURL) {
            Alamofire.request(url).responseData { response in
                switch response.result {
                case .success(let data):
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.postImage.image = image
                        }
                    }
                case .failure(let error):
                    print("Failed to load image: \(error)")
                }
            }
        }
    }

}
