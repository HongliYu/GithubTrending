import UIKit

final class RepoDetailInteractor: RepoDetailInteractorInput {

    weak var output: RepoDetailInteractorOutput!
    private var timer: Timer?

    // MARK: - RepoDetailInteractorInput
    func refreshWebViewEvery10Seconds() {
        timer = Timer(timeInterval: 10, repeats: true, block: { [weak self] _ in
            self?.update()
        })
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.default)
    }

    @objc func update() {
        output.didRefreshWebView()
    }

    deinit {
        timer?.invalidate()
    }

}
