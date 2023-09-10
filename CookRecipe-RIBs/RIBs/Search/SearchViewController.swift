//
//  SearchViewController.swift
//  CookRecipe-RIBs
//
//  Created by 최윤제 on 2023/09/10.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import Kingfisher

protocol SearchPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func requestSearchRecipe(text: String) async -> CookRecipe?
}

final class SearchViewController: CommonViewController, SearchPresentable, SearchViewControllable {

    weak var listener: SearchPresentableListener?
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, [String:String]>!
    
    let searchView = SearchView()
    
    override func loadView() {
        self.view = searchView
    }
    
    override func rxSet() {
        searchBarBind()
    }
    
    override func setUI() {
        cellRegiste()
    }
}

//MARK: - CollectionView
extension SearchViewController {
    private func cellRegiste() {
        let cellRegisteration = UICollectionView.CellRegistration<SearchCollcetionViewCell, [String:String]> { cell, indexPath, itemIdentifier in
            
            cell.titleLabel.text = itemIdentifier[RowDictionary.title.rawValue]
            let url = URL(string: itemIdentifier[RowDictionary.image.rawValue]!)
            cell.imageView.kf.setImage(with: url)
        }

        dataSource = UICollectionViewDiffableDataSource(collectionView: searchView.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: itemIdentifier)
            return cell
        }
    }
    
    private func updateData(cookRecipe: CookRecipe) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, [String:String]>()
        snapshot.appendSections([0])
        snapshot.appendItems(cookRecipe.cookrcp01.row)
        dataSource.apply(snapshot)
    }
}

//MARK: Rx
extension SearchViewController {
    private func searchBarBind() {
        searchView.searchBar.rx.text
            .orEmpty
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .withUnretained(self)
            .bind { (vc, text) in
                Task{
                    guard let recipe = await vc.listener?.requestSearchRecipe(text: text) else {return}
                    vc.updateData(cookRecipe: recipe)
                }
            }
            .disposed(by: disposeBag)
    }
}
