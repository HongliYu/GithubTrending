import UIKit
import PKHUD

final class ReposViewController: UIViewController, ReposViewInput {

    var output: ReposViewOutput!
    private var repoCellViewModels: [RepoCellViewModel]?
    @IBOutlet weak var tableView: UITableView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        basicUI()
        output.viewIsReady()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HUD.show(.progress)
        output.refreshRepos()
    }

    private func basicUI() {
        title = "Github Trending"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.accessibilityIdentifier = "ReposTableView"
    }

    // MARK: ReposViewInput
    func display(repoCellViewModels: [RepoCellViewModel]?, error: Error?) {
        if let error = error {
            HUD.flash(.labeledError(title: error.localizedDescription, subtitle: nil), delay: 1.0)
            return
        }
        self.repoCellViewModels = repoCellViewModels
        HUD.flash(.success, delay: 1.0)
        tableView.reloadData()
    }

    func displayHistory(repoCellViewModels: [RepoCellViewModel]?, error: Error?) {
        guard error == nil else {
            return
        }
        self.repoCellViewModels = repoCellViewModels
        tableView.reloadData()
    }

}

// MARK: - Table view datasource/delegate
extension ReposViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoCellViewModels?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RepoTableViewCell.self),
                                                       for: indexPath) as? RepoTableViewCell,
            let repoCellViewModels = repoCellViewModels else {
             return UITableViewCell()
        }
        cell.bindData(repoCellViewModels[indexPath.row])
        cell.accessibilityIdentifier = "RepoCell\(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repoCellViewModels = repoCellViewModels else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: false)
        output.didSelect(repoCellViewModels[indexPath.row])
    }

}
