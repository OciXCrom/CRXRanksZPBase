#include <amxmodx>

#tryinclude <crxranks>

#if !defined _crxranks_included
	#error "crxranks.inc" is missing in your "scripting/include" folder. Download it from: "https://amxx-bg.info/inc/"
#endif

#tryinclude <zombieplague>

#if !defined _zombieplague_included
	#error "zombieplague.inc" is missing in your "scripting/include" folder. Download it from: "https://amxx-bg.info/inc/"
#endif

new const PLUGIN_VERSION[] = "1.0"

public plugin_init()
{
	register_plugin("CRXRanks: ZP 4.3 Base", PLUGIN_VERSION, "OciXCrom")
	register_cvar("CRXRanksZP43", PLUGIN_VERSION, FCVAR_SERVER|FCVAR_SPONLY|FCVAR_UNLOGGED)
}

public zp_user_humanized_post(id, iSurvivor)
{
	crxranks_give_user_xp(id, _, iSurvivor ? "zp_became_survivor" : "zp_cured", CRXRANKS_XPS_REWARD)
}

public zp_user_infected_post(id, iInfector, iNemesis)
{
	crxranks_give_user_xp(id, _, iNemesis ? "zp_became_nemesis" : "zp_infected", CRXRANKS_XPS_REWARD)

	if(iInfector)
	{
		crxranks_give_user_xp(iInfector, _, "zp_infect_player", CRXRANKS_XPS_REWARD)
	}
}

public zp_user_last_human(id)
{
	crxranks_give_user_xp(id, _, "zp_last_human", CRXRANKS_XPS_REWARD)
}

public zp_user_last_zombie(id)
{
	crxranks_give_user_xp(id, _, "zp_last_zombie", CRXRANKS_XPS_REWARD)
}