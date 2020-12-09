//
//  ViewController.swift
//  SwiftBasicDemo
//
//  Created by 播呗网络 on 2020/12/9.
//

import UIKit

class ViewController: UIViewController {

    let kScreenWidth = UIScreen.main.bounds.width
    let kScreenHeight = UIScreen.main.bounds.height
    let data = ["swift基础知识(一)","swift基础知识(二)","swift基础知识(三)"]
    
    
    
    lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight - 100), style: .plain)
        //设置
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = UIColor.white
        tab.separatorStyle = .singleLine
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tab
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(self.tableView)
        
        
        
        
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let text = data[indexPath.row]
        switch text {
        case "swift基础知识(一)":
            let vc = JJBasicOneViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "swift基础知识(二)":
            let vc = JJBasicTwoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "swift基础知识(三)":
            let vc = JJBasicThreeViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
        
        
        
    }

}












