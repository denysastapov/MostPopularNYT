//
//  MainCollectionViewController.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit

enum UserActions: String, CaseIterable{
    case mostViewed = "Most Viewed Posts"
    case mostEmailed = "Most Emailed Posts"
    case mostShared = "Most Shared Posts"
}

class MainCollectionViewController: UICollectionViewController {
    
    private let userActions = UserActions.allCases
    private let reuseIdentifier = "cell"
    
    // MARK: що це за FlowLayout і чому треба створювати екземпляр класу?
    
    override func loadView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 100)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UserActionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.alwaysBounceVertical = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }
    // MARK: cast? наскільки best practices?
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    // MARK: функція prepare(for segue)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let postsVC = PostsTableVC()
            
            switch indexPath.item {
            case 0:
                postsVC.fetchDataMostViewed()
                postsVC.title = "Most Viewed Posts"
            case 1:
                postsVC.fetchDataMostEmailed()
                postsVC.title = "Most Emailed Posts"
            case 2:
                postsVC.fetchDataMostShared()
                postsVC.title = "Most Shared Posts"
            default:
                break
            }
            
            self.navigationController?.show(postsVC, sender: self)
    }
}
