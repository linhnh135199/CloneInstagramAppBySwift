//
//  FormTableViewCell.swift
//  CloneInstagramApp
//
//  Created by HOANG LINH on 05/01/2023.
//

import UIKit
protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateFeild value: String?)
}
class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private let formLabel:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    public func configure(with model: EditProfileFormModel){
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //assign frame
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        field.frame = CGRect(x: formLabel.right + 5,
                             y: 0,
                             width: contentView.width - 10 - formLabel.width,
                             height: contentView.height)
        
    }
    //field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.formTableViewCell(self, didUpdateFeild: textField.text)
        textField.resignFirstResponder()
        return true
    }
    
    
}
