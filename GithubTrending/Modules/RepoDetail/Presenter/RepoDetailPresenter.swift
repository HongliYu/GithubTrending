final class RepoDetailPresenter: RepoDetailViewOutput, RepoDetailInteractorOutput {

    weak var view: RepoDetailViewInput!
    var interactor: RepoDetailInteractorInput!
    var router: RepoDetailRouterInput!
    private(set) var urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    // MARK: - RepoDetailViewOutput
    func viewIsReady() {
        view.display(urlString: urlString)
        interactor.refreshWebViewEvery10Seconds()
    }

    // MARK: - RepoDetailInteractorOutput
    func didRefreshWebView() {
        view.refreshWebView()
    }

}
