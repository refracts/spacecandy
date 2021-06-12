TARGET := iphone:clang::13.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = spacecandyprefs

spacecandyprefs_FILES = SCPRootListController.m
spacecandyprefs_FRAMEWORKS = UIKit
spacecandyprefs_PRIVATE_FRAMEWORKS = Preferences
spacecandyprefs_INSTALL_PATH = /Library/PreferenceBundles
spacecandyprefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
