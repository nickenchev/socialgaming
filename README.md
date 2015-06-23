# SocialGaming Framework
Cocos2d-x SocialGaming allows developers to handle Game Centre &amp; Google Play Services with a single C++ wrapper.

iOS:
1. Include the require files into your iOS project.

SocialGamingGameCenter.m
SocialGamingGameCenter.h


2. Add these files to your C++ classes

SocialGamingProvider.h
GameCenterProvider.mm
GameCenterProvider.h
SocialGamingManager.cpp
SocialGamingManager.h


3. Provide the following imports into AppDelegate or AppController (cocos2d-x)

#import "SocialGamingManager.h"
#import "GameCenterProvider.h"


4. Add these lines somewhere in your didFinishLaunchingWithOptions

//make sure the manager is using the correct provider
SocialGamingManager::sharedInstance().setProvider(unique_ptr<GameCenterProvider>(new GameCenterProvider));
//tell the manager which presenter (view controller) it should use
SocialGamingManager::sharedInstance().setPresenter(self.viewController);
