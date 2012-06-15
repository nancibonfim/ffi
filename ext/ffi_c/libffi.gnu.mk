# -*- makefile -*-
#
#  Common definitions for all systems that use GNU make
#


# Tack the extra deps onto the autogenerated variables
INCFLAGS += -I"$(LIBFFI_BUILD_DIR)"/include
LOCAL_LIBS += $(LIBFFI)
BUILD_DIR = $(shell pwd)
LIBFFI_CFLAGS = $(FFI_MMAP_EXEC) -pthread
LIBFFI_BUILD_DIR = $(BUILD_DIR)/libffi-$(arch)

ifeq ($(srcdir),.)
  LIBFFI_SRC_DIR := $(shell pwd)/libffi
else ifeq ($(srcdir),..)
  LIBFFI_SRC_DIR := $(shell pwd)/../libffi
else
  LIBFFI_SRC_DIR := $(realpath $(srcdir)/libffi)
endif

LIBFFI = "$(LIBFFI_BUILD_DIR)"/.libs/libffi_convenience.a
LIBFFI_CONFIGURE = "$(LIBFFI_SRC_DIR)"/configure --disable-static \
	--with-pic=yes --disable-dependency-tracking

$(OBJS):	$(LIBFFI)

#
# libffi.mk or libffi.darwin.mk contains rules for building the actual library
#

