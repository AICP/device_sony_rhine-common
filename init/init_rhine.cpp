/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log/log.h"
#include "util.h"

#include <android-base/properties.h>
#include <sys/system_properties.h>

static void import_kernel_nv(const std::string& key, const std::string& value)
{
    if (key.empty()) return;

    // We only want the bootloader version
    if (key == "oemandroidboot.s1boot") {
		android::base::SetProperty("ro.boot.oemandroidboot.s1boot", value.c_str());
    }
}

void vendor_load_properties()
{
    android::init::ImportKernelCmdline(import_kernel_nv);
}
