import UIKit
import WebKit

final class RepoDetailViewController: UIViewController, RepoDetailViewInput {

    @IBOutlet weak var webView: WKWebView!
    var output: RepoDetailViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
        basicUI()
    }

    func basicUI() {
        webView.accessibilityIdentifier = "RepoDetailsWebView"
    }

    // MARK: RepoDetailViewInput
    func display(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func refreshWebView() {
        webView.reload()
    }

}
