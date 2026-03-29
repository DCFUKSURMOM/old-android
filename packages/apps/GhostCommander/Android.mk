#This is a clone of Total Commander
#This app IS open source (https://github.com/PDi-Communication-Systems-Inc/ghostcommander) but I didn't get it to build
#For now I am just bundling a prebuilt apk of the last version to support Gingerbread
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := GhostCommander
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := GhostCommander.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)