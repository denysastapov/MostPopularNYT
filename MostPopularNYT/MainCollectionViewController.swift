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

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let choosedCase = userActions[indexPath.item]
        
        switch choosedCase {
        case .mostViewed:
            performSegue(withIdentifier: "viewedPosts", sender: self)
        case .mostEmailed:
            performSegue(withIdentifier: "emailedPosts", sender: self)
        case .mostShared:
            performSegue(withIdentifier: "sharedPosts", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let postsVC = segue.destination as! PostsTableVC
        
        switch segue.identifier {
        case "viewedPosts":
            postsVC.fetchDataMostViewed()
        case "emailedPosts":
            postsVC.fetchDataMostEmailed()
        case "sharedPosts":
            postsVC.fetchDataMostShared()
        default: break
        }
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
    
}
