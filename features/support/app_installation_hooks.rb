if ENV['PLATFORM'] == 'android'
  AfterConfiguration do |_config|
    FeatureMemory.feature = nil
    start_android_emulator(ENV['DEVICE_NAME']) unless ENV['DEVICE_NAME'].nil?
  end

  Before do |scenario|
    scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)
    feature = scenario.feature

    if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      ensure_app_installed
      clear_app_data
      FeatureMemory.feature = feature
      FeatureMemory.invocation = 1
      start_test_server_in_background
    else
      FeatureMemory.invocation += 1
    end
  end

  After do |scenario|
    screenshot_embed if scenario.failed?
    shutdown_test_server
  end

  FeatureMemory = Struct.new(:feature, :invocation).new
end

def kill_android_emulator
  Timeout.timeout(60) do
    until (`adb devices`.include? 'emulator') == false
      `adb -s emulator-5554 emu kill`
    end
  end
end

def start_android_emulator(emulator)
  kill_android_emulator

  Timeout.timeout(60) do
    `$ANDROID_HOME/tools/emulator -avd #{emulator} -wipe-data -no-snapshot-save &> /dev/null &`

    `adb -s emulator-5554 wait-for-device`

    until `adb -s emulator-5554 shell getprop init.svc.bootanim`.include? 'stopped'
      sleep(1)
    end

    until `adb -s emulator-5554 wait-for-device shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done; input keyevent 82'`
      sleep(1)
    end
  end
end
