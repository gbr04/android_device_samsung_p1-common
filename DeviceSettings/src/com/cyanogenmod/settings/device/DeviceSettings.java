/*
 * Copyright (C) 2013 The OmniROM Project
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

import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.view.MenuItem;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;

import com.cyanogenmod.settings.device.R;

import java.util.ArrayList;

public class DeviceSettings extends Activity {

    public static final String SHARED_PREFERENCES_BASENAME = "com.cyanogenmod.settings.device";
    public static final String ACTION_UPDATE_PREFERENCES = "com.cyanogenmod.settings.device.UPDATE";
    public static final String KEY_CATEGORY_RADIO = "category_radio";
    public static final String KEY_BIGMEM = "bigmem";
    public static final String KEY_HSPA = "hspa";
    public static final String KEY_TVOUT_ENABLE = "tvout_enable";
    public static final String KEY_TVOUT_SYSTEM = "tvout_system";
    public static final String KEY_HDMI_ENABLE = "hdmi_enable";
    public static final String KEY_BUTTONS_DISABLE = "buttons_disable";
    public static final String KEY_BUTTONS = "buttons_category";
    public static final String KEY_BACKLIGHT_TIMEOUT = "backlight_timeout";
    public static final String KEY_VIBRATOR_TUNING = "vibrator_tuning";

    private ListPreference mBacklightTimeout;
    private ListPreference mBigmem;
    private ListPreference mHspa;
    private VibratorTuningPreference mVibratorTuning;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mBacklightTimeout = (ListPreference) findPreference(KEY_BACKLIGHT_TIMEOUT);
        mBacklightTimeout.setEnabled(TouchKeyBacklightTimeout.isSupported());
        mBacklightTimeout.setOnPreferenceChangeListener(new TouchKeyBacklightTimeout());

        mBigmem = (ListPreference) findPreference(KEY_BIGMEM);
        mBigmem.setEnabled(Bigmem.isSupported());
        mBigmem.setOnPreferenceChangeListener(new Bigmem());

        mHspa = (ListPreference) findPreference(KEY_HSPA);
        if (Hspa.isSupported()) {
           mHspa.setOnPreferenceChangeListener(new Hspa(this));
        } else {
           PreferenceCategory category = (PreferenceCategory) getPreferenceScreen().findPreference(KEY_HSPA);
           category.removePreference(mHspa);
           getPreferenceScreen().removePreference(category);
        }

        mVibratorTuning = (VibratorTuningPreference) findPreference(KEY_VIBRATOR_TUNING);
        mVibratorTuning.setEnabled(VibratorTuningPreference.isSupported());
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
