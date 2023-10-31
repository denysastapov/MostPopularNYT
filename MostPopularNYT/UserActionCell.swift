//
//  UserActionCell.swift
//  MostPopularNYT
//
//  Created by Denys Astapov on 22.05.2021.
//

import UIKit

class UserActionCell: UICollectionViewCell {
    let userActionLabel: UILabel = {
        let userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        return userLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserActionLabel()
    }
    // MARK: required init - чому вони потрібні?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUserActionLabel()
    }

    private func setupUserActionLabel() {
        addSubview(userActionLabel)

        userActionLabel.backgroundColor = .systemBlue
        userActionLabel.textAlignment = .center
        userActionLabel.textColor = .white
        userActionLabel.font = .boldSystemFont(ofSize: 24)
        userActionLabel.clipsToBounds = true
        userActionLabel.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
        userActionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        userActionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        userActionLabel.topAnchor.constraint(equalTo: topAnchor),
        userActionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

