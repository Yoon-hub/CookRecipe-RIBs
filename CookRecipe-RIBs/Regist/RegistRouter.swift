//
//  RegistRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

protocol RegistInteractable: Interactable {
    var router: RegistRouting? { get set }
    var listener: RegistListener? { get set }
}

protocol RegistViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RegistRouter: ViewableRouter<RegistInteractable, RegistViewControllable>, RegistRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: RegistInteractable, viewController: RegistViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
