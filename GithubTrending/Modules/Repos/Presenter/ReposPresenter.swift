final class ReposPresenter: ReposViewOutput, ReposInteractorOutput {

    weak var view: ReposViewInput!
    var interactor: ReposInteractorInput!
    var router: ReposRouterInput!

    // MARK: - ReposViewOutput
    func viewIsReady() {
        interactor.fetchReposHistory()
    }

    func refreshRepos() {
        interactor.fetchRepos()
    }

    // MARK: - ReposInteractorOutput
    func didReceive(repos: [Repo]?, error: Error?) {
        if let error = error {
            view.display(repoCellViewModels: nil, error: error)
            return
        }
        if let repos = repos {
            view.display(repoCellViewModels: parseToViewModel(repos), error: nil)
        }
    }

    func didReceiveFromDisk(repos: [Repo]?, error: Error?) {
        if let error = error {
            view.displayHistory(repoCellViewModels: nil, error: error)
            return
        }
        if let repos = repos {
            view.displayHistory(repoCellViewModels: parseToViewModel(repos), error: nil)
        }
    }

    private func parseToViewModel(_ repos: [Repo]) -> [RepoCellViewModel] {
        var repoCellViewModels = [RepoCellViewModel]()
        repoCellViewModels = repos
            .compactMap { RepoCellViewModel(repo: $0) }
            .sorted(by: { (lhs, rhs) -> Bool in
            return lhs.starsCount > rhs.starsCount
        })
        return repoCellViewModels
    }

    func didSelect(_ cellViewModel: RepoCellViewModel) {
        guard let urlString = cellViewModel.htmlURL else { return }
        router.displayRepoDetails(urlString: urlString)
    }

}
