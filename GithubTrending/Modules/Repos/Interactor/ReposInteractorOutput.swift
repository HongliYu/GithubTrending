protocol ReposInteractorOutput: class {

    func didReceive(repos: [Repo]?, error: Error?)
    func didReceiveFromDisk(repos: [Repo]?, error: Error?)

}
