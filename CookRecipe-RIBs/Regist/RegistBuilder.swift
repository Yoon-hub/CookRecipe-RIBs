//
//  RegistBuilder.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

protocol RegistDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RegistComponent: Component<RegistDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RegistBuildable: Buildable {
    func build(withListener listener: RegistListener) -> RegistRouting
}

final class RegistBuilder: Builder<RegistDependency>, RegistBuildable {

    override init(dependency: RegistDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: RegistListener) -> RegistRouting {
        let component = RegistComponent(dependency: dependency)
        let viewController = RegistViewController()
        let interactor = RegistInteractor(presenter: viewController)
        interactor.listener = listener
        return RegistRouter(interactor: interactor, viewController: viewController)
    }
}
