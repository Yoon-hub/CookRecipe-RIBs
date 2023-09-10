//
//  RootRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

import SnapKit
import Then

final class RegistView: UIView {
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "회원가입"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = UIColor(named: "mainColor")
    }
    
    let idTextField = CustomTextField(placeHolderText: "이메일")
    let pwTextField = CustomTextField(placeHolderText: "비밀번호")
    let pwCheckTextField = CustomTextField(placeHolderText: "비밀번호 확인")
    
    let registButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "mainColor")
        $0.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = .white
        [titleLabel, idTextField, pwTextField, registButton, pwCheckTextField].forEach { self.addSubview($0) }
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.4)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
        
        pwCheckTextField.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
        
        registButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
        
    }
}
