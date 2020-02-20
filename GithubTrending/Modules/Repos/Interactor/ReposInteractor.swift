import Foundation

final class ReposInteractor: ReposInteractorInput {

    weak var output: ReposInteractorOutput!
    private var repoService: RepoService
    private var dataStorage: RepoDataStorage

    init(repoService: RepoService, dataStorage: RepoDataStorage) {
        self.repoService = repoService
        self.dataStorage = dataStorage
    }

    // MARK: - ReposInteractorInput
    func fetchRepos() {
        repoService.fetchRepos { [weak self] result in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                switch result {
                case .success(let repos):
                    self?.output.didReceive(repos: repos, error: nil)
                    strongSelf.dataStorage.store(repos, completion: { _ in })
                case .failure(let error):
                    // Let's make it easy, all network error
                    self?.output.didReceive(repos: nil, error: APIGenericError.generic(1001))
                    print(error ?? "error is nil")
                }
            }
        }
    }

    func fetchReposHistory() {
        dataStorage.loadRecent(numerOfItems: 24) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos):
                    self?.output.didReceiveFromDisk(repos: repos, error: nil)
                case .failure(let error):
                    print(error ?? "error is nil")
                    // Silent
                }
            }
        }
    }

}
