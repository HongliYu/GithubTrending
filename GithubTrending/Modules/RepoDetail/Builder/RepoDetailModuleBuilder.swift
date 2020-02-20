import UIKit

final class RepoDetailModuleBuilder {

    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func build() -> UIViewController {

        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: RepoDetailViewController.self)) as? RepoDetailViewController else {
                return UIViewController()
        }

        let router = RepoDetailRouter()
        router.viewController = viewController

        let presenter = RepoDetailPresenter(urlString: urlString)
        presenter.view = viewController
        presenter.router = router

        let interactor = RepoDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

}
