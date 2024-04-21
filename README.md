## Sensitive props

Reset sensitive properties to safe state and Hide UserDebug, Test-Keys and Custom ROMs specific props.

## Description

Some Custom ROMs (like LineageOS) build their systems as userdebug which allows for easier debugging and ADB usage.

However, if you want to pass SafetyNet or any alternative, that can be a pain, due to Certified ROMs using user builds.

Also, some developers may use test-keys to sign their builds as opposed to release-keys, which is more of a security concern than anything. (Anyone can use the default test-keys to sign stuff, with the system just accepting those).

So, this module dynamically gets system props from the device and patches them to change userdebug to user and test-keys to release-keys.

Additionally, this module removes all LineageOS specific props, to prevent apps from identifying it by using them. 
