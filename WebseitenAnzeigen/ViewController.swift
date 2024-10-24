//
//  ViewController.swift
//  WebseitenAnzeigen
//
//  Created by Mike Finimento on 24.10.24.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let urls = ["https://apple.de", "https://google.de"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = urls[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: urls[indexPath.row]) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
