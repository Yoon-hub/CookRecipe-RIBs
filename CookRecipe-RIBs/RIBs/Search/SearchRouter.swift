//
//  SearchRouter.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

protocol SearchInteractable: Interactable, DetailListener {
    var router: SearchRouting? { get set }
    var listener: SearchListener? { get set }
}

protocol SearchViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func push(viewController: ViewControllable)
}

final class SearchRouter: ViewableRouter<SearchInteractable, SearchViewControllable>, SearchRouting {
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SearchInteractable, viewController: SearchViewControllable, detailBuilder: DetailBuildable) {
        self.detailBuilder = detailBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    private let detailBuilder: DetailBuildable
    
    func routeToDetail(recipe: [String : String]) {
        let detail = detailBuilder.build(withListener: interactor, recipe: recipe)
        attachChild(detail)
        viewController.push(viewController: detail.viewControllable)
    }
}
