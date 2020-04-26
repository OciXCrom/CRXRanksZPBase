#include <amxmodx>

#tryinclude <crxranks>

#if !defined _crxranks_included
	#error "crxranks.inc" is missing in your "scripting/include" folder. Download it from: "https://amxx-bg.info/inc/"
#endif

#tryinclude <zp50_core>

#if !defined _zp50_core_included
	#error "zp50_core.inc" is missing in your "scripting/include" folder. Download it from: "https://amxx-bg.info/inc/"
#endif

new const PLUGIN_VERSION[] = "1.0"

public plugin_init()
{
	register_plugin("CRXRanks: ZP 5.0 Base", PLUGIN_VERSION, "OciXCrom")
	register_cvar("CRXRanksZP50", PLUGIN_VERSION, FCVAR_SERVER|FCVAR_SPONLY|FCVAR_UNLOGGED)
}

public zp_fw_core_cure_post(id, iAttacker)
{
	crxranks_give_user_xp(id, _, id == iAttacker ? "zp_cured_self" : "zp_cured", CRXRANKS_XPS_REWARD)

	if(iAttacker)
	{
		crxranks_give_user_xp(iAttacker, _, "zp_cure_player", CRXRANKS_XPS_REWARD)
	}
}

public zp_fw_core_infect_post(id, iAttacker)
{
	crxranks_give_user_xp(id, _, id == iAttacker ? "zp_infected_self" : "zp_infected", CRXRANKS_XPS_REWARD)

	if(iAttacker)
	{
		crxranks_give_user_xp(iAttacker, _, "zp_infect_player", CRXRANKS_XPS_REWARD)
	}
}

public zp_fw_core_last_human(id)
{
	crxranks_give_user_xp(id, _, "zp_last_human", CRXRANKS_XPS_REWARD)
}

public zp_fw_core_last_zombie(id)
{
	crxranks_give_user_xp(id, _, "zp_last_zombie", CRXRANKS_XPS_REWARD)
}