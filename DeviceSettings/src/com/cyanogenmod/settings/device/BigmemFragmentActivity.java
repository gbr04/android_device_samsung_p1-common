/*
 * Copyright (C) The CyanogenMod Project
 * Copyright (C) The OmniROM Project
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

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;

import com.cyanogenmod.settings.device.R;

public class BigmemFragmentActivity extends PreferenceFragment {

    private static final String FILE = "/sys/kernel/bigmem/enable";

    private static final String TAG = "DeviceSettings_Bigmem";

    private ListPreference mBigmem;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.bigmem_preferences);

        PreferenceScreen prefSet = getPreferenceScreen();

        mBigmem = (ListPreference) findPreference(DeviceSettings.KEY_BIGMEM);
        mBigmem.setEnabled(Bigmem.isSupported());
        mBigmem.setOnPreferenceChangeListener(new Bigmem());
    }

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore bigmem setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            return;
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        Utils.writeValue(FILE, sharedPrefs.getString(DeviceSettings.KEY_BIGMEM, "0"));
    }

}
