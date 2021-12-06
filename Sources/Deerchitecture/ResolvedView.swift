import SwiftUI

#if os(watchOS)
public struct ResolovedView<TypedScene: Scene>: View {

    let scene: TypedScene
    let environment: ApplicationEnvironment

    public init(_ scene: TypedScene, in environment: ApplicationEnvironment) {
        self.scene = scene
        self.environment = environment
    }

    public var body: some View {
        environment.coordinator.resolve(scene)
    }
}
#endif
