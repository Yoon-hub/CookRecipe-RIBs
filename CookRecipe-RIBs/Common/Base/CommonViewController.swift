//
//  CommonViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

import RIBs
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
    
    func push(viewController: ViewControllable) {
        navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, completionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler?() // completionHandler가 제공되면 실행
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

