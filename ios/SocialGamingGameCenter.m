//
//  SocialGaming.m
//  triptych
//
//  Created by Nick Enchev on 2015-06-22.
//
//

#import <GameKit/GameKit.h>
#import "SocialGamingGameCenter.h"

@interface SocialGamingGameCenter()

@property (nonatomic, weak) UIViewController *viewController;

@end

@implementation SocialGamingGameCenter

+ (id)sharedInstance
{
    static SocialGamingGameCenter *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (void)authenticatePlayer:(UIViewController *)viewController
{
    GKLocalPlayer *player = [GKLocalPlayer localPlayer];
    player.authenticateHandler = ^(UIViewController *viewController, NSError *error) {
        if (!error)
        {
            if (viewController)
            {
                [self.viewController presentViewController:viewController animated:YES completion:nil];
            }
            else
            {
                GKLocalPlayer *player = [GKLocalPlayer localPlayer];
                if (player.authenticated)
                {
                    self.gameCenterEnabled = YES;
                    [player loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                        if (!error)
                        {
                            self.defaultLeaderboard = leaderboardIdentifier;
                        }
                    }];
                }
                else
                {
                    self.gameCenterEnabled = NO;
                }
            }
        }
        else
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    };
}

- (void)showLeaderboard:(UIViewController *)viewController
{
    if (self.gameCenterEnabled)
    {
        GKGameCenterViewController *gcController = [[GKGameCenterViewController alloc] init];
        gcController.gameCenterDelegate = self;
        gcController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcController.leaderboardIdentifier = self.defaultLeaderboard;
        
        [self.viewController presentViewController:gcController animated:YES completion:nil];
    }
}

- (void)showAchievements:(UIViewController *)viewController
{
    if (self.gameCenterEnabled)
    {
        GKGameCenterViewController *gcController = [[GKGameCenterViewController alloc] init];
        gcController.gameCenterDelegate = self;
        gcController.viewState = GKGameCenterViewControllerStateAchievements;
        gcController.leaderboardIdentifier = self.defaultLeaderboard;
        
        [self.viewController presentViewController:gcController animated:YES completion:nil];
    }
}

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)reportScore:(double)score andViewController:(UIViewController *)viewController
{
    GKScore *gkScore = [[GKScore alloc] initWithLeaderboardIdentifier:self.defaultLeaderboard];
    gkScore.value = score;
    
    [gkScore reportScoreWithCompletionHandler:^(NSError *error) {
        if (error)
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

@end
