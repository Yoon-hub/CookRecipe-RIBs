//
//  LoginInteractor.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift

protocol LoginRouting: Routing {
    func cleanupViews()
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoginListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LoginInteractor: Interactor, LoginInteractable {

    weak var router: LoginRouting?
    weak var listener: LoginListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init() {}

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()

        router?.cleanupViews()
        // TODO: Pause any business logic.
    }
}
