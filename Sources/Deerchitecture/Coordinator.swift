import SwiftUI
#if os(iOS)
import UIKit
#endif

public class Coordinator {

    #if os(macOS) || os(iOS)
    public typealias ViewAlias = ViewController
    #elseif os(watchOS)
    public typealias ViewAlias = View
    #endif

    private var builders: [String: AnyBuilder] = [:]

    public init() {}

    public func regist<TypeScene: Scene, TypedView: ViewAlias>(_ scene: TypeScene.Type, builder: @escaping (TypeScene) -> TypedView) {
        builders[TypeScene.id] = AnyBuilder({ scene in
            #if os(macOS) || os(iOS)
            builder(scene)
            #elseif os(watchOS)
            AnyView(builder(scene))
            #endif
        })
    }

    #if os(watchOS)
    @ViewBuilder
    public func resolve<TypeScene: Scene>(_ scene: TypeScene) -> some ViewAlias {
        if let view = builders[TypeScene.id]?.resolve(scene: scene) {
            view
        }
    }
    #endif

    #if os(iOS) || os(macOS)
    public func resolve<TypeScene: Scene>(_ scene: TypeScene) -> ViewAlias {
        builders[TypeScene.id]?.resolve(scene: scene) ?? ViewAlias()
    }
    #endif

    fileprivate struct AnyBuilder {
        #if os(iOS) || os(macOS)
        typealias ViewResult = ViewAlias
        #elseif os(watchOS)
        typealias ViewResult = AnyView
        #endif

        var builder: (Scene) -> ViewResult?

        init<T: Scene>(_ builder: @escaping (T) -> ViewResult?) {
            self.builder = { scene in
                guard let castScene = scene as? T else {
                    return nil
                }
                return builder(castScene)
            }
        }

        func resolve(scene: Scene) -> ViewResult? {
            return builder(scene)
        }
    }

}
