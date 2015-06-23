//
//  SocialGamingProvider.h
//  triptych
//
//  Created by Nick Enchev on 2015-06-23.
//
//

#ifndef __triptych__SocialGamingProvider__
#define __triptych__SocialGamingProvider__

#include <stdio.h>

class SocialGamingProvider
{
public:
    virtual void authenticate(void *presenter) = 0;
    virtual void reportScore(double score, void *presenter) = 0;
};

#endif /* defined(__triptych__SocialGamingProvider__) */
