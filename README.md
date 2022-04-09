# FAHMenu Mod Menu for Theos

<div style="text-align: center;">
<b>Giao diện người dùng mẫu của Menu:</b><br><br>

<img src="https://github.com/fahlnbg/FAHMenu-iOS-Mod-Menu/blob/main/Screenshot/Preview.PNG">
</div>

<br>

### Tính năng:
* Giao diện người dùng có thể tùy chỉnh
* Menu có thể tùy chỉnh & biểu tượng hình ảnh nút
* 5 loại Công tắc :
  * Công tắc Offset
  * Công tắc Memory
  * Công tắc nhiều chuyển đổi 
  * Công tắc nhập liệu
  * Công tắc thanh trượt

* Backend Offset Patcher Switch dựa trên [KittyMemory](https://github.com/MJx0/KittyMemory)
  * **Không** cần patch bytes gốc
  * Hỗ trợ MSHookMemory
  * Patch Bytes không giới hạn kí tự
* Mã hoá các offset và bytes khi hoàn thành code
* Công tắc Memory dựa trên [IGG](https://github.com/nongshifu/IGG)

<br>

### Cài đặt:

* Bước 1: Cần cài Theos vào iOS
* Bước 2: Tải [FAHMenu Mod Menu](https://github.com/fahlnbg/FAHMenu-iOS-Mod-Menu/blob/main/FAHMenu-iOS-Mod-Menu.nic.tar?raw=true) về Đường dẫn : /var/theos/templates/ios

***LƯU Ý*** :
* Cần cài đặt file [libFAHMenu](https://github.com/fahlnbg/FAHMenu-iOS-Mod-Menu/blob/main/com.fahlnbg.libfahmenu_1.0_iphoneos-arm.deb?raw=true) để Tweak được hoạt động
* Khi cần làm 1 project mới thì chạy lệnh : "/var/theos/bin/nic.pl" và điền thông tin Mod

### Cài đặt menu:

**Đổi ảnh cho menu**

Tải ảnh lên https://www.browserling.com/tools/image-to-base64 và chuyển đổi nó sang mã base64.
Copy mã đó thay vào trong file **baseicon.h**

**Set một framework để có thể chạy**

Có thể set trong hàm trong Tweak.xm (Nếu app bạn làm có Framework , còn không thì bỏ qua)
```obj-c
[UIPatch setFrameworkName:"UnityFramework"];
```
**Các cài đặt khác**

```obj-c
// Có thể có hoặc không
[menu setTitle:@"@@APPNAME@@ Mod Menu"];
[menu setIconMenu:MenuIcon];
[menu setMainColor:[UIColor redColor]];
[menu setCredits:@"@@APPNAME@@ Mod Menu by @@USER@@!"];


// Bắt buộc phải có 
[menu initMenu]; 
```


### Cách dùng menu:

**Mã hoá**

Bạn *nên* mã hóa các offset,mã hexes và NSStrings. Dưới đây, có thể thấy cú pháp cho mỗi loại chuỗi.

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

<b> Patching mà không cần chuyển đổi </b>
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


<b> Công tắc Offset: </b>
```obj-c
[menu addToggleItem:NSSENCRYPT("Hack On") offsets:{
                                          ENCRYPTOFFSET("0x3962580"),                                     
                                          ENCRYPTOFFSET("0x1002CB3B0"),
                                          ENCRYPTOFFSET("0x1002CB3B8")
                                       } bytes:{
                                          ENCRYPTHEX("0x340080D2"),
                                          ENCRYPTHEX("0xC0035FD6"),
                                          ENCRYPTHEX("0x00F0271E0008201EC0035FD6")
                                       }];
```


<b> Công tắc nhập liệu: </b>
```obj-c
[menu addTextfieldItem:@" Test Textfield 2"];
```
<b> Công tắc thanh trượt: </b>
```obj-c
[menu addSliderItem:@"Test Slider 1"  minValue:0 maxValue:100];
```
<b>Công tắc nhiều chuyển đổi: </b>
```obj-c
[menu addIndexItem:@"Test" item:@[@"10", @"20", @"40", @"80", @"120", @"140"]];
```
<b>Công tắc Memory: </b>
```obj-c
[menu addToggleMemoryItem:@"Test" range:{ENCRYPTOFFSET("0x100000000"),
                                         ENCRYPTOFFSET("0x160000000")
                                       } search:@[
                                         NSSENCRYPT("Scan,I32,200"),
                                         NSSENCRYPT("Near,I32,160"),
                                         .....
                                         NSSENCRYPT("Write,I32,9999")
                                       ]];
```


<b> Kiểm tra trạng thái công tắc
```obj-c
 BOOL isOn = [menu isItemOn:@"Switch Name Goes Here"];

if(isOn) {
  //Linh tinh
}

```
<b> Nhận giá trị của : </b>
```obj-c
float abc = [menu getSliderValue:@"Switch Name Goes Here"];
NSString *abb = [menu getTextfieldValue:@"Switch Name Goes Here"];
float aaa = [menu getIndexValue:@"Switch Name Goes Here"];

```


### Credits:
* Me ( fahlnbg )
  * [Donate Paypal](https://www.paypal.me/fahlnbg) or [Donate MoMo](https://me.momo.vn/fahlnbg)
* [Joey](https://github.com/joeyjurjens)
  * For [iOS Mod Menu Template for Theos](https://github.com/joeyjurjens/iOS-Mod-Menu-Template-for-Theos)
* [MJx0](https://github.com/MJx0)
  * For [KittyMemory](https://github.com/MJx0/KittyMemory)
* [dogo](https://github.com/dogo)
  * For [SCLAlertView](https://github.com/dogo/SCLAlertView)
* [nongshifu](https://github.com/nongshifu)
  * For [IGG](https://github.com/nongshifu/IGG)
 
 
