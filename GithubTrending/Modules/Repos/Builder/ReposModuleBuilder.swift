import UIKit

final class ReposModuleBuilder {

    func build() -> UIViewController {

        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: ReposViewController.self)) as? ReposViewController else {
                return UIViewController()
        }

        let router = ReposRouter()
        router.viewController = viewController

        let presenter = ReposPresenter()
        presenter.view = viewController
        presenter.router = router

        let coreDataManager = CoreDataManager.shared
        let dataStorage = CoreDataRepoStorage(manager: coreDataManager)

        let interactor = ReposInteractor(repoService: RepoServiceImpl(), dataStorage: dataStorage)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

}
