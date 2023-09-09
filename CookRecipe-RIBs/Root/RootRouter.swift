//
//  RootRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // view 계층 그리니까 화면이동 하는 곳
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuilder: LoggedOutBuildable) {
        
        self.loggedOutBuilder = loggedOutBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // loggetOut
    private let loggedOutBuilder: LoggedOutBuildable
    private var loggedOut: ViewableRouting?
    
    override func didLoad() {
        routeToLoggedOut()
    }
    
    func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
}
