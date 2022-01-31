//
//  CollectionTestViewController.swift
//  SeSAC_Friends
//
//  Created by sungyeon kim on 2022/01/26.
//

import UIKit
import SnapKit
import Then

class CollectionTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var models = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .red
        models.append(Model(text: "First", imageName: "onboarding_img1"))
        models.append(Model(text: "seconde", imageName: "onboarding_img2"))
        models.append(Model(text: "third", imageName: "onboarding_img3"))

        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

    }

    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}

struct Model {
    let text: String
    let imageName: String

    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}
