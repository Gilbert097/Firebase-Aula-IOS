//
//  UserListTableViewController.swift
//  Firebase Aula
//
//  Created by Gilberto Silva on 17/04/21.
//

import UIKit

class UserListTableViewController: UITableViewController {
    private let userService = UserService()
    private let userAuthenticationService = UserAuthenticationService.shared
    private var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        userService.getUsers { [weak self] (usersResponse) in
            guard let self = self else { return }
            self.users = usersResponse
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserItemTableViewCell
        else { return UITableViewCell()}
        let userCurrent = users[indexPath.row]
        cell.setUser(user: userCurrent)
        return cell
    }
    
    @IBAction func signOutButtonClick(_ sender: UIButton) {
        userAuthenticationService.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
}
