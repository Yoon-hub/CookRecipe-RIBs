//
//  RootRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

open class CustomTextField: UITextField {
    
    let placeholderText: String
    
    public init(placeHolderText: String) {
        self.placeholderText = placeHolderText
        super.init(frame: .zero)
        
        configure()
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
        setLeftPaddingPoints(15)
        autocapitalizationType = .none
        self.placeholder = placeholderText

    }
}
