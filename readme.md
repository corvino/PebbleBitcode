This project demonstrates how the PebbleKit embedded framework breaks
app thining and xcodebuild exports when bitcode is enabled.

### Setup

You'll need to set the Team in the Xcode project and the export options
plist (options.plis).

### Problem in Xcode

Archive and then choose _Export..._ Select _Save for Ad Hoc Deployment_,
choose the provisioning team, and then select the _Export for specific
devices:_ radio button. You will get the message _An error occured
during export / No applicable devices found._

### Problem with Code Build

Run build.sh with the teamID set in options.plist and you will see

```
[MT] IDEDistribution: Step failed: <IDEDistributionThinningStep: 0x7ff26b39c1b0>: Error Domain=IDEDistributionErrorDomain Code=14 "No applicable devices found." UserInfo={NSLocalizedDescription=No applicable devices found.}
error: exportArchive: No applicable devices found.

Error Domain=IDEDistributionErrorDomain Code=14 "No applicable devices found." UserInfo={NSLocalizedDescription=No applicable devices found.}

** EXPORT FAILED **
```

### Further Log Messages

The standard-level logs have more specific information on the failure:

```
...

warning: Failed to resolve rpath for PebbleKit: Could not resolve @executable_path for @executable_path/Frameworks from PebbleKit
LinkageGraph << <MachOImage /var/folders/2z/9hxxyf0s0pg5pj0s133yfhsw0000gn/T/IDEDistributionThinningStep.OEs/Payload/PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit armv7s> ->
2016-10-24 21:22:32 +0000  Complete LinkageGraph:
    PebbleBitcode.app/PebbleBitcode armv7 ->
        PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit armv7
    PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit armv7 ->
    
    PebbleBitcode.app/PebbleBitcode arm64 ->
        PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit arm64
    PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit arm64 ->
    
    PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit i386 ->
    
    PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit x86_64 ->
    
    PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit armv7s ->
2016-10-24 21:22:32 +0000  Validating IPA structure...
2016-10-24 21:22:33 +0000  error: Failed to verify bitcode in PebbleKit.framework/PebbleKit:
error: Cannot extract bundle from /var/folders/2z/9hxxyf0s0pg5pj0s133yfhsw0000gn/T/IDEDistributionThinningStep.OEs/Payload/PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit (i386)

2016-10-24 21:22:33 +0000 [MT] /Applications/Xcode-8.app/Contents/Developer/usr/bin/ipatool exited with 1
2016-10-24 21:22:33 +0000 [MT] ipatool JSON: {
    alerts =     (
                {
            code = 2554;
            description = "Configuration issue: platform AppleTVSimulator.platform doesn't have any non-simulator SDKs; ignoring it";
            info =             {
            };
            level = WARN;
        },
                {
            code = 2554;
            description = "Configuration issue: platform iPhoneSimulator.platform doesn't have any non-simulator SDKs; ignoring it";
            info =             {
            };
            level = WARN;
        },
                {
            code = 2554;
            description = "Configuration issue: platform WatchSimulator.platform doesn't have any non-simulator SDKs; ignoring it";
            info =             {
            };
            level = WARN;
        },
                {
            code = 260;
            description = "Failed to resolve rpath for PebbleKit: Could not resolve @executable_path for @executable_path/Frameworks from PebbleKit";
            info =             {
            };
            level = WARN;
        },
                {
            code = 260;
            description = "Failed to resolve rpath for PebbleKit: Could not resolve @executable_path for @executable_path/Frameworks from PebbleKit";
            info =             {
            };
            level = WARN;
        },
                {
            code = 260;
            description = "Failed to resolve rpath for PebbleKit: Could not resolve @executable_path for @executable_path/Frameworks from PebbleKit";
            info =             {
            };
            level = WARN;
        },
                {
            code = 0;
            description = "Failed to verify bitcode in PebbleKit.framework/PebbleKit:\nerror: Cannot extract bundle from /var/folders/2z/9hxxyf0s0pg5pj0s133yfhsw0000gn/T/IDEDistributionThinningStep.OEs/Payload/PebbleBitcode.app/Frameworks/PebbleKit.framework/PebbleKit (i386)\n\n";
            info =             {
            };
            level = ERROR;
            type = "malformed-payload";
        }
    );
}
```
