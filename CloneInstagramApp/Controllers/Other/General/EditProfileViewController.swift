//
//  EditProfileViewController.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 03/01/2023.
//

import UIKit
struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}



final class EditProfileViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self,
                           forCellReuseIdentifier: FormTableViewCell.identifier)
        
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapCancel))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        //username, name, website, bio
        let section1Labels = ["Name","Username","Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label,
                                             placeholder: "Enter \(label)...",
                                             value: nil)
            section1.append(model)
        }
        models.append(section1)
        //email, phone, gender
        let section2Labels = ["Email","Phone","Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model1 = EditProfileFormModel(label: label,
                                              placeholder: "Enter \(label)...",
                                              value: nil)
            section2.append(model1)
        }
        models.append(section2)
        
    }
    //- TableView
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/5).integral)
        let size = header.height/1.5
        let profileButton = UIButton(frame: CGRect(x: (view.width - size)/2,
                                                   y: (header.height - size)/2,
                                                   width: size,
                                                   height: size))
        header.addSubview(profileButton)
        profileButton.tintColor = .label
        profileButton.layer.masksToBounds = true
        profileButton.layer.cornerRadius = size/2.0
        profileButton.addTarget(self,
                                action: #selector(didTapProfilePhotoButton),
                                for: .touchUpInside)
        profileButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                         for: .normal)
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier,
                                                 for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    //- Action
    @objc private func didTapSave(){
        //save in4 to database
        
    }
    
    @objc private func didTapCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture(){
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change profile picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {
            _ in
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: {
            _ in
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
    
    @objc private func didTapProfilePhotoButton(){
        
    }
    
    
}
extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateFeild value: String?) {
        print("Field update to: \(value ?? "nil")")
    }
}
