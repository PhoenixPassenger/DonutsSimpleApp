//
//  ViewController.swift
//  Donuts
//
//  Created by Rodrigo Silva Ribeiro on 25/03/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    typealias Donuts = [Donut]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getSpells()
        setupSearchBar()
        self.view.backgroundColor = .purpleCream
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.hideKeyboardWhenTappedAround()

    }
    var filteredToppings: [Topping] = []
    var list: [Topping] = [] {
        didSet {
            filteredToppings = list
        self.tableView.reloadData()
        }

    }
    var url: [String] = []

    lazy var searchBar: UISearchBar = UISearchBar()

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search Topping"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.isTranslucent = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if textSearched == "" {
            filteredToppings = list
        } else {
            filteredToppings = list.filter { item in
                return item.type.lowercased().contains(textSearched.lowercased())
            }
        }
        tableView.reloadData()
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .purpleCream
        tableView.tintColor = .pinkDonut
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
}

extension ViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.addSubview(tableView)
        tableView.rowHeight = 66
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    private func getSpells() {
        self.getSpellsFromJson()
        self.tableView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func getSpellsFromJson() {
        guard let path = Bundle.main.path(forResource: "teste", ofType: "json") else { return }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
                if let data = data {
                 do {
                     let donuts = try JSONDecoder().decode(Donuts.self, from: data)
                     donuts.forEach { donut in
                        donut.topping.forEach({ topping in
                            if !self.list.contains(where: {topping.id == $0.id}){
                                self.list.append(topping)
                            }
                        })
                     }
                    print(self.list)
                 } catch {
                     print(String(bytes: data, encoding: .utf8) ?? "nil")
                     print(error)
                 }
             }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredToppings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellWrap = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell
        guard let cell = cellWrap else { fatalError() }
        cell.set(topping: filteredToppings[indexPath.section])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        searchBar.endEditing(true)
    }

}


