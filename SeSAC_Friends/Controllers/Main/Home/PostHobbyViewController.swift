//
//  PostHobbyViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/14.
//

import UIKit

class PostHobbyViewController: UIViewController {

    private let postHobbyView = PostHobbyView()

    override func loadView() {
        view = postHobbyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBar()
        setSearchBar()
        postHobbyView.collectionView.delegate = self
        postHobbyView.collectionView.dataSource = self
    }

    private func setNavigationBar() {
        let backImage = UIImage(named: "arrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.tintColor = UIColor.brandColor(.black)
    }

    private func setSearchBar() {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: width - 28, height: 0))
        searchBar.placeholder = "띄어쓰기로 복수 입력이 가능해요"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)

    }

}

extension PostHobbyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
