//
//  CommonViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

import RxSwift

protocol CommonViewControllerBehavior {
    func setUI()
    func rxSet()
    var disposeBag: DisposeBag {get}
}

class CommonViewController: UIViewController, CommonViewControllerBehavior {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        setUI()
        rxSet()
    }
    
    func setUI() {}
    func rxSet() {}
}

