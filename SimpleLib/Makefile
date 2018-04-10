EMBEDDINATOR_PATH ?= ~/Programming/Embeddinator-4000
PACKAGE_VERSION := $(shell grep "var version" $(EMBEDDINATOR_PATH)/build/Packaging.cake | cut -d \" -f 4)
NUGET = $(EMBEDDINATOR_PATH)/build/Embeddinator-4000.$(PACKAGE_VERSION).nupkg
NUGET_LOCAL = ~/nuget/

all:: objc-mac objc-ios java-android

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
	rm -rf CSharp/packages/

objc-mac:: setup-nuget csharp
	CSharp/packages/Embeddinator-4000.$(PACKAGE_VERSION)/tools/objcgen -o binding-objc-mac -c CSharp/SimpleLib/bin/Debug/SimpleLib.dll --p=macos-modern --abi=x86_64 --debug
	rm -rf ObjC/SimpleConsumer-macOS/Framework/
	mkdir -p ObjC/SimpleConsumer-macOS/Framework/
	cp -R binding-objc-mac/SimpleLib.framework ObjC/SimpleConsumer-macOS/Framework/
	xcodebuild -project ObjC/SimpleConsumer-macOS/SimpleConsumer-macOS.xcodeproj
	open ObjC/SimpleConsumer-macOS/SimpleConsumer-macOS.xcodeproj

clean-objc-mac::
	rm -rf binding-objc-mac/
	rm -rf ObjC/SimpleConsumer-macOS/Framework/
	xcodebuild -project ObjC/SimpleConsumer-macOS/SimpleConsumer-macOS.xcodeproj clean

objc-ios:: setup-nuget csharp
	CSharp/packages/Embeddinator-4000.$(PACKAGE_VERSION)/tools/objcgen -o binding-objc-ios -c CSharp/SimpleLib-iOS/bin/Debug/SimpleLib-iOS.dll --p=ios --debug

clean-objc-ios::
	rm -rf binding-objc-ios

java-android:: setup-nuget csharp
	mono ./CSharp/packages/Embeddinator-4000.0.4.0/tools/Embeddinator-4000.exe -o binding-java-android -c CSharp/SimpleLib-Android/bin/Debug/SimpleLib-Android.dll --p=Android --t=shared --gen=Java --debug

clean-java-android::
	rm -rf binding-java-android
