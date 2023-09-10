//
//  SearchView.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import UIKit

import SnapKit

final class SearchView: UIView {
    
    let searchBar = UISearchBar()
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "요리\n   조리법"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = UIColor(named: "mainColor")
    }
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.compositionalLayout())
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    
    private func configure() {
        self.backgroundColor = .white
        [searchBar, titleLabel, collectionView].forEach { self.addSubview($0)}
    }
    
    private func setConstraints() {
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(searchBar.snp.top).offset(-12)
        }
        
        searchBar.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.leading.trailing.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func compositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}
