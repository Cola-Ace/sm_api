#include <sourcemod>
#include <cstrike>
#include <sdktools>
#include "include/api.inc"

#pragma newdecls required
#pragma semicolon 1

Handle g_hOnSetSkin,
g_hOnSetSkinSeed,
g_hOnSetSkinWear,
g_hOnSetWeaponStatTrak,
g_hOnSetWeaponCustomName,
g_hOnSetWeaponOwner;

public Plugin myinfo = {
    name = "API - Main",
    author = "Xc_ace",
    description = "A api system for developer, make more convenient",
    version = "0.1 beta",
    url = "https://github.com/Cola-Ace/sm_api"
}

public void OnPluginStart(){
    g_hOnSetSkin = CreateGlobalForward("API_OnSetSkin", ET_Event, Param_Cell, Param_Cell, Param_Cell);
    g_hOnSetSkinSeed = CreateGlobalForward("API_OnSetSkinSeed", ET_Event, Param_Cell, Param_Cell, Param_Cell);
    g_hOnSetSkinWear = CreateGlobalForward("API_OnSetSkinWear", ET_Event, Param_Cell, Param_Cell, Param_Cell);
    g_hOnSetWeaponStatTrak = CreateGlobalForward("API_OnSetWeaponStatTrak", ET_Event, Param_Cell, Param_Cell, Param_Cell);
    g_hOnSetWeaponCustomName = CreateGlobalForward("API_OnSetWeaponCustomName", ET_Event, Param_Cell, Param_Cell, Param_String);
    g_hOnSetWeaponOwner = CreateGlobalForward("API_OnSetWeaponOwner", ET_Event, Param_Cell, Param_Cell, Param_Cell);
}


public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max){
    CreateNative("API_SetWeaponSkin", Native_SetWeaponSkin);
    CreateNative("API_SetSkinWear", Native_SetSkinWear);
    CreateNative("API_SetSkinSeed", Native_SetSkinSeed);
    CreateNative("API_SetWeaponStatTrak", Native_SetWeaponStatTrak);
    CreateNative("API_SetWeaponCustomName", Native_SetWeaponCustomName);
    CreateNative("API_SetWeaponOwner", Native_SetWeaponOwner);

    RegPluginLibrary("api");

    return APLRes_Success;
}

public int Native_SetWeaponOwner(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    int index = GetNativeCell(3);
    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetWeaponOwner);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushCell(index);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    SetEntProp(entity, Prop_Send, "m_hOwnerEntity", index);
}

public int Native_SetWeaponCustomName(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    char name[256];
    int len = 0;
    FormatNativeString(0, 2, 3, sizeof(name), len, name);

    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetWeaponCustomName);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushString(name);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    SetEntDataString(entity, FindSendPropInfo("CBaseAttributableItem", "m_szCustomName"), name, sizeof(name));
}

public int Native_SetWeaponStatTrak(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    int index = GetNativeCell(3);
    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetWeaponStatTrak);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushCell(index);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    SetEntProp(entity, Prop_Send, "m_nFallbackStatTrak", index);
}

public int Native_SetSkinSeed(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    int index = GetNativeCell(3);
    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetSkinSeed);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushCell(index);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    SetEntProp(entity, Prop_Send, "m_nFallbackSeed", index);
}

public int Native_SetSkinWear(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    float index = GetNativeCell(3);
    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetSkinWear);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushCell(index);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    SetEntPropFloat(entity, Prop_Send, "m_flFallbackWear", index);
}

public int Native_SetWeaponSkin(Handle plugin, int numParams){
    int client = GetNativeCell(1);
    int entity = GetNativeCell(2);
    if (!IsValidEntity(entity)){
        LogError("Entity %d is not a valid entity.", entity);
        return;
    }
    int index = GetNativeCell(3);
    Action action = Plugin_Continue;
    Call_StartForward(g_hOnSetSkin);
    Call_PushCell(client);
    Call_PushCell(entity);
    Call_PushCell(index);
    Call_Finish(action);
    if (action != Plugin_Continue) return;

    static int highID = 16384;
    SetEntProp(entity, Prop_Send, "m_iItemIDLow", -1);
    SetEntProp(entity, Prop_Send, "m_iItemIDHigh", highID++);

    SetEntProp(entity, Prop_Send, "m_nFallbackPaintKit", index);
}