//
//  SocialGamingGameCenter.cpp
//  triptych
//
//  Created by Nick Enchev on 2015-06-23.
//
//

#include <Foundation/Foundation.h>
#include "GameCenterProvider.h"
#include "SocialGamingGameCenter.h"

void GameCenterProvider::authenticate(void *presenter)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        SocialGamingGameCenter *gameCenter = [SocialGamingGameCenter sharedInstance];
        [gameCenter authenticatePlayer:(UIViewController *)presenter];
    });
}

void GameCenterProvider::reportScore(double score, void *presenter)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        SocialGamingGameCenter *gameCenter = [SocialGamingGameCenter sharedInstance];
        [gameCenter reportScore:score andViewController:(UIViewController *)presenter];
    });
}