import Flutter
import UIKit
import AppTrackingTransparency
import AdSupport

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let IDENTIFIER_CHANNEL = "app.id.values"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    FlutterMethodChannel(
      name: IDENTIFIER_CHANNEL,
      binaryMessenger: controller.binaryMessenger
    ).setMethodCallHandler { call, result in
      switch call.method {
     case "requestTrackingAndGetIdfa":
       if #available(iOS 14, *) {
         ATTrackingManager.requestTrackingAuthorization { status in
           DispatchQueue.main.async {
             let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
             result(idfa)
           }
         }
       } else {
         let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
         result(idfa)
       }

      case "getIdfv":
        let idfv = UIDevice.current.identifierForVendor?.uuidString
        result(idfv)  // returns nil only if something is truly wrong

      default:
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func applicationDidBecomeActive(_ application: UIApplication) {
      if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization { _ in }
      }
    }
}
