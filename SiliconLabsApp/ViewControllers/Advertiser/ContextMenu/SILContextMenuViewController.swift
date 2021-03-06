//
//  SILContextMenuViewController.swift
//  BlueGecko
//
//  Created by Michał Lenart on 05/11/2020.
//  Copyright © 2020 SiliconLabs. All rights reserved.
//

import UIKit

class SILContextMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let CellHeight: CGFloat = 30.0
    
    @IBOutlet weak var tableView: UITableView!
    
    var options: [ContextMenuOption]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        updatePreferredContentSize()
    }
    
    private func updatePreferredContentSize() {
        let width = options
            .map({ option in
                return option.title.size(withAttributes: [
                    .font: UIFont(name: "Roboto-Regular", size: 17)!
                    ]).width
            }).max() ?? 0
        let widthWithMargin = width + 48
        let widthNotTooSmall = max(widthWithMargin, 207)
        let widthNotTooBig = min(widthNotTooSmall, UIScreen.main.bounds.width)

        let height = CGFloat(options.count) * Self.CellHeight

        preferredContentSize = CGSize(width: widthNotTooBig, height: height)
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = options[indexPath.row]
        dismiss(animated: false, completion: nil)
        
        DispatchQueue.main.async {
            option.callback()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Self.CellHeight
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SILContextMenuCellView", for: indexPath) as! SILContextMenuCellView
        let option = options[indexPath.row]
        
        cell.title.text = option.title
        cell.title.isEnabled = option.enabled
        cell.isUserInteractionEnabled = option.enabled
        
        return cell
    }
}
