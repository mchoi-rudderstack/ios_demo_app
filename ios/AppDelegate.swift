import UIKit
import OTPublishersHeadlessSDK
import Rudder
import RudderOneTrustConsentFilter
import Rudder_Braze

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        OTPublishersHeadlessSDK.shared.startSDK(
            storageLocation: "cdn.cookielaw.org",
            domainIdentifier: "03b4f096-bd76-48f1-8ea0-ae82b98502a7-test",
            languageCode: "en"
        ) { response in
            if response.status {
                if let OT_INITIALISED = UserDefaults.standard.value(forKey: "OT_INITIALISED") as? Bool, OT_INITIALISED == true {
                    self.initializeRudderSDK()
                }
            }
        }
        
        OTPublishersHeadlessSDK.shared.addEventListener(self)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func initializeRudderSDK() {
        UserDefaults.standard.set(true, forKey: "OT_INITIALISED")
        let builder: RSConfigBuilder = RSConfigBuilder()
            .withLoglevel(RSLogLevelDebug)
            .withDataPlaneUrl("DATAPLANE_URL")
            .withSleepTimeOut(5)
            .withFactory(RudderBrazeFactory.instance())
            .withConsentFilter(RudderOneTrustConsentFilter())
        
        RSClient.getInstance("SOURCE_WRITE_KEY", config: builder.build())
    }

}

extension AppDelegate: OTEventListener {
    func onHideBanner() {
        
    }
    
    func onShowBanner() {
        
    }
    
    func onBannerClickedRejectAll() {
        initializeRudderSDK()
    }
    
    func onBannerClickedAcceptAll() {
        initializeRudderSDK()
    }
    
    func onShowPreferenceCenter() {
        
    }
    
    func onHidePreferenceCenter() {
        initializeRudderSDK()
    }
    
    func onPreferenceCenterRejectAll() {
        initializeRudderSDK()
    }
    
    func onPreferenceCenterAcceptAll() {
        initializeRudderSDK()
    }
    
    func onPreferenceCenterConfirmChoices() {
        initializeRudderSDK()
    }
    
    func onPreferenceCenterPurposeLegitimateInterestChanged(purposeId: String, legitInterest: Int8) {
        
    }
    
    func onPreferenceCenterPurposeConsentChanged(purposeId: String, consentStatus: Int8) {
        
    }
    
    func onShowVendorList() {
        
    }
    
    func onHideVendorList() {
        
    }
    
    func onVendorListVendorConsentChanged(vendorId: String, consentStatus: Int8) {
        
    }
    
    func onVendorListVendorLegitimateInterestChanged(vendorId: String, legitInterest: Int8) {
        
    }
    
    func onVendorConfirmChoices() {
        
    }
    
    func allSDKViewsDismissed(interactionType: ConsentInteractionType) {
        
    }
}


