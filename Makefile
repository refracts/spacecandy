TARGET := iphone:clang::13.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

export THEOS_DEVICE_IP = 192.168.1.216

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Spacecandy

Spacecandy_FILES = Tweak.xm ./scv/BTManager.mm ./scv/WifiButton.mm ./scv/RotLock.mm ./scv/AirMan.mm ./scv/FlashMan.mm ./scv/TapeRecorder.mm ./scv/SpaceBackground.m
Spacecandy_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += spacecandyprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
