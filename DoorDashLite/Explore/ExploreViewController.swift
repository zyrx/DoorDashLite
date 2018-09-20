//
//  ExploreViewController.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 17/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import UIKit
import SnapKit

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(_ viewController: T.Type) -> T? where T: ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as? T
    }
}

class ExploreViewController: UIViewController {
    
    let tableView = UITableView()
    var exploreViewModel: ExploreViewable & LocationViewable = ExploreViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.register(ExploreTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        exploreViewModel.fetchData()
        exploreViewModel.stores.bind {[weak self] stores in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            print("Stores \(stores.count)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if exploreViewModel.stores.value.count <= 0 {
            exploreViewModel.fetchData()
        }
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ChoseLocationAction(_ sender: Any) {
        guard let locationViewController = storyboard?.instantiateViewController(LocationViewController.self) else {
            return
        }
        locationViewController.delegate = self
        present(UINavigationController(rootViewController: locationViewController), animated: true)
    }
}

// MARK:- LocationViewControllerDelegate
extension ExploreViewController: LocationViewControllerDelegate {
    func didChangeSelectedLocation(with location: Location) {
        exploreViewModel.selectedLocation.value = location
    }
}

// MARK:- UITableViewDataSource
extension ExploreViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreViewModel.stores.value.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ExploreTableViewCell
        cell.configure(with: exploreViewModel.stores.value[indexPath.row])
        return cell
    }
}

// MARK:- UITableViewDelegate
extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
