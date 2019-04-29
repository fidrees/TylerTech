//
//  UserListViewController.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-27.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private struct UserListConstants {
        static let userListCellIdentifier = "UserListCellIdentifier"
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = UserListVCViewModel(serviceApi: ServiceApi.sharedInstance)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchUsers()
        handleViewModelClosures()
    }
    
    // MARK: - Private methods
    
    private func handleViewModelClosures() {
        viewModel.updateUIClosure = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - TableView Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userListCell =  tableView.dequeueReusableCell(withIdentifier: UserListConstants.userListCellIdentifier, for: indexPath) as! UserListCell
        let cellViewModel = viewModel.cellViewModelAtIndexPath(indexPath: indexPath)
        userListCell.cellViewModel = cellViewModel
        
        return userListCell
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == viewModel.numberOfRowsInSection() {
            viewModel.fetchUsers()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userMapViewModel = viewModel.userMapViewModelAtIndexPath(indexPath: indexPath)
        performSegue(withIdentifier: Constants.userListToUserMapSegue, sender: userMapViewModel)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.userListToUserMapSegue {
            if let userMapViewModel = sender as? UserMapVCViewModel, let userMapViewController = segue.destination as? UserMapViewController {
                userMapViewController.viewModel = userMapViewModel
            }
        }
    }

}
