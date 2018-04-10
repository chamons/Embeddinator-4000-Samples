EMBEDDINATOR_PATH ?= ~/Programming/Embeddinator-4000
PACKAGE_VERSION := $(shell grep "var version" $(EMBEDDINATOR_PATH)/build/Packaging.cake | cut -d \" -f 4)
NUGET = $(EMBEDDINATOR_PATH)/build/Embeddinator-4000.$(PACKAGE_VERSION).nupkg
NUGET_LOCAL = ~/nuget/

all:: setup-nuget csharp objc-mac objc-ios java-android

clean:: clean-nuget clean-csharp clean-objc-mac clean-objc-ios clean-java-android

$(NUGET_LOCAL):
	@echo 

csharp:: 
	msbuild /nologo /v:quiet CSharp/SimpleLib.sln

clean-csharp:: 
	msbuild /nologo /v:quiet CSharp/SimpleLib.sln /t:clean

setup-nuget::
	@if ! [ -d $(NUGET_LOCAL) ]; then echo "Setup a local nuget feed to ~/nuget" && exit 1; fi
	cp $(NUGET) $(NUGET_LOCAL)
	nuget install Embeddinator-4000 -Version $(PACKAGE_VERSION) -SolutionDirectory CSharp/

clean-nuget::
	rm -r CSharp/packages/

objc-mac::
	CSharp/packages/Embeddinator-4000.$(PACKAGE_VERSION)/tools/objcgen -o binding-objc-mac -c CSharp/SimpleLib/bin/Debug/SimpleLib.dll --p=macos-modern --abi=x86_64 

clean-objc-mac::
	rm -r binding-objc-mac

objc-ios::
	CSharp/packages/Embeddinator-4000.$(PACKAGE_VERSION)/tools/objcgen -o binding-objc-ios -c CSharp/SimpleLib-iOS/bin/Debug/SimpleLib-iOS.dll --p=ios

clean-objc-ios::
	rm -r binding-objc-ios

java-android::
	mono ./CSharp/packages/Embeddinator-4000.0.4.0/tools/Embeddinator-4000.exe -o binding-java-android -c CSharp/SimpleLib-Android/bin/Debug/SimpleLib-Android.dll --p=Android --t=shared --gen=Java

clean-java-android::
	rm -r binding-java-android
