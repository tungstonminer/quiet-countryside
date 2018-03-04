print("Adding Quiet Countryside Tweaks...");

val Backpack            = <wearablebackpacks:backpack>;
val BeetSeed            = <harvestcraft:beetseeditem>;
val BlizzRod            = <thermalfoundation:material:2048>;
val ClayBucket          = <claybucket:claybucket>;
val ClayWaterBucket     = <claybucket:claybucket:1>;
val Cobblestone         = <minecraft:cobblestone>;
val Cobweb              = <minecraft:web>;
val CoolingCoil         = <toughasnails:temperature_coil:0>;
val CreosoteBottle      = <railcraft:fluid_bottle_creosote>;
val CreosoteBucket      = <forge:bucketFilled>.withTag({FluidName:"creosote", Amount:1000});
val FreezeRod           = <toughasnails:freeze_rod>;
val IceCube             = <toughasnails:ice_cube>;
val MetalBucket         = <minecraft:bucket>;
val MetalWaterBucket    = <minecraft:water_bucket>;
val Rosin               = <thermalfoundation:material:832>;
val Slime               = <minecraft:slime_ball>;
val StainedHardenedClay = <minecraft:stained_hardened_clay>;
val String              = <minecraft:string>;
val Tar                 = <thermalfoundation:material:833>;
val Torch               = <minecraft:torch>;
val ToughFabric         = <immersiveengineering:material:5>;
val StoneTorch          = <tconstruct:stone_torch>;
val WoodenTie           = <railcraft:tie>;
val WoodenWaterBucket   = <harvestcraft:freshwateritem>;

val oreBronzeIngot       = <ore:ingotBronze>;
val oreCopperIngot       = <ore:ingotCopper>;
val oreCactus            = <ore:blockCactus>;
val oreCharcoal          = <ore:charcoal>;
val oreCoal              = <ore:coal>;
val oreCoke              = <ore:fuelCoke>;
val oreColdRod           = <ore:coldRod>;
val oreCreosoteContainer = <ore:creosoteContainer>;
val oreCropBeet          = <ore:cropBeet>;
val oreCropCarrot        = <ore:cropCarrot>;
val oreDiamond           = <ore:gemDiamond>;
val oreEmerald           = <ore:gemEmerald>;
val oreIce               = <ore:blockIce>;
val oreLeather           = <ore:leather>;
val oreQuartz            = <ore:gemQuartz>;
val orePackedIce         = <ore:blockPackedIce>;
val oreRodStone          = <ore:rodStone>;
val oreRubber            = <ore:itemRawRubber>;
val oreSeedBeet          = <ore:seedBeet>;
val oreSlabWood          = <ore:slabWood>;
val oreStickWood         = <ore:stickWood>;
val oreSugarCharcoal     = <ore:itemCharcoalSugar>;
val oreSugarcane         = <ore:sugarcane>;
val oreWaterBucket       = <ore:waterBucket>;
val oreWool              = <ore:blockWool>;


print("Unify all water buckets");
oreWaterBucket.add(ClayWaterBucket);
oreWaterBucket.add(MetalWaterBucket);
oreWaterBucket.add(WoodenWaterBucket);
recipes.remove(WoodenWaterBucket);
recipes.addShapeless(WoodenWaterBucket, [MetalWaterBucket]);
recipes.addShapeless(WoodenWaterBucket, [ClayWaterBucket.giveBack(ClayBucket)]);


print("Make HarvestCraft and Minecraft beet seeds equivalent");
oreSeedBeet.add(<minecraft:beetroot_seeds>);


print("Make beet plants craftable to seeds");
recipes.addShapeless(BeetSeed * 2, [oreCropBeet, oreCropBeet]);


print("Fix incompatibilities between RailCraft and ImmersiveEngineering");
oreCreosoteContainer.add(CreosoteBottle);
oreCreosoteContainer.add(CreosoteBucket);
recipes.addShaped(WoodenTie, [[null, oreCreosoteContainer], [oreSlabWood, oreSlabWood, oreSlabWood]]);


print("Remove unwanted recipes from Tinker's Construct");
recipes.remove(<tconstruct:wood_rail>);
mods.jei.JEI.hide(<tconstruct:wood_rail>);

recipes.remove(<tconstruct:wood_rail_trapdoor>);
mods.jei.JEI.hide(<tconstruct:wood_rail_trapdoor>);

recipes.remove(StoneTorch);
mods.jei.JEI.hide(StoneTorch);


print("Make ToughAsNails cooling stuff use commonly available materials");
oreColdRod.add(FreezeRod);
oreColdRod.add(BlizzRod);
recipes.remove(CoolingCoil);
recipes.addShaped(CoolingCoil,[[oreColdRod, oreColdRod, oreColdRod], [oreColdRod, oreColdRod, oreColdRod], [Cobblestone, Cobblestone, Cobblestone]]);
recipes.addShaped(FreezeRod,[[orePackedIce],[orePackedIce],[orePackedIce]]);
recipes.addShapeless(IceCube, [oreIce]);
recipes.addShapeless(IceCube * 4, [orePackedIce]);


print("Add extra vanilla recipes");
recipes.addShaped(Cobweb,[[String, String, String], [String, Slime, String], [String, String, String]]);


print("Massage torch recipes");
recipes.remove(Torch);
recipes.addShaped(Torch * 8, [[oreCoke], [oreStickWood]]);
recipes.addShaped(Torch * 6, [[oreCreosoteContainer], [oreWool], [oreStickWood]]);
recipes.addShaped(Torch * 5, [[Tar], [oreStickWood]]);
recipes.addShaped(Torch * 4, [[oreCoal], [oreStickWood]]);
recipes.addShaped(Torch * 3, [[oreRubber], [oreStickWood]]);
recipes.addShaped(Torch * 3, [[Rosin], [oreStickWood]]);
recipes.addShaped(Torch * 2, [[oreCharcoal], [oreStickWood]]);
recipes.addShaped(Torch * 1, [[oreSugarCharcoal], [oreStickWood]]);


print("Update recipes to use QC-appropriate materials");
recipes.addShaped(Backpack, [[oreLeather, oreCopperIngot, oreLeather], [oreLeather, oreWool, oreLeather], [oreLeather, oreLeather, oreLeather]]);
recipes.addShaped(Backpack, [[oreLeather, oreBronzeIngot, oreLeather], [oreLeather, oreWool, oreLeather], [oreLeather, oreLeather, oreLeather]]);
recipes.addShaped(ToughFabric, [[null, String, null], [String, oreStickWood, String], [null, String, null]]);
