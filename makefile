include ./../../../global.mk

PLATFORM=
BIN_PATH = ..\\..\\..\\bin\\$(PLATFORM)


####nt_i386_sln####


nt_i386_sln:
	devenv /build Release acispartviewer.vcproj

nt_i386_sln-debug:
	devenv /build Debug acispartviewer.vcproj


####nt_i386_vc80####


nt_i386_vc80:
	devenv /build "Release|Win32" acispartviewer_vc80.vcproj

nt_i386_vc80-debug:
	devenv /build "Debug|Win32" acispartviewer_vc80.vcproj

nt_i386_vc80-QA:
	devenv /build "Release|Win32" acispartviewer_QA_vc80.vcproj

nt_i386_vc80-debug-QA:
	devenv /build "Debug|Win32" acispartviewer_QA_vc80.vcproj


####nt_i386_vc90####


nt_i386_vc90:
	devenv /build "Release|Win32" acispartviewer_vc90.vcproj

nt_i386_vc90-debug:
	devenv /build "Debug|Win32" acispartviewer_vc90.vcproj

nt_i386_vc90-QA:
	devenv /build "Release|Win32" acispartviewer_QA_vc90.vcproj

nt_i386_vc90-debug-QA:
	devenv /build "Debug|Win32" acispartviewer_QA_vc90.vcproj


####nt_i386_icl####

nt_i386_icl:
	MSDEV acispartviewer.dsp /MAKE "acispartviewer - Win32 Release"

nt_i386_icl-debug:
	MSDEV acispartviewer.dsp /MAKE "acispartviewer - Win32 Debug"


acispartviewer: ha_bridge-$(PLATFORM) acis-$(PLATFORM)
acispartviewerd: ha_bridged-$(PLATFORM) acisd-$(PLATFORM)
acispartviewer_LEAD_TOOLS: ha_bridge-$(PLATFORM) acis-$(PLATFORM) lead_tools
acispartviewerd_LEAD_TOOLS: ha_bridged-$(PLATFORM) acisd-$(PLATFORM) lead_tools
acispartviewer_interop: ha_bridge-$(PLATFORM) interop-$(PLATFORM)
acispartviewerd_interop: ha_bridged-$(PLATFORM) interopd-$(PLATFORM)

#
# 3rd party publishing
#

## LEAD TOOLS
lead_tools:
	if not exist "$(BIN_PATH)\\LFCMP13n.DLL" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\LFCMP13n.DLL" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\ltfil13n.DLL" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\ltfil13n.DLL" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\ltkrn13n.DLL" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\NONAGKRN\\ltkrn13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lffax13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lffax13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\LTCLR13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\LTCLR13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lftif13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lftif13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lfjbg13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lfjbg13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lflmb13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lflmb13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lfbmp13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lfbmp13n.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\lfpcx13n.dll" copy "$(LEAD_TOOLS_INSTALL_DIR)\\Redist\\lfpcx13n.dll" $(BIN_PATH)


## ACIS on VC71

ha_bridge-nt_i386_sln:
	set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean Release "$(A3DT)\src\ha_bridge\ha_bridge.vcproj"
	-devenv /build Release "$(A3DT)\src\ha_bridge\ha_bridge.vcproj"

ha_bridged-nt_i386_sln:
	if not exist "$(HOOPS_INSTALL_DIR)\makefile" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean Debug "$(A3DT)\src\ha_bridge\ha_bridge.vcproj"
	-devenv /build Debug "$(A3DT)\src\ha_bridge\ha_bridge.vcproj"

acis_noforce-nt_i386_sln:
	if not exist "$(BIN_PATH)\\SpaHBridgen.dll" copy "$(A3DT)\\bin\\NT_NET_DLL\\SpaHBridgen.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACISn.dll" copy "$(A3DT)\\bin\\NT_NET_DLL\\SpaACISn.dll" $(BIN_PATH)

acis-nt_i386_sln:
	copy "$(A3DT)\\bin\\NT_NET_DLL\\SpaHBridgen.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_NET_DLL\\SpaACISn.dll" $(BIN_PATH)

acisd_noforce-nt_i386_sln:
	if not exist "$(BIN_PATH)\\SpaHBridgend.dll" copy "$(A3DT)\\bin\\NT_NET_DLLD\\SpaHBridgend.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACISnd.dll" copy "$(A3DT)\\bin\\NT_NET_DLLD\\SpaACISnd.dll" $(BIN_PATH)

acisd-nt_i386_sln:
	copy "$(A3DT)\\bin\\NT_NET_DLLD\\SpaHBridgend.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_NET_DLLD\\SpaACISnd.dll" $(BIN_PATH)


## ACIS on VC80

ha_bridge-nt_i386_vc80:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	@echo $(HOOPS_INSTALL_DIR)
	-devenv /clean "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc8.vcproj"
	-devenv /build "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc8.vcproj"

ha_bridged-nt_i386_vc80:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc8.vcproj"
	-devenv /build "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc8.vcproj"

