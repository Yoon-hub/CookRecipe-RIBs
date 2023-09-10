//
//  RootRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

import SnapKit
import Then

final class LoggedOutView: UIView {
    
    let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "요리\n   조리법"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = UIColor(named: "mainColor")
    }
    
    let idTextField = CustomTextField(placeHolderText: "이메일")
    let pwTextField = CustomTextField(placeHolderText: "비밀번호")
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor(named: "mainColor")
        $0.layer.cornerRadius = 10
    }
    
    let registButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setTitleColor(.systemGray, for: .normal)
        $0.setTitle("회원가입", for: .normal)
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
        [titleLabel, idTextField, pwTextField, loginButton, registButton].forEach { self.addSubview($0) }
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
        
        loginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
    
        registButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(24)
        }
        
    }
}
