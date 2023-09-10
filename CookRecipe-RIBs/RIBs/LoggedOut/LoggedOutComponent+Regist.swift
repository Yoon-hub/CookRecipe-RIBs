//
//  LoggedOutComponent+Regist.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/09.
//

import RIBs

/// The dependencies needed from the parent scope of LoggedOut to provide for the Regist scope.
// TODO: Update LoggedOutDependency protocol to inherit this protocol.
protocol LoggedOutDependencyRegist: Dependency {
    // TODO: Declare dependencies needed from the parent scope of LoggedOut to provide dependencies
    // for the Regist scope.
}

extension LoggedOutComponent: RegistDependency {

    // TODO: Implement properties to provide for Regist scope.
}
