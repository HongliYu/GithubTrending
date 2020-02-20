import UIKit

final class ReposRouter: ReposRouterInput {

    weak var viewController: UIViewController!

	// MARK: - ReposRouterInput
    func displayRepoDetails(urlString: String) {
        let builder = RepoDetailModuleBuilder(urlString: urlString)
        let repoDetailViewController = builder.build()

        viewController.title = ""
        viewController.navigationController?.pushViewController(repoDetailViewController,
                                                                animated: true)
    }

}
