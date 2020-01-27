


local  mafr_wormhole = {}


local RANDOM_COUNT = 3


local AREA_A_PROBABILITY = 0.8
local AREA_B_PROBABILITY = 0.8
local AREA_C_PROBABILITY = 0.8
local AREA_D_PROBABILITY = 0.8


mafr_wormhole.wormholeResourceList = {
	
	areaA = {
		"COL_WoodStick_Nail",
		"COL_DrumFragment_4",
		"COL_Carton_G",
		"COL_Sandbag_WH",
		"COL_Cluster_Fabric_WH",
		"COL_Carton_E",
		"COL_Carton_A",
		"COL_GunPowderPack_WH",
		"COL_MedicalEquip_A_WH",
		"COL_Solvent",
		"COL_Tire_B_WH",
		"COL_Bottle_C_WH",
		"COL_Oil",
		"COL_Carton_F",
		"COL_Tableware_G_WH",
		"COL_Ashtray_WH",
		"COL_Carton_B",
		"COL_Bucket_C_WH",
		"COL_Broken_D_WH",
		"COL_Cluster_Steel_WH",
		"COL_MedicalEquip_D_WH",
		"COL_Bag_B_WH",
		"COL_MedicineBottle_C_WH",
		"COL_Tube_TNT_WH",
	},
	
	areaB = {
		"COL_WoodStick_Nail",
		"COL_DrumFragment_4",
		"COL_Carton_G",
		"COL_Sandbag_WH",
		"COL_Cluster_Fabric_WH",
		"COL_Carton_E",
		"COL_Carton_A",
		"COL_GunPowderPack_WH",
		"COL_MedicalEquip_A_WH",
		"COL_Solvent",
		"COL_Tire_B_WH",
		"COL_Bottle_C_WH",
		"COL_Oil",
		"COL_Carton_F",
		"COL_Tableware_G_WH",
		"COL_Ashtray_WH",
		"COL_Carton_B",
		"COL_Bucket_C_WH",
		"COL_Broken_D_WH",
		"COL_Cluster_Steel_WH",
		"COL_Bag_E_WH",
		"COL_MedicalEquip_D_WH",
		"COL_Bag_B_WH",
		"COL_Carton_C",
		"COL_MedicineBottle_C_WH",
		"COL_Tube_TNT_WH",
		"COL_PlasticTank_C_WH",
	},
	
	areaC = {
		"COL_WoodStick_Nail",
		"COL_DrumFragment_4",
		"COL_Carton_G",
		"COL_Sandbag_WH",
		"COL_Cluster_Fabric_WH",
		"COL_Carton_E",
		"COL_Carton_A",
		"COL_GunPowderPack_WH",
		"COL_MedicalEquip_A_WH",
		"COL_Solvent",
		"COL_Tire_B_WH",
		"COL_Bottle_C_WH",
		"COL_Oil",
		"COL_Carton_F",
		"COL_Tableware_G_WH",
		"COL_Ashtray_WH",
		"COL_Carton_B",
		"COL_Bucket_C_WH",
		"COL_Broken_D_WH",
		"COL_Cluster_Steel_WH",
		"COL_Bag_E_WH",
		"COL_MedicalEquip_D_WH",
		"COL_Bag_B_WH",
		"COL_Carton_C",
		"COL_MedicineBottle_C_WH",
		"COL_Tube_TNT_WH",
		"COL_PlasticTank_C_WH",
	},
	
	areaD = {
		"COL_WoodStick_Nail",
		"COL_DrumFragment_4",
		"COL_Carton_G",
		"COL_Sandbag_WH",
		"COL_Cluster_Fabric_WH",
		"COL_Carton_E",
		"COL_Carton_A",
		"COL_GunPowderPack_WH",
		"COL_MedicalEquip_A_WH",
		"COL_Solvent",
		"COL_Tire_B_WH",
		"COL_Bottle_C_WH",
		"COL_Oil",
		"COL_Carton_F",
		"COL_Tableware_G_WH",
		"COL_Ashtray_WH",
		"COL_Carton_B",
		"COL_Bucket_C_WH",
		"COL_Broken_D_WH",
		"COL_Cluster_Steel_WH",
		"COL_Bag_E_WH",
		"COL_MedicalEquip_D_WH",
		"COL_Bag_B_WH",
		"COL_Carton_C",
		"COL_MedicineBottle_C_WH",
		"COL_Tube_TNT_WH",
		"COL_Ingot_Tungsten_WH",
		"COL_Carton_H",
		"COL_PlasticTank_C_WH",
	},
}




mafr_wormhole.wormholePointTable = {

	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_125/mafr_152_125_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_125/mafr_152_125_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_126/mafr_152_126_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_126/mafr_152_126_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_126/mafr_153_126_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_126/mafr_153_126_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaA,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_A_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},


	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/151/151_122/mafr_151_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/151/151_123/mafr_151_123_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/151/151_123/mafr_151_123_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_119/mafr_152_119_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_119/mafr_152_119_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_121/mafr_152_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_121/mafr_152_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0002|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_121/mafr_152_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_122/mafr_152_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_122/mafr_152_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0002|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_122/mafr_152_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_123/mafr_152_123_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_117/mafr_153_117_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_117/mafr_153_117_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_119/mafr_153_119_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_119/mafr_153_119_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_120/mafr_153_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_120/mafr_153_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_121/mafr_153_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_117/mafr_154_117_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_117/mafr_154_117_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaB,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_B_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},


	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_113/mafr_152_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/152/152_113/mafr_152_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_113/mafr_153_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_113/mafr_153_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_114/mafr_153_114_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_114/mafr_153_114_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_115/mafr_153_115_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_115/mafr_153_115_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_116/mafr_153_116_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_116/mafr_153_116_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0002|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/153/153_116/mafr_153_116_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_113/mafr_154_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_113/mafr_154_113_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_114/mafr_154_114_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_114/mafr_154_114_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_115/mafr_154_115_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_115/mafr_154_115_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_116/mafr_154_116_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/154/154_116/mafr_154_116_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaC,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_C_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},


	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/142/142_120/mafr_142_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/142/142_120/mafr_142_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/142/142_121/mafr_142_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/143/143_120/mafr_143_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/143/143_120/mafr_143_120_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/143/143_121/mafr_143_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/143/143_121/mafr_143_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/144/144_122/mafr_144_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/144/144_122/mafr_144_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/145/145_121/mafr_145_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	{
		name			= "com_wormhole_null001_gim_n0001|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/145/145_121/mafr_145_121_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/145/145_122/mafr_145_122_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},
	
	{
		name			= "com_wormhole_null001_gim_n0000|srt_gim_null_wormhole",
		dataSetName		= "/Assets/tpp/level/location/mafr/block_small/145/145_123/mafr_145_123_gimmick.fox2",
		resources = mafr_wormhole.wormholeResourceList.areaD,
		reset			= false,
		radius			= 45,
		halfSize		= 0,
		probability		= AREA_D_PROBABILITY,
		randomCount		= RANDOM_COUNT,
		randomOffset	= 5,
	},

}
return mafr_wormhole