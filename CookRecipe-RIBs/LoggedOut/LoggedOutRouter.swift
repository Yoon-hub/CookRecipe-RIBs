//
//  LoggedOutRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

protocol LoggedOutInteractable: Interactable, RegistListener {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

protocol LoggedOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func push(viewController: ViewControllable)
}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {
    
    private let registBuilder: RegistBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedOutInteractable, viewController: LoggedOutViewControllable, registBuilder: RegistBuildable) {
        self.registBuilder = registBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToRegist() {
        let regist = registBuilder.build(withListener: interactor)
        attachChild(regist)
        viewController.push(viewController: regist.viewControllable)
    }
}
