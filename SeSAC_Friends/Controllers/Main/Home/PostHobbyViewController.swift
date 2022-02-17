//
//  PostHobbyViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/02/14.
//

import UIKit

class PostHobbyViewController: UIViewController {

    private let postHobbyView = PostHobbyView()
    var hf: [String] = []

    override func loadView() {
        view = postHobbyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBar()
        setSearchBar()
        print("hf: \(hf)")
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

 extension PostHobbyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     func numberOfSections(in collectionView: UICollectionView) -> Int {
         2
     }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hf.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HobbyCollectionViewCell.reuseIdentifier, for: indexPath) as! HobbyCollectionViewCell
        if indexPath.section == 0 {
            cell.label.text = hf[indexPath.row]
            return cell
        } else {
            cell.label.text = hf[indexPath.row]
            return cell
        }

    }

     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SubjectCollectionReusableView.identifier, for: indexPath) as! SubjectCollectionReusableView
         header.configure()
         header.label.text = "지금 주변에는"
         return header
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.size.width, height: 18)
     }

 }