acis_noforce-nt_i386_vc80:
	if not exist "$(BIN_PATH)\\SpaHBridge.dll" copy "$(A3DT)\\bin\\NT_VC8_DLL\\SpaHBridge.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACIS.dll" copy "$(A3DT)\\bin\\NT_VC8_DLL\\SpaACIS.dll" $(BIN_PATH)

acis-nt_i386_vc80:
	copy "$(A3DT)\\bin\\NT_VC8_DLL\\SpaHBridge.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_VC8_DLL\\SpaACIS.dll" $(BIN_PATH)

acisd_noforce-nt_i386_vc80:
	if not exist "$(BIN_PATH)d\\SpaHBridged.dll" copy "$(A3DT)\\bin\\NT_VC8_DLLD\\SpaHBridged.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)d\\SpaACISd.dll" copy "$(A3DT)\\bin\\NT_VC8_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"

acisd-nt_i386_vc80:
	copy "$(A3DT)\\bin\\NT_VC8_DLLD\\SpaHBridged.dll" "$(BIN_PATH)d"
	copy "$(A3DT)\\bin\\NT_VC8_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


ha_bridge-nt_x64_vc80:
	if not exist "$(HOOPS_INSTALL_DIR)\makefile" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Release|x64" "$(A3DT)\src\ha_bridge\ha_bridge_amd_64.vcproj"
	-devenv /build "Release|x64" "$(A3DT)\src\ha_bridge\ha_bridge_amd_64.vcproj"

ha_bridged-nt_x64_vc80:
	if not exist "$(HOOPS_INSTALL_DIR)\makefile" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Debug|x64" "$(A3DT)\src\ha_bridge\ha_bridge_amd_64.vcproj"
	-devenv /build "Debug|x64" "$(A3DT)\src\ha_bridge\ha_bridge_amd_64.vcproj"

acis_noforce-nt_x64_vc80:
	if not exist "$(BIN_PATH)\\SpaHBridge.dll" copy "$(A3DT)\\bin\\NT_AMD_64_DLL\\SpaHBridge.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACIS.dll" copy "$(A3DT)\\bin\\NT_AMD_64_DLL\\SpaACIS.dll" $(BIN_PATH)

acis-nt_x64_vc80:
	copy "$(A3DT)\\bin\\NT_AMD_64_DLL\\SpaHBridge.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_AMD_64_DLL\\SpaACIS.dll" $(BIN_PATH)

acisd_noforce-nt_x64_vc80:
	if not exist "$(BIN_PATH)d\\SpaHBridged.dll" copy "$(A3DT)\\bin\\NT_AMD_64_DLLD\\SpaHBridged.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)d\\SpaACISd.dll" copy "$(A3DT)\\bin\\NT_AMD_64_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"

acisd-nt_x64_vc80:
	copy "$(A3DT)\\bin\\NT_AMD_64_DLLD\\SpaHBridged.dll" "$(BIN_PATH)d"
	copy "$(A3DT)\\bin\\NT_AMD_64_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


## ACIS on VC90

ha_bridge-nt_i386_vc90:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	@echo $(HOOPS_INSTALL_DIR)
	-devenv /clean "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc9.vcproj"
	-devenv /build "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc9.vcproj"

ha_bridged-nt_i386_vc90:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc9.vcproj"
	-devenv /build "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc9.vcproj"

acis_noforce-nt_i386_vc90:
	if not exist "$(BIN_PATH)\\SpaHBridge.dll" copy "$(A3DT)\\bin\\NT_VC9_DLL\\SpaHBridge.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACIS.dll" copy "$(A3DT)\\bin\\NT_VC9_DLL\\SpaACIS.dll" $(BIN_PATH)

acis-nt_i386_vc90:
	copy "$(A3DT)\\bin\\NT_VC9_DLL\\SpaHBridge.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_VC9_DLL\\SpaACIS.dll" $(BIN_PATH)

acisd_noforce-nt_i386_vc90:
	if not exist "$(BIN_PATH)d\\SpaHBridged.dll" copy "$(A3DT)\\bin\\NT_VC9_DLLD\\SpaHBridged.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)d\\SpaACISd.dll" copy "$(A3DT)\\bin\\NT_VC9_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


acisd-nt_i386_vc90:
	copy "$(A3DT)\\bin\\NT_VC9_DLLD\\SpaHBridged.dll" "$(BIN_PATH)d"
	copy "$(A3DT)\\bin\\NT_VC9_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


ha_bridge-nt_x64_vc90:
	if not exist "$(HOOPS_INSTALL_DIR)\makefile" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Release|x64" "$(A3DT)\src\ha_bridge\ha_bridge_vc9_64.vcproj"
	-devenv /build "Release|x64" "$(A3DT)\src\ha_bridge\ha_bridge_vc9_64.vcproj"

