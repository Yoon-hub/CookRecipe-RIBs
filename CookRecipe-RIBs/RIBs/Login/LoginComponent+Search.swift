//
//  LoginComponent+Search.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

/// The dependencies needed from the parent scope of Login to provide for the Search scope.
// TODO: Update LoginDependency protocol to inherit this protocol.
protocol LoginDependencySearch: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Login to provide dependencies
    // for the Search scope.
}

extension LoginComponent: SearchDependency {

    // TODO: Implement properties to provide for Search scope.
}
