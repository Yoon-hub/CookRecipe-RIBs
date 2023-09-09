//
//  LoggedOutViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa
import RxKeyboard
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func regist()
}

final class LoggedOutViewController: CommonViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    weak var listener: LoggedOutPresentableListener?
    
    let loggedOutView = LoggedOutView()
    
    override func loadView() {
        self.view = loggedOutView
    }
    
    override func setUI() {
        rxKeyBoardConfigure()
        textFieldConfigure(loggedOutView.idTextField)
        textFieldConfigure(loggedOutView.pwTextField)
    }
    
    override func rxSet() {
        touchEvent()
    }
}
//MARK: - UI
extension LoggedOutViewController {

    private func rxKeyBoardConfigure() {
        RxKeyboard.instance.visibleHeight
            .drive { [weak self] keyBoardHeight in
                guard let self else {return}
                self.loggedOutView.loginButton.snp.updateConstraints {
                    if keyBoardHeight > 0.0 {
                        $0.bottom.equalToSuperview().inset(keyBoardHeight + 16)
                    } else {
                        $0.bottom.equalToSuperview().inset(100)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func textFieldConfigure(_ textField: UITextField) {
        textField.rx.controlEvent(.editingDidBegin)
            .withUnretained(self)
            .bind { (vc, _) in
                textField.layer.borderColor = UIColor(named: "mainColor")?.cgColor
                textField.layer.borderWidth = 1
                textField.backgroundColor = .white
            }
            .disposed(by: disposeBag)
        
        textField.rx.controlEvent(.editingDidEnd)
            .withUnretained(self)
            .bind { (vc, _) in
                textField.layer.borderWidth = 0
                textField.backgroundColor = .systemGray6
            }
            .disposed(by: disposeBag)
    }
}

//MARK: - RxSet
extension LoggedOutViewController {
    private func touchEvent() {
        loggedOutView.registButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.listener?.regist()
            }
            .disposed(by: disposeBag)
            
    }
}
