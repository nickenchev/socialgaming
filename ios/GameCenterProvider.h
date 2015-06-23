//
//  SocialGamingGameCenter.h
//  triptych
//
//  Created by Nick Enchev on 2015-06-23.
//
//

#ifndef __triptych__SocialGamingGameCenter__
#define __triptych__SocialGamingGameCenter__

#include "SocialGamingProvider.h"

class GameCenterProvider : public SocialGamingProvider
{
public:
    void authenticate(void *presenter);
    void reportScore(double score, void *presenter);
};

#endif /* defined(__triptych__SocialGamingGameCenter__) */
