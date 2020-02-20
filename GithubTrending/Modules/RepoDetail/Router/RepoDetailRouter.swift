final class RepoDetailRouter: RepoDetailRouterInput {

	weak var viewController: RepoDetailViewController!

	// MARK: - RepoDetailRouterInput
    func goBack() {
        viewController.navigationController?.popViewController(animated: true)
    }

}
