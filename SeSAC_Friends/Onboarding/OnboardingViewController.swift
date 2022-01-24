//
//  OnboardingViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/23.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    var slides: [OnboardingSlide] = []

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                startButton.setTitle("시작하기", for: .normal)
            } else {
                startButton.setTitle("다음", for: .normal)
            }
        }
    }

    let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.brandColor(.green)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(UIColor.brandColor(.white), for: .normal)
        button.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
     }()
    // 색 그레이 5 / 블랙
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.brandColor(.black)
        pageControl.pageIndicatorTintColor = UIColor.brandColor(.gray5)
        pageControl.numberOfPages = 3
        pageControl.isEnabled = false
        return pageControl
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        setupConstraints()
        slides = [
            OnboardingSlide(description: "위치 기반으로 빠르게 주위 친구를 확인", image: UIImage(named: "onboarding_img1")!),
            OnboardingSlide(description: "관심사가 같은 친구를 찾을 수 있어요", image: UIImage(named: "onboarding_img2")!),
            OnboardingSlide(description: "SeSAC Friends", image: UIImage(named: "onboarding_img3")!)
        ]

        startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupView() {
        [startButton, pageControl, collectionView].forEach {
            view.addSubview($0)
        }
    }

    private func setupConstraints() {

        startButton.snp.makeConstraints {
            $0.leading.equalTo(view).offset(16)
            $0.trailing.equalTo(view).offset(-16)
            $0.bottom.equalTo(view).offset(-16)
            $0.height.equalTo(48)
        }

        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(startButton.snp.top).offset(-42)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(view).offset(120)
            $0.leading.equalTo(view).offset(7)
            $0.trailing.equalTo(view).offset(-8)
            $0.bottom.equalTo(pageControl.snp.top).offset(-56)

        }
    }

    @objc private func didTapStart() {
        if currentPage == slides.count - 1 {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                let vc = UINavigationController(rootViewController: AuthPhoneNumberViewController())
                windowScene.windows.first?.rootViewController = vc
                windowScene.windows.first?.makeKeyAndVisible()
            }
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }

}
