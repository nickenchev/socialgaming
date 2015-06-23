//
//  SocialGamingManager.h
//  triptych
//
//  Created by Nick Enchev on 2015-06-23.
//
//

#ifndef __triptych__SocialGamingManager__
#define __triptych__SocialGamingManager__

#include "SocialGamingProvider.h"

using namespace std;

class SocialGamingManager
{
    void *presenter;
    unique_ptr<SocialGamingProvider> provider;
    
    SocialGamingManager() { /*hidden constructor*/ }
    
public:
    static SocialGamingManager &sharedInstance()
    {
        static SocialGamingManager instance;
        return instance;
    }
    
    void setPresenter(void *presenter) { this->presenter = presenter; }
    void setProvider(unique_ptr<SocialGamingProvider> provider) { this->provider = std::move(provider); }
    SocialGamingProvider *getProvider() const { return provider.get(); }
    
    void authenticate() { provider->authenticate(presenter); }
    void reportScore(double score) { provider->reportScore(score, presenter); }
};

#endif /* defined(__triptych__SocialGamingManager__) */
