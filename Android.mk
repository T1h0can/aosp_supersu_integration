LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := su
LOCAL_SRC_FILES := SuperSU/armv7/su
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := .su
LOCAL_SRC_FILES := SuperSU/armv7/su
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin/.ext
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := daemonsu
LOCAL_SRC_FILES := SuperSU/armv7/su
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := supolicy
LOCAL_SRC_FILES := SuperSU/armv7/supolicy
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/xbin
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libsupol.so
LOCAL_SRC_FILES := SuperSU/armv7/libsupol.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE); \
	if [ -f "$(TARGET_OUT)/bin/install-recovery.sh" ]; then rm $(TARGET_OUT)/bin/install-recovery.sh; fi;
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := install-recovery.sh
LOCAL_SRC_FILES := SuperSU/common/install-recovery.sh
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE); \
	ln -s /system/etc/$(LOCAL_MODULE) $(TARGET_OUT)/bin/$(LOCAL_MODULE);
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := .installed_su_daemon
LOCAL_SRC_FILES := .installed_su_daemon
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := if [ -f "$(TARGET_OUT)/bin/app_process" ]; then rm $(TARGET_OUT)/bin/app_process; fi; \
	ln -s /system/xbin/daemonsu $(TARGET_OUT)/bin/app_process; \
	if [ -f "$(TARGET_OUT)/bin/app_process32" ]; then mv $(TARGET_OUT)/bin/app_process32 $(TARGET_OUT)/bin/app_process32_original; fi; \
 	ln -s /system/xbin/daemonsu $(TARGET_OUT)/bin/app_process32; \
	cp $(TARGET_OUT)/bin/app_process32_original $(TARGET_OUT)/bin/app_process_init;
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := 99SuperSUDaemon
LOCAL_SRC_FILES := SuperSU/common/99SuperSUDaemon
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/init.d
LOCAL_UNSTRIPPED_PATH :=
LOCAL_POST_INSTALL_CMD := chattr -ia $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
