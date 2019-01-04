//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var elements = [ElementInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(elements)
        loadData()
        // searchElement(keyword: "elements")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        ElementAPIClient.searchElement { (appError, elements) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let elements = elements {
                self.elements = elements
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ElementDetailController,
            let cellSelected = tableView.indexPathForSelectedRow else {return}
        let elementSelected = elements[cellSelected.row]
        destination.element = elementSelected
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as? ElementCell else { fatalError("ElementCell error")}
        let elementToSet = elements[indexPath.row]
        cell.elementName?.text = elementToSet.name
        cell.elementSymbolWeight?.text = "\(elementToSet.symbol)(\(elementToSet.number)) \(elementToSet.weight)"
        ImageHelper.shared.fetchImage(urlString: "http://www.theodoregray.com/periodictable/Tiles/018/s7.JPG") { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                 cell.elementThumbNailIamge.image = image
            }
        }
        
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
