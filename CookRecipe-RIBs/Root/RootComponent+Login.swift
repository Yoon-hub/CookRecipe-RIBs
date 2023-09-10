//
//  RootComponent+Login.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the Login scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLogin: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the Login scope.
}

extension RootComponent: LoginDependency {
    var LoginViewController: LoginViewControllable {
        return rootViewController
    }

    // TODO: Implement properties to provide for Login scope.
}
