//
//  ViewController.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 03/01/2023.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedPostTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostTableViewCell.indetifier)
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated(){
        //check auth status
        if Auth.auth().currentUser == nil {
            //show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}
extension HomeViewController: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.indetifier, for: indexPath) as!
        IGFeedPostTableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
}
