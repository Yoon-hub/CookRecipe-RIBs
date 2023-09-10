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

    let imageView = UIImageView().then {
        $0.backgroundColor = .systemGray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        
    }
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 23)
    }
    
    let label = UILabel().then {
        $0.text = "식재료"
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    var scrollViewInitContentOffsetY: CGFloat?
    
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
        [imageView, titleLabel].forEach {
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
            $0.top.equalTo(contentView.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(24)
        }
    }
    
    func scrollViewDidScroll() {
        
        let offsetY = -(scrollView.contentOffset.y)
        
        guard let scrollViewInitContentOffsetY = scrollViewInitContentOffsetY else {return}
        
        if offsetY > -scrollViewInitContentOffsetY { // 수정 할 부분
            imageView.snp.remakeConstraints {
                $0.top.equalTo(contentView.snp.top).offset(-(offsetY + scrollViewInitContentOffsetY))
                $0.horizontalEdges.equalToSuperview().inset(-(offsetY + scrollViewInitContentOffsetY))
                $0.height.equalTo(300 + (offsetY + scrollViewInitContentOffsetY))
            }
        }
        
        
    }
}

