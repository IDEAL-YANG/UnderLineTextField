//
//  DemoViewController.swift
//  UnderLineTextField-Example
//
//  Created by IDEAL YANG on 2019/8/29.
//  Copyright © 2019 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit
import UnderLineTextField

class DemoViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(DesignInputCell.self, forCellReuseIdentifier: "DesignInputCell")
    }

}

extension DemoViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DesignInputCell") as! DesignInputCell
        cell.selectionStyle = .none
        
        if indexPath.row % 2 == 0 {
            cell.type = .selection
        }else {
            cell.type = .textFlied
        }
        
        cell.inputContent.placeholder = "TitleTitle---\(indexPath.row)"
        cell.inputContent.delegate = self
        cell.inputContent.validationType = .onCommit
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        if indexPath.row % 2 == 0 {
            let cell = tableView.cellForRow(at: indexPath) as? DesignInputCell
            cell?.inputContent.text = "内容哟哟～内容哟哟～内容哟哟～内容哟哟～内容哟哟～内容哟哟～内容哟哟～\(indexPath.row * 100)"
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

extension DemoViewController: UnderLineTextFieldDelegate {
    
    //==================================
    // MARK: - UnderLineTextField Delegate
    //==================================
    func textFieldValidate(underLineTextField: UnderLineTextField) throws {
        
        throw UnderLineTextFieldErrors.error(message: "i will always complain you no mather what")
        
//        throw UnderLineTextFieldErrors.warning(message: "i will always warn you no mather what")

//        guard underLineTextField.text?.isEmpty == false else { return }
//        throw UnderLineTextFieldErrors.warning(message: "Fancy Font")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldTextChanged(underLineTextField: UnderLineTextField) {
        
    }
    
}
