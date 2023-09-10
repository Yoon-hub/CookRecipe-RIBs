//
//  DetailBuilder.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

protocol DetailDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class DetailComponent: Component<DetailDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    let recipe: [String: String]
    
    init(dependency: DetailDependency, recipe: [String: String]) {
        self.recipe = recipe
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol DetailBuildable: Buildable {
    func build(withListener listener: DetailListener, recipe: [String: String]) -> DetailRouting
}

final class DetailBuilder: Builder<DetailDependency>, DetailBuildable {

    override init(dependency: DetailDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DetailListener, recipe: [String: String]) -> DetailRouting {
        let component = DetailComponent(dependency: dependency, recipe: recipe)
        let viewController = DetailViewController()
        let interactor = DetailInteractor(presenter: viewController)
        interactor.recipe = recipe
        interactor.listener = listener
        return DetailRouter(interactor: interactor, viewController: viewController)
    }
}
