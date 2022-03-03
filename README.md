# iOS Mod Menu Template for Theos!

<div style="text-align: center;">
<b>Giao diện người dùng mẫu của Menu:</b><br>

<img src="https://i.imgur.com/f20XTb4.png">
</div>

<br>

### Tính năng:
* Giao diện người dùng có thể tùy chỉnh
* Menu có thể tùy chỉnh & biểu tượng hình ảnh nút
* 4 loại Công tắc :
  * Offset Patcher Nút
  * Công tắc chuyển 
  * Công tắc nhập liệu
  * Công tắc thanh trượt

* Backend Offset Patcher Switch dưa  [KittyMemory](https://github.com/MJx0/KittyMemory)
  * Original bytes are **not** required
  * Hỗ  MSHookMemory
  * Viết byte không giới hạn để bù đắp
  * 
* Compile-time string encryption


<br>

### Installation:

Soonn

### Menu setup:

**Changing the menu images**
Inside the **Tweak.xm**, you'll setup the menu under the function "setupMenu". 
Here you'll see two options under the menu: menuIcon & menuButton, those require a base64 image string.
In order to get a base64 string from the image, upload the image here: https://www.browserling.com/tools/image-to-base64

Images 50x50 are recommended, you can get a sample of my images by copying the standard(in tweak.xm) base64 string & use this website to show the picture: https://base64.guru/converter/decode/image

**Setting a framework as executable**
You can set this in the function setupMenu() inside Tweak.xm
```obj-c
[menu setFrameworkName:"FrameworkName"];
```

### Menu usage:

**Encryption**

A quick note before showing all the switch examples; You can and *should* encrypt offsets, hexes, c-strings and NSStrings. Below you can find the proper syntax per string-type.

**Offsets:**
```c
ENCRYPTOFFSET("0x10047FD90")
```

**Hexes:**
```c
ENCRYPTHEX("0x00F0271E0008201EC0035FD6")
```

**NSStrings:**
```c
NSSENCRYPT("Copperplate-Bold")
```

<b> Patching mà không cần chuyđổiđổi </b>
```c
patchOffset(ENCRYPTOFFSET("0x1002DB3C8"), ENCRYPTHEX("0xC0035FD6"));
patchOffset(ENCRYPTOFFSET("0x10020D2D4"), ENCRYPTHEX("0x00008052C0035FD6"));
// Bạn có thể viết theo ý 
patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("0x00F0271E0008201EC0035FD6"));
// hoặc  
patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("00F0271E0008201EC0035FD6"));
// hoặc có khoảng trắng
patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("00 F0 27 1E 00 08 20 1E C0 03 5F D6"));
```


<b> Offset Patcher Nút: </b>
```obj-c

	[menu addToggleItem:NSSENCRYPT("Hack Map") offsets:{
                                          ENCRYPTOFFSET("0x3962580"),                                     
                                          ENCRYPTOFFSET("0x1002CB3B0"),
                                          ENCRYPTOFFSET("0x1002CB3B8")
                                       } bytes:{
                                          ENCRYPTHEX("0x340080D2"),
                                          ENCRYPTHEX("0xC0035FD6"),
                                          ENCRYPTHEX("0x00F0271E0008201EC0035FD6")
                                       }];
```


<b> Chuyển đổi nhập liệu </b>
```obj-c
	[menu addTextfieldItem:@" Test Textfield 2"];
```
<b> Công tắc thanh trượt </b>
```obj-c
	[menu addSliderItem:@"Test Slider 1"  minValue:0 maxValue:100];
```
<b> Công tắc nhiều lựa chọn </b>
```obj-c
[menu addIndexItem:@"Test" item:@[@"10", @"20", @"40", @"80", @"120", @"140"]];
```


<b> Kiểm tra trạng thái công tắc
```obj-c
 BOOL isOn = [menu isItemOn:@"Switch Name Goes Here"];

if(isOn) {
  //Do stuff
}

```
<b> Nhận giá trị của : </b>
```obj-c
float abc = [menu getSliderValue:@"Test Slider 1"];
NSString *abb = [menu getTextfieldValue:@" Test Textfield 2"];
float aaa = [menu getIndexValue:@"Test"];

```

