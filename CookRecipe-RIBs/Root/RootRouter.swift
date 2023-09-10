//
//  RootRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener, LoginListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // view 계층 그리니까 화면이동 하는 곳
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, loggedOutBuilder: LoggedOutBuildable,  loginBuilder: LoginBuildable) {
        
        self.loggedOutBuilder = loggedOutBuilder
        self.loginBuilder = loginBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // loggetOut
    private let loggedOutBuilder: LoggedOutBuildable
    private let loginBuilder: LoginBuildable
    
    private var currentChild: ViewableRouting?
    
    override func didLoad() {
        routeToLoggedOut()
    }
    
    func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.currentChild = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
    
    func routeToLogin(id: String, pw: String) {
        dismissCurrentRIB()
        
        let login = loginBuilder.build(withListener: interactor)
        attachChild(login)
        
    }
    
    func dismissCurrentRIB() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
        currentChild = nil
    }
}
