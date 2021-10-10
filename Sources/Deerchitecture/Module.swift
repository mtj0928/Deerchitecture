public protocol Module {

    associatedtype Environment: ApplicationEnvironment

    var environment: Environment { get }

    init(with environment: Environment)
}

public protocol InitializableModule {
    func initialize()
}

public typealias FeatureModule = Module & InitializableModule
