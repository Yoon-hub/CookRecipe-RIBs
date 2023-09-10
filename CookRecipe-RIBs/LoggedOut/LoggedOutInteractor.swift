//
//  LoggedOutInteractor.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs
import RxSwift
import KeychainSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToRegist()
    func dismissCurrentRIB()
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func showAlert(title: String, message: String)
    func showAlert(title: String, message: String, completionHandler: (() -> Void)?)
}

protocol LoggedOutListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didlogin(id: String, pw: String)
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?
    
    let keychain = KeychainSwift()

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
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
    
    func regist() {
        router?.routeToRegist()
    }
    
    func dismissCurrentRIB() {
        router?.dismissCurrentRIB()
    }
    
    func login(id: String?, pw: String?) {
        guard let id, let pw else {return}
        if let storedPw = keychain.get(id), storedPw == pw {
            presenter.showAlert(title: "로그인 성공", message: "환영합니다.") { [weak self] in
                self?.listener?.didlogin(id: id, pw: pw)
            }
        } else {
            presenter.showAlert(title: "로그인 실패", message: "아이디와 비밀번호를 확인해 주세요")
        }
    }
}
