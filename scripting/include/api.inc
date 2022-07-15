#if defined _api_included
    #endinput
#endif
#define _api_included


/*
 * Call when skin has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param index skin index.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetSkin(int client, int entity, int skin);

/*
 * Call when skin seed has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param index seed index.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetSkinSeed(int client, int entity, int skin);

/*
 * Call when skin wear has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param wear wear value.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetSkinWear(int client, int entity, float skin);

/*
 * Call when weapon stattrak has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param count stattrak count.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetWeaponStatTrak(int client, int entity, int count);

/*
 * Call when weapon custom name has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param name custom name.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetWeaponCustomName(int client, int entity, const char[] name);

/*
 * Call when weapon owner has been set.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param owner owner client index.
 * 
 * @return return Plugin_Stop to stop it.
 */
forward Action API_OnSetWeaponOwner(int client, int entity, int owner);

/********************** Native **********************/

/*
 * Set client weapon skin. (You need to call it when weapon's name has been given)
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param index skin index.
 */
native void API_SetWeaponSkin(int client, int entity, int index);

/*
 * Set client weapon skin wear.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param wear wear value.
 */
native void API_SetSkinWear(int client, int entity, float wear);

/*
 * Set client weapon skin seed.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param seed seed index.
 */
native void API_SetSkinSeed(int client, int entity, int seed);

/*
 * Set client weapon stattrak.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param count stattrak count.
 */
native void API_SetWeaponStatTrak(int client, int entity, int count);

/*
 * Set client weapon custom name.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param name custom name.
 */
native void API_SetWeaponCustomName(int client, int entity, const char[] name);

/*
 * Set client weapon owmer.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param owner owner client index.
 */
native void API_SetWeaponOwner(int client, int entity, int owner);

/*
 * Set client weapon skin.
 *
 * @param client client index.
 * @param entity weapon entity.
 * @param slot sticker slot.
 * @param index sticker index.
 */
native void API_SetWeaponSticker(int client, int entity, int slot, int index);

#if !defined REQUIRE_PLUGIN
public __pl_api_SetNTVOptional(){
    MarkNativeAsOptional("API_SetWeaponSkin");
    MarkNativeAsOptional("API_SetSkinWear");
    MarkNativeAsOptional("API_SetSkinSeed");
    MarkNativeAsOptional("API_SetWeaponStatTrak");
    MarkNativeAsOptional("API_SetWeaponCustomName");
    MarkNativeAsOptional("API_SetWeaponOwner");
    MarkNativeAsOptional("API_SetWeaponSticker")
}
#endif