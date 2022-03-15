#import "baseicon.h"
#import "FAHMenu/Macros.h"




void setup(){
	[menu addSliderItem:@"Test Slider 1"  minValue:0 maxValue:100];
	[menu addTextfieldItem:@" Test Textfield 2"];

	// [menu addToggleMemoryItem:@"TESt" range:{ENCRYPTOFFSET("0x05529838"),ENCRYPTOFFSET("0x055298DC")} search:@[@30, @40, @50];
	[menu addToggleOffsetItem:@"Tessssst" offsets:{ENCRYPTOFFSET("0x3962580")} bytes:{ENCRYPTHEX("0x340080D2")}];

	// [menu addIndexItem:@"Cam Xa" item:@[@"30%", @"40%", @"50%"]];
	// float camxa = [menu getIndexValue:@"Cam Xa"];
	// if(camxa == 0) patchOffset(ENCRYPTOFFSET("0x035E4C0"), ENCRYPTHEX("0090261E 0008201E C0035FD6"));

}


static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
[UIPatch setFrameworkName:"UnityFramework"];

timer(2){ 	
	

	[menu setTitle:@"@@APPNAME@@ Mod Menu"];
	[menu setIconMenu:MenuIcon];
	[menu setMainColor:[UIColor redColor]];
	[menu setCredits:@"@@APPNAME@@ Mod Menu by @@USER@@!"];
	// [menu setLoveURL:@""];
	[menu initMenu];
	setup();
	
 });
}


%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}