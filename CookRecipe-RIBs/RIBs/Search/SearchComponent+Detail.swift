//
//  SearchComponent+Detail.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs

/// The dependencies needed from the parent scope of Search to provide for the Detail scope.
// TODO: Update SearchDependency protocol to inherit this protocol.
protocol SearchDependencyDetail: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Search to provide dependencies
    // for the Detail scope.
}

extension SearchComponent: DetailDependency {

}
