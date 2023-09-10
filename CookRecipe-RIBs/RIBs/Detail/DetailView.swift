//
//  DetailView.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import UIKit

import SnapKit
import Then

final class DetailView: UIView {
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .white
        [imageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.height.equalTo(2000)
            $0.width.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
    
    }
}

