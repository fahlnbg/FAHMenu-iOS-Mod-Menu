# iOS Mod Menu Template for Theos!

<div style="text-align: center;">
<b>Giao diện người dùng mẫu của Menu:</b><br>

<img src="https://i.imgur.com/8pIh2Va.jpeg">
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

* Backend Offset Patcher Switch dựa trên [KittyMemory](https://github.com/MJx0/KittyMemory)
  * **Không** cần patch bytes gốc
  * Hỗ trợ MSHookMemory
  * Patch Bytes không giới hạn kí tự
  * 
* Mã hoá các offset và bytes khi compile code


<br>

### Cài đặt:

Thiên thu nữa nhé! >.<

### Cài đặt menu:

**Đổi ảnh cho menu**
Trong file **Tweak.xm**, sẽ có thiết lập chức năng cho menu trong "setupMenu". 
Tại đây, sẽ có hai tùy chọn trong menu: menuIcon & menuButton, những option này yêu cầu chuỗi hình ảnh base64.
In order to get a base64 string from the image, upload the image here: https://www.browserling.com/tools/image-to-base64

Ảnh size 50x50, có thể lấy mẫu hình ảnh bằng cách sao chép chuỗi base64 (trong tweak.xm) và sử dụng trang web này để hiển thị hình ảnh: https://base64.guru/converter/decode/image

**Set một framework để có thể chạy**
Có thể set trong hàm setupMenu() trong Tweak.xm
```obj-c
[menu setFrameworkName:"FrameworkName"];
```

### Cách dùng menu:

**Mã hoá**

Note trước khi hiển thị tất cả các ví dụ chuyển đổi; Có thể và *nên* mã hóa các offset,mã hexes, chuỗi c-string và NSStrings. Dưới đây, có thể thấy cú pháp cho mỗi loại chuỗi.

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
  //Linh tinh
}

```
<b> Nhận giá trị của : </b>
```obj-c
float abc = [menu getSliderValue:@"Test Slider 1"];
NSString *abb = [menu getTextfieldValue:@" Test Textfield 2"];
float aaa = [menu getIndexValue:@"Test"];

```

