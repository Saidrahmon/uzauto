import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            let methodChannel = FlutterMethodChannel(name: "flutter.native/myid", binaryMessenger: controller.binaryMessenger)

            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.setNavigationBarHidden(true, animated: false)
            self.window!.rootViewController = navigationController
            self.window!.makeKeyAndVisible()

            methodChannel.setMethodCallHandler({
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                if (call.method == "runSDK") {
                    let vc = MyIdController(
                        onResult: { data in
                            result(data)
                            navigationController.dismiss(animated: true)
                        },
                        onCancel: {
                            navigationController.dismiss(animated: true)
                        }
                    )
                    vc.modalPresentationStyle = .pageSheet
                    navigationController.present(vc, animated: true)
                }
            })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
