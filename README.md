# SocialGaming Framework

SocialGaming is a small framework that allows native iOS/Android games developed with C++ (cocos2d-x) to leverage Game Center and Google Play for things like Leaderboards and Achievements. It was built for the game "Triptych" which is available for [iOS](https://itunes.apple.com/us/app/triptych/id919010963?ls=1&mt=8) and [Android](https://play.google.com/store/apps/details?id=com.ensoft.games.triptych).

## iOS Instructions

Include the following files into your iOS project:

 	* ios/GameCenterProvider.h
 	* ios/GameCenterProvider.mm
 	* ios/SocialGamingGameCenter.h
 	* ios/SocialGamingGameCenter.m

Add these files to your C++ project

 	* cpp/SocialGamingManager.cpp
 	* cpp/SocialGamingManager.h
 	* cpp/SocialGamingProvider.h

Provide the following imports into AppDelegate or AppController (cocos2d-x)

```objective-c
#import "SocialGamingManager.h"
#import "GameCenterProvider.h"
```

Add these lines somewhere in your didFinishLaunchingWithOptions
```cpp
//make sure the manager is using the correct provider
SocialGamingManager::sharedInstance().setProvider(unique_ptr<GameCenterProvider>(new GameCenterProvider));
//tell the manager which presenter (view controller) it should use
SocialGamingManager::sharedInstance().setPresenter(self.viewController);
```

##C++ Instructions
Include the following:
```cpp
 #include "SocialGamingManager.h"
 ```

Authenticate the player:
```cpp
SocialGamingManager::sharedInstance().authenticate();
```

Report the player's score
```cpp
SocialGamingManager::sharedInstance().reportScore(highScore);
```

Show the player's default leaderboard
```cpp
SocialGamingManager::sharedInstance().showLeaderboard();
```