import SwiftUI

public struct Preview<Content, TypedModule: Module>: View where Content: View {

    let environment: TypedModule.Environment
    let module: TypedModule
    let content: (TypedModule.Environment) -> Content

    public init(
        _ moduleType: TypedModule.Type,
        with environment: TypedModule.Environment,
        _ content: @escaping (TypedModule.Environment) -> Content
    ) {
        self.content = content
        self.module = moduleType.init(with: environment)
        self.environment = environment
    }

    public var body: some View {
        content(environment)
    }
}
