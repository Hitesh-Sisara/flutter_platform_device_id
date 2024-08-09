// File: ios/Classes/SwiftPlatformDeviceIdPlugin.swift

import Flutter
import UIKit

public class SwiftPlatformDeviceIdPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "platform_device_id", binaryMessenger: registrar.messenger())
        let instance = SwiftPlatformDeviceIdPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getDeviceId":
            result(getDeviceId())
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func getDeviceId() -> String {
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            return uuid
        } else {
            return UUID().uuidString
        }
    }
}