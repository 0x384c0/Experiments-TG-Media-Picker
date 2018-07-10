#  Setup
* copy SSignalKit to thirdparty/
* copy LegacyComponents to submodules/
* add them as  subprojects
* add LegacyComponentsResources.bundle to project
* add  this code to Swift Bridging Header
`
#import <SSignalKit/SSignalKit.h>
#import <LegacyComponents/LegacyComponents.h>
`
* add to header search path in project
`
$(PROJECT_DIR)/submodules/LegacyComponents
$(PROJECT_DIR)/thirdparty/SSignalKit
`
* add -all_load to Other Likner Flags
