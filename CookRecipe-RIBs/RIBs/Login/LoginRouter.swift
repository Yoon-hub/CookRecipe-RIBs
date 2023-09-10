//
//  LoginRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

protocol LoginInteractable: Interactable, SearchListener {
    var router: LoginRouting? { get set }
    var listener: LoginListener? { get set }
}

protocol LoginViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
    func present(viewController: ViewControllable)
}

final class LoginRouter: Router<LoginInteractable>, LoginRouting {
    
    private let searchBuilder: SearchBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoginInteractable, viewController: LoginViewControllable, searchBuilder: SearchBuildable) {
        self.viewController = viewController
        self.searchBuilder = searchBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    override func didLoad() {
        routeToSearch()
    }
    
    func routeToSearch() {
        let search = searchBuilder.build(withListener: interactor)
        attachChild(search)
        viewController.present(viewController: search.viewControllable)
    }
    

    // MARK: - Private

    private let viewController: LoginViewControllable
}
