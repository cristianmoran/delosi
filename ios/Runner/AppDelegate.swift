import Flutter
import UIKit
import Toast_Swift

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "matrix_toast"
 
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let toastChannel = FlutterMethodChannel(name: CHANNEL,
                                              binaryMessenger: controller.binaryMessenger)
   
    toastChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "showToast" {
        if let args = call.arguments as? [String: Any],
           let message = args["message"] as? String {
          self.showToast(message: message)
          result(nil)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT",
                              message: "El argumento 'message' es nulo o inválido",
                              details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
   
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
 
    private func showToast(message: String) {
      guard let rootView = window?.rootViewController?.view else { return }
      DispatchQueue.main.async {
        rootView.makeToast(message, duration: 2.0, position: .bottom)
      }
    }

}
