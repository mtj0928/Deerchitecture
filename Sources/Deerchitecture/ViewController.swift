import SwiftUI
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

// MARK: - ViewController
#if os(iOS)
public typealias ViewController = UIViewController
#elseif os(macOS)
public typealias ViewController = NSViewController
#endif

// MARK: - HostingController
#if os(iOS)
public typealias HostingController = UIHostingController
#elseif os(macOS)
public typealias HostingController = NSHostingController
#endif

// MARK: - ViewControllerRepresentable
#if os(iOS)
public typealias ViewControllerRepresentable = UIViewControllerRepresentable
#elseif os(macOS)
public typealias ViewControllerRepresentable = NSViewControllerRepresentable
#endif
