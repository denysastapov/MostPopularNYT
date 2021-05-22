//
//  PostViewCell.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postAbstract: UILabel!
    
    func configureCell(with result: PostDTO) {
        postTitle.text = result.title
        postAbstract.text = result.abstract
        
    }

}
