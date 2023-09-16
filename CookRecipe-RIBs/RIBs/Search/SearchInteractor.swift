//
//  SearchInteractor.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift

protocol SearchRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToDetail(recipe: [String: String])
    func routeToBack()
}

protocol SearchPresentable: Presentable {
    var listener: SearchPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SearchListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SearchInteractor: PresentableInteractor<SearchPresentable>, SearchInteractable, SearchPresentableListener {

    weak var router: SearchRouting?
    weak var listener: SearchListener?
    
    let apiManager = APIManager()

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SearchPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didSelectedRecipe(recipe: [String : String]) {
        router?.routeToDetail(recipe: recipe)
    }
    
    func didBackButtonTapped() {
        router?.routeToBack()
    }
    
    
}

//MARK: - API
extension SearchInteractor {

    func requestSearchRecipe(text: String) async -> CookRecipe? {
        do {
            let result = try await apiManager.requestAPI(text: text)
            return result
            // 결과를 사용하거나 처리할 수 있습니다.
        } catch {
            // 에러 처리
            print(error)
            return nil
        }
    }

}
