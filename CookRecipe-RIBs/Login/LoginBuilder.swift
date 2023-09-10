//
//  LoginBuilder.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

protocol LoginDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var LoginViewController: LoginViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class LoginComponent: Component<LoginDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var LoginViewController: LoginViewControllable {
        return dependency.LoginViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {

    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoginListener) -> LoginRouting {
        let component = LoginComponent(dependency: dependency)
        let interactor = LoginInteractor()
        interactor.listener = listener
        return LoginRouter(interactor: interactor, viewController: component.LoginViewController)
    }
}
