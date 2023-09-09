//
//  RegistViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//
import UIKit

import RIBs
import RxSwift
import RxCocoa
import RxKeyboard

protocol RegistPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func touchRegistButton(id: String, pw: String)
    func checkValidation(id: String?, pw: String?, pwCheck: String?) -> Bool
}

final class RegistViewController: CommonViewController, RegistPresentable, RegistViewControllable {
    
    weak var listener: RegistPresentableListener?
    
    let registView = RegistView()
    
    override func loadView() {
        self.view = registView
    }
    
    override func setUI() {
        [registView.idTextField, registView.pwTextField, registView.pwCheckTextField].forEach { textFieldConfigure($0) }
    }
    
    override func rxSet() {
        touchEvent()
    }
}

//MARK: UI
extension RegistViewController {
    
    private func rxKeyBoardConfigure() {
        RxKeyboard.instance.visibleHeight
            .drive { [weak self] keyBoardHeight in
                guard let self else {return}
                self.registView.registButton.snp.updateConstraints {
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

//MARK: - Rx
extension RegistViewController {
    
    private func touchEvent() {
        registView.registButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                guard let valid = vc.listener?.checkValidation(id: vc.registView.idTextField.text, pw: vc.registView.pwTextField.text, pwCheck: vc.registView.pwCheckTextField.text) else {return}
                
                valid ? vc.listener?.touchRegistButton(id: vc.registView.idTextField.text!, pw: vc.registView.pwTextField.text!) : nil
            }
            .disposed(by: disposeBag)
    }
    
}
