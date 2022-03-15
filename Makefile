ARCHS = arm64
TARGET := iphone:clang:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = @@PROJECTNAME@@

$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_LDFLAGS += FAHMenu/libFAHMenu.dylib JRMemory.framework/JRMemory
$(TWEAK_NAME)_LIBRARIES += substrate
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText
$(TWEAK_NAME)_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
