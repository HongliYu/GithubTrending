protocol ReposViewInput: class {

    func display(repoCellViewModels: [RepoCellViewModel]?, error: Error?)
    func displayHistory(repoCellViewModels: [RepoCellViewModel]?, error: Error?)

}
