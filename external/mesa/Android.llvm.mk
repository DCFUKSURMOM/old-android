#
# Centralized place for LLVM configuration.
#

MESA_LLVM := false

# check TARGET_ARCH
ifeq ($(filter x86, $(TARGET_ARCH)),)
MESA_LLVM := false
endif

ifeq ($(strip $(MESA_LLVM)),true)

LLVM_TOP := external/llvm
LLVM_VERSION := 0x0208

ifeq ($(strip $(LOCAL_MODULE_CLASS)),STATIC_LIBRARIES)
include $(LLVM_TOP)/Android.common.mk
LOCAL_CFLAGS += -DHAVE_LLVM=$(LLVM_VERSION)
endif # STATIC_LIBRARIES

ifeq ($(strip $(LOCAL_MODULE_CLASS)),SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES += libstlport

LOCAL_STATIC_LIBRARIES += \
	libLLVMMCDisassembler \
	libLLVMLinker \
	libLLVMipo \
	libLLVMInterpreter \
	libLLVMInstrumentation \
	libLLVMJIT \
	libLLVMExecutionEngine \
	libLLVMBitWriter

ifeq ($(TARGET_ARCH),x86)
LOCAL_STATIC_LIBRARIES += \
	libLLVMX86Disassembler \
	libLLVMX86AsmParser \
	libLLVMX86CodeGen \
	libLLVMX86AsmPrinter \
	libLLVMX86Info
endif # x86

LOCAL_STATIC_LIBRARIES += \
	libLLVMAsmParser \
	libLLVMArchive \
	libLLVMBitReader \
	libLLVMSelectionDAG \
	libLLVMAsmPrinter \
	libLLVMMCParser \
	libLLVMCodeGen \
	libLLVMScalarOpts \
	libLLVMInstCombine \
	libLLVMTransformUtils \
	libLLVMipa \
	libLLVMAnalysis \
	libLLVMTarget \
	libLLVMMC \
	libLLVMCore \
	libLLVMSupport \
	libLLVMSystem
endif # SHARED_LIBRARIES

endif # MESA_LLVM
