//
//  SocialGaming.h
//  triptych
//
//  Created by Nick Enchev on 2015-06-22.
//
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface SocialGamingGameCenter : NSObject<GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GKGameCenterControllerDelegate>

@property (nonatomic, copy) NSString *defaultLeaderboard;
@property (nonatomic, assign) BOOL gameCenterEnabled;

+ (id)sharedInstance;

- (void)authenticatePlayer:(UIViewController *)viewController;
- (void)showLeaderboard:(UIViewController *)viewController;
- (void)showAchievements:(UIViewController *)viewController;
- (void)reportScore:(double)score andViewController:(UIViewController *)viewController;

@end
