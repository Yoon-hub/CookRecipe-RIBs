//
//  RegistInteractor.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs
import RxSwift
import KeychainSwift

enum registError {
    static let empty = "빈칸을 모두 채워주세요"
    static let pwCheck = "비밀번호가 일치하지 않습니다"
}

protocol RegistRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RegistPresentable: Presentable {
    var listener: RegistPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func showAlert(title: String, message: String)
    func showAlert(title: String, message: String, completionHandler: (() -> Void)?)
    func popViewController()
}

protocol RegistListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func dismissCurrentRIB()
}

final class RegistInteractor: PresentableInteractor<RegistPresentable>, RegistInteractable, RegistPresentableListener {
    
    let keychain = KeychainSwift()

    weak var router: RegistRouting?
    weak var listener: RegistListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RegistPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func touchRegistButton(id: String, pw: String) {
        keychain.set(pw, forKey: id)
        presenter.showAlert(title: "회원가입 성공", message: "회원가입에 성공하셨습니다.") { [weak self] in
           // self?.presenter.popViewController() // 음 여기서 dimiss하는게 맞나 아니면.. router에서 하는게 맞나 모르겠네
            self?.listener?.dismissCurrentRIB()
        }
    }
    
    func checkValidation(id: String?, pw: String?, pwCheck: String?) -> Bool {
        guard let id, let pw, let pwCheck else {return false}

        if id.isEmpty || pw.isEmpty || pwCheck.isEmpty {
            presenter.showAlert(title: "회원가입 실패", message: registError.empty)
            return false
        }
        
        if pw != pwCheck {
            presenter.showAlert(title: "회원가입 실패", message: registError.pwCheck)
            return false
        }
        return true
    }

}
