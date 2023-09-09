//
//  RegistInteractor.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs
import RxSwift

protocol RegistRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RegistPresentable: Presentable {
    var listener: RegistPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RegistListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RegistInteractor: PresentableInteractor<RegistPresentable>, RegistInteractable, RegistPresentableListener {

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
}
