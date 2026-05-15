package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewYearEntityFunc func(client *FooterYearUpdateSDK, entopts map[string]any) FooterYearUpdateEntity

