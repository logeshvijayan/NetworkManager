//
//  ViewController.swift
//  NetworkManager
//
//  Created by Logesh Vijayan on 2024-01-08.
//

import UIKit
import Combine


//MARK: - Class
class ViewController: UIViewController {
    
    var viewModel: UserViewModel = UserViewModel()

    @IBOutlet weak var userListTableView: UITableView!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userListTableView.dataSource = self
        userListTableView.delegate = self
        viewModel.getUserData() {
            DispatchQueue.main.async {
                self.userListTableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let userData = viewModel.users?.data?.count else { return 0 }
        return userData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cellView = tableView.dequeueReusableCell(withIdentifier: "userDetail", for: indexPath)
        cellView.textLabel?.text = viewModel.users?.data?[indexPath.row].firstName
        return cellView
    }
    
    
}

