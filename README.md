# ios_demo_app

This is an iOS demo app that will allow you to send track() and identify() calls to RudderStack. Additionally, this app is integrated with OneTrust if you need to demo consent management. Follow the below instructions to get started:


**Prerequisites**
1. MacOS version 13+ (Ventura)
2. XCode version 14+


**Getting Started**
1. Download [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) 14+
2. Download or clone a copy of this repo locally to your computer
3. Open XCode, click on "Open a project or file", and select the "ios_demo_app" folder
4. Open the "AppDelegate.swift" file and update the `DATAPLANE_URL` and `SOURCE_WRITE_KEY` in the initializeRudderSDK() function highlighted in pink in the screenshot below
5. Make sure you select "ios" as the scheme as indicated in red in the screenshot below
7. You're now ready to build and run a simulation by pressing the play button circled in green in the screenshot below
8. Clicking on Consent Management will open the OneTrust component where you'll need to allow all in order to send data to RudderStack. Once consent has been granted, the Consent Management button will no longer work. To re-enable OneTrust, you will need to delete the app and re-run the simulation.

![Screenshot 2023-05-25 at 5 18 32 PM](https://github.com/mchoi-rudderstack/ios_demo_app/assets/126521577/b32ad130-3876-4348-a12d-ca238f3cf666)
