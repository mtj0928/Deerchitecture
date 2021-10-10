import SwiftUI

public class Coordinator {

    private var builders: [String: AnyBuilder] = [:]

    public init() {}

    public func regist<TypeScene: Scene, TypedView: View>(_ scene: TypeScene.Type, builder: @escaping (TypeScene) -> TypedView) {
        builders[TypeScene.id] = AnyBuilder({ scene in
            AnyView(builder(scene))
        })
    }

    public func resolve<TypeScene: Scene>(_ scene: TypeScene) -> AnyView {
        builders[TypeScene.id]?.resolve(scene: scene) ?? AnyView(EmptyView())
    }

    public func resolveasViewController<TypeScene: Scene>(_ scene: TypeScene) -> ViewController {
        HostingController(rootView: self.resolve(scene))
    }
}

fileprivate struct AnyBuilder {
    var builder: (Scene) -> AnyView?

    init<T: Scene>(_ builder: @escaping (T) -> AnyView?) {
        self.builder = { scene in
            guard let castScene = scene as? T else {
                return nil
            }
            return builder(castScene)
        }
    }

    func resolve(scene: Scene) -> AnyView? {
        return builder(scene)
    }
}