ha_bridged-nt_x64_vc90:
	if not exist "$(HOOPS_INSTALL_DIR)\makefile" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Debug|x64" "$(A3DT)\src\ha_bridge\ha_bridge_vc9_64.vcproj"
	-devenv /build "Debug|x64" "$(A3DT)\src\ha_bridge\ha_bridge_vc9_64.vcproj"

acis_noforce-nt_x64_vc90:
	if not exist "$(BIN_PATH)\\SpaHBridge.dll" copy "$(A3DT)\\bin\\NT_VC9_64_DLL\\SpaHBridge.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)\\SpaACIS.dll" copy "$(A3DT)\\bin\\NT_VC9_64_DLL\\SpaACIS.dll" $(BIN_PATH)


acis-nt_x64_vc90:
	copy "$(A3DT)\\bin\\NT_VC9_64_DLL\\SpaHBridge.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_VC9_64_DLL\\SpaACIS.dll" $(BIN_PATH)


acisd_noforce-nt_x64_vc90:
	if not exist "$(BIN_PATH)d\\SpaHBridged.dll" copy "$(A3DT)\\bin\\NT_VC9_64_DLLD\\SpaHBridged.dll" $(BIN_PATH)
	if not exist "$(BIN_PATH)d\\SpaACISd.dll" copy "$(A3DT)\\bin\\NT_VC9_64_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"

acisd-nt_x64_vc90:
	copy "$(A3DT)\\bin\\NT_VC9_64_DLLD\\SpaHBridged.dll" "$(BIN_PATH)d"
	copy "$(A3DT)\\bin\\NT_VC9_64_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


## ACIS on VC10

ha_bridge-nt_i386_vc10:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	@echo $(HOOPS_INSTALL_DIR)
	-devenv /clean "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc10.vcxproj"
	-devenv /build "Release|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc10.vcxproj"

ha_bridged-nt_i386_vc10:
	if not exist "$(HOOPS_INSTALL_DIR)" set HOOPS_INSTALL_DIR=$(MAKEDIR)\..\..\..
	-devenv /clean "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc10.vcxproj"
	-devenv /build "Debug|Win32" "$(A3DT)\src\ha_bridge\ha_bridge_vc10.vcxproj"

acis-nt_i386_vc10:
	copy "$(A3DT)\\bin\\NT_VC10_DLL\\SpaHBridge.dll" $(BIN_PATH)
	copy "$(A3DT)\\bin\\NT_VC10_DLL\\SpaACIS.dll" $(BIN_PATH)

acisd-nt_i386_vc10:
	copy "$(A3DT)\\bin\\NT_VC10_DLLD\\SpaHBridged.dll" "$(BIN_PATH)d"
	copy "$(A3DT)\\bin\\NT_VC10_DLLD\\SpaACISd.dll" "$(BIN_PATH)d"


## INTEROP VC8 ##

interop-nt_i386_vc80:
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXAcisBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXInterop.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXGeneric.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXGeometryRepresentation.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\SPAXAssemblyRep.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\xmil.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC8_DLL\\xcore2k.dll" $(BIN_PATH)

interopd-nt_i386_vc80:
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXAcisBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXInteropd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXGenericd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXGeometryRepresentationd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\SPAXAssemblyRepd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\xmild.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC8_DLLD\\xcore2kd.dll" "$(BIN_PATH)d"


interop-nt_x64_vc80:
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXAcisBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXInterop.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXGeneric.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXGeometryRepresentation.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\SPAXAssemblyRep.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\xmil.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_AMD_64_DLL\\xcore2k.dll" $(BIN_PATH)


interopd-nt_x64_vc80:
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXAcisBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXInteropd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXGenericd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXGeometryRepresentationd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\SPAXAssemblyRepd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\xmild.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_AMD_64_DLLD\\xcore2kd.dll" "$(BIN_PATH)d"


## INTEROP VC9 ##
interop-nt_i386_vc90:
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXAcisBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXInterop.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXGeneric.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXGeometryRepresentation.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\SPAXAssemblyRep.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\xmil.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_DLL\\xcore2k.dll" $(BIN_PATH)

interopd-nt_i386_vc90:
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXAcisBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXInteropd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXGenericd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXGeometryRepresentationd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\SPAXAssemblyRepd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\xmild.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_DLLD\\xcore2kd.dll" "$(BIN_PATH)d"


interop-nt_x64_vc90:
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXAcisBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXBase.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXInterop.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXGeneric.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXGeometryRepresentation.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\SPAXAssemblyRep.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\xmil.dll" $(BIN_PATH)
	copy "$(X3DT)\\bin\\NT_VC9_64_DLL\\xcore2k.dll" $(BIN_PATH)


interopd-nt_x64_vc90:
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXAcisBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXBased.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXInteropd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXGenericd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXGeometryRepresentationd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\SPAXAssemblyRepd.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\xmild.dll" "$(BIN_PATH)d"
	copy "$(X3DT)\\bin\\NT_VC9_64_DLLD\\xcore2kd.dll" "$(BIN_PATH)d"
