refuelCost = minPetrolPrice;
publicvariable "refuelCost";
//bombactive = false; publicvariable "bombactive";

cashCache = [];
loaded = [];

restrictedVehicles = [
    "M32_EP1",
    "M47Launcher_EP1",
    "MAAWS",
    "Mk13_EP1",
    "PipeBomb",
    "M249_TWS_EP1",
    "M249_m145_EP1",
    "Mk_48_DES_EP1",
    "m240_scoped_EP1",
    "UZI_SD_EP1",
    "AKS_74_NSPU",
    "FN_FA_ANPVS4",
    "M4A3_RCO_GL_EP1",
    "SCAR_H_STD_EGLM_Spect",
    "SCAR_L_CQC_EGLM_Holo",
    "SCAR_L_STD_EGLM_RCO",
    "SCAR_L_STD_EGLM_TWS",
    "M110_NVG_EP1",
    "M110_TWS_EP1",
    "M24_des_EP1",
    "SCAR_H_LNG_Sniper",
    "SCAR_H_LNG_Sniper_SD",
    "SCAR_H_STD_TWS_SD",
    "SVD_NSPU_EP1",
    "SVD_des_EP1",
    "m107_TWS_EP1",
    "2b14",
    "AGS_TK",
    "AGS_UN",
    "D30",
    "DSHKM_TK_INS_EP1",
    "DSHkM_Mini_Tripod",
    "Igla_AA_pod_TK_EP1",
    "M119_US_EP1",
    "M252_US_EP1",
    "M2HD_mini_TriPod_US_EP1",
    "MK19_TriPod_US_EP1",
    "Metis_TK_EP1",
    "SPG9_TK_INS_EP1",
    "Stinger_Pod_US_EP1",
    "TOW_TriPod_US_EP1",
    "ZU23_TK_EP1",
    "ZU23_TK_GUE_EP1",
    "ZU23_TK_INS_EP1",
    "A10_US_EP1",
    "AH64D_EP1",
    "C130J_US_EP1",
    "CH_47F_EP1",
    "Chukar_EP1",
    "L39_TK_EP1",
    "MQ9PredatorB_US_EP1",
    "Su25_TK_EP1",
    "UH60M_MEV_EP1",
    "ParachuteBigEast_EP1",
    "ParachuteBigWest_EP1",
    "ParachuteMediumEast_EP1",
    "BMP2_HQ_TK_EP1",
    "BMP2_TK_EP1",
    "BMP2_UN_EP1",
    "M113Ambul_TK_EP1",
    "M113Ambul_UN_EP1",
    "M113_TK_EP1",
    "M113_UK_EP1",
    "M1A1_US_DES_EP1",
    "M1A2_US_TUSK_MG_EP1",
    "M2A2_EP1",
    "M2A3_EP1",
    "M6_EP1",
    "MLRS_DES_EP1",
    "T34_TK_GUE_EP1",
    "T55_TK_EP1",
    "T55_TK_GUE_EP1",
    "T72_TK_EP1",
    "ZSU_TK_EP1",
    "BRDM2_ATGM_TK_EP1",
    "BRDM2_HQ_TK_GUE_EP1",
    "BRDM2_TK_EP1",
    "BRDM2_TK_GUE_EP1",
    "BTR40_MG_TK_GUE_EP1",
    "BTR40_MG_TK_INS_EP1",
    "BTR40_TK_GUE_EP1",
    "BTR40_TK_INS_EP1",
    "BTR60_TK_EP1",
    "GRAD_TK_EP1",
    "HMMWV_Ambulance_CZ_DES_EP1",
    "HMMWV_Ambulance_DES_EP1",
    "HMMWV_DES_EP1",
    "HMMWC_M1035_DES_EP1",
    "HMMWV_M998A2_SOV_DES_EP1",
    "HMMWV_TOW_DES_EP1",
    "HMMWV_Terminal_EP1",
    "LandRover_MG_TK_INS_EP1",
    "LandRover_SPG9_TK_INS_EP1",
    "LandRover_Special_CZ_EP1",
    "M1128_MGS_EP1",
    "M1129_MC_EP1",
    "M1133_MEV_EP1",
    "M1135_ATGMV_EP1",
    "MAZ_543_SCUD_TK_EP1",
    "MtvrReammo_DES_EP1",
    "MtvrRefuel_DES_EP1",
    "MtvrRepair_DES_EP1",
    "MtvrSalvage_DES_EP1",
    "MtvrSupply_DES_EP1",
    "S1203_ambulance_EP1",
    "UralSalvage_TK_EP1",
    "UralSupply_TK_EP1",
    "Ural_ZU23_TK_GUE_EP1",
    "V3S_Reammo_TK_GUE_EP1",
    "V3S_Refuel_TK_GUE_EP1",
    "V3S_Salvage_TK_GUE_EP1",
    "Goat01_EP1",
    "Goat02_EP1",
    "Sheep01_EP1",
    "Sheep02_EP1",
    "2b14_82mm_TK_Bag_EP1",
    "2b14_82mm_TK_GUE_Bag_EP1",
    "2b14_82mm_TK_INS_Bag_EP1",
    "AGS_TK_Bag_EP1",
    "AGS_TK_GUE_Bag_EP1",
    "AGS_TK_INS_Bag_EP1",
    "AGS_UN_Bag_EP1",
    "CZ_Backpack_EP1",
    "CZ_VestPouch_EP1",
    "DSHKM_TK_GUE_Bag_EP1",
    "DSHKM_TK_INS_Bag_EP1",
    "DSHkM_Mini_TriPod_TK_GUE_Bag_EP1",
    "DSHkM_Mini_TriPod_TK_INS_Bag_EP1",
    "KORD_TK_Bag_EP1",
    "KORD_UN_Bag_EP1",
    "M252_US_Bag_EP1",
    "M2HD_mini_TriPod_US_Bag_EP1",
    "MK19_TriPod_US_Bag_EP1",
    "Metis_TK_Bag_EP1",
    "SPG9_TK_GUE_Bag_EP1",
    "SPG9_TK_INS_Bag_EP1",
    "TK_ALICE_Pack_EP1",
    "TK_Assault_Pack_EP1",
    "TOW_TriPod_US_Bag_EP1",
    "USBasicBag",
    "US_Assault_Pack_EP1",
    "US_Backpack_EP1",
    "US_Patrol_Pack_EP1",
    "US_UAV_Pack_EP1",
    "Igla",
    "Javelin",
    "MetisLauncher",
    "RPG18",
    "Strela",
    "MG36",
    "Mk_48",
    "Pecheneg",
    "AKS_74_UN_kobra",
    "AKS_74_pso",
    "AK_107_GL_kobra",
    "AK_107_GL_pso",
    "AK_107_kobra",
    "AK_107_pso",
    "Bizon",
    "G36_C_SD_eotech",
    "M16A2GL",
    "M16A4_ACG",
    "M16A4_ACG_GL",
    "M16A4_GL",
    "M4A1_AIM_SD_camo",
    "M4A1_Aim",
    "M4A1_Aim_camo",
    "M4A1_HWS_GL",
    "M4A1_HWS_GL_SD_Camo",
    "M4A1_HWS_GL_camo",
    "M4A1_RCO_GL",
    "VSS_Vintorez",
    "2b14_82mm",
    "2b14_82mm_CDF",
    "2b14_82mm_GUE",
    "2b14_82mm_INS",
    "AGS_CDF",
    "AGS_Ins",
    "AGS_RU",
    "D30_CDF",
    "D30_Ins",
    "D30_RU",
    "DSHKM_CDF",
    "DSHKM_Gue",
    "DSHKM_Ins",
    "DSHkM_Mini_TriPod",
    "DSHkM_Mini_TriPod_CDF",
    "Igla_AA_pod_East",
    "KORD",
    "M119",
    "M252",
    "M2HD_mini_TriPod",
    "MK19_TriPod",
    "Metis",
    "Stinger_Pod",
    "TOW_TriPod",
    "ZU23_CDF",
    "ZU23_Gue",
    "ZU23_Ins",
    "Saiga12K",
    "A10",
    "AH1z",
    "AH64D",
    "AH64D_Sidewinders",
    "AV8B",
    "AV8B2",
    "C130J",
    "Chukar",
    "CruiseMissile1",
    "CruiseMissile2",
    "F35B",
    "Ka52",
    "Ka52Black",
    "MH60S",
    "MQ9PredatorB",
    "MV22",
    "Mi17_rockets_RU",
    "Mi24_D",
    "Mi24_P",
    "Mi24_V",
    "ParachuteBigEast",
    "ParachuteBigWest",
    "Pchela1T",
    "Su25_CDF",
    "Su25_Ins",
    "Su34",
    "Su39",
    "UH1Y",
    "2S6M_Tunguska",
    "AAV",
    "BMP2_Ambul_CDF",
    "BMP2_Ambul_INS",
    "BMP2_CDF",
    "BMP2_Gue",
    "BMP2_HQ_CDF",
    "BMP2_HQ_INS",
    "BMP2_INS",
    "BMP3",
    "M1A1",
    "M1A2_TUSK_MG",
    "MLRS",
    "T72_CDF",
    "T72_Gue",
    "T72_INS",
    "T72_RU",
    "T90",
    "ZSU_CDF",
    "ZSU_INS",
    "Fishing_Boat",
    "RHIB",
    "RHIB2Turret",
    "SeaFox",
    "Smallboat_1",
    "Smallboat_2",
    "Zodiac",
    "BRDM2_ATGM_CDF",
    "BRDM2_ATGM_INS",
    "BRDM2_Gue",
    "BRDM2_HQ_Gue",
    "BRDM2_INS",
    "BTR90",
    "BTR90_HQ",
    "GAZ_Vodnik_HMG",
    "GAZ_Vodnik_MedEvac",
    "GRAD_CDF",
    "GRAD_INS",
    "GRAD_RU",
    "HMMWV_TOW",
    "LAV25",
    "LAV25_HQ",
    "Fin",
    "Goat",
    "Pastor",
    "Sheep"
];

if (isNil "workplacejob_taxi_serverarray") then {workplacejob_taxi_serverarray = []};

{_x setVariable ["height", 0, true];} forEach gangAreas;

serverKontoArray = [];
worldCenterPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

GC_Kills = []; //does nothing - tail_publicvariable.pl watches for this to update kills table
GC_Crimes = []; //does nothing - tail_publicvariable.pl watches for this to update crimes table

_dll = "gc" callExtension "version";
diag_log text _dll;


life_objects = [
[[3179.15,6210.63,35.6774],135.001,fuelshop1],
[[2732.42,5800.63,2.71113],180,fuelshop2],
[[4327.04,6806.42,134.929],159.999,fuelshop3],
[[3117.48,1603.17,90.6237],115,fuelshop4],
[[6021.05,4940.69,87.2833],1.30102,fuelshop6],
[[3679.31,2878.64,157.206],43.8741,huntshop1],
[[2795.53,6114.33,2.03213],345.002,boatshop1],
[[1896.06,3546.19,1.81232],345.002,boatshop2],
[[2154.44,5921.82,0.82172],104.996,boatshop3],
[[2087.39,1882.16,4.73],41.9998,boatshop4],
[[6517.11,4918.9,1.57806],38.9366,boatshop5],
[[1953.32,2720.63,0.924963],65.1172,boatshop6],
[[4263.17,2658.09,1.45165],145.002,boatshop7],
[[2707.56,6052.72,2.26978],140.002,boattuning],
[[2082.12,1888.08,4.73],79.9982,boattuning2],
[[6534.83,4934.49,4.15373],212.704,boattuning3],
[[1979.83,2655.31,8.13264],44.1008,boattuning4],
[[4116.3,7440.81,2.84732],129.999,scubashop],
[[4115.66,7438.58,2.80898],83.2219,scubabox],
[[4199.63,7263.37,15.2842],325.002,caveshop],
[[4200.87,7264.55,15.2863],114.948,cavegunbox],
[[3059.51,6020.71,4.7538],284.785,shop1],
[[3069.67,2121.9,168.003],152,shop2],
[[2850.35,3691.93,45.2425],14.9982,shop3],
[[4975.41,5417.02,154.54],109.999,shop4],
[[2038.94,2765.08,6.51242],339.756,shop5],
[[5371.26,5252.3,218.762],213.576,pub1],
[[2010.3,2663.03,6.3978],77.234,pub2],
[[3144.83,6056.15,7.37637],208.001,pub3],
[[6583.19,5326.32,24.1551],147.984,pistolshop],
[[6584.61,5327.11,24.1756],329.496,pistolbox],
[[6424.9,5414.2,7.63691],198.8,rifleshop],
[[6423.42,5413.29,7.60864],199.884,riflebox],
[[2885.11,6098.61,2.91441],190.523,equipshop],
[[2883.3,6096.7827,2.73561],185,equipbox],
[[1961.53,2748.07,5.43618],139.855,equipshop2],
[[1960.89,2746.7,5.3892],97.4882,equipbox2],
[[2190.55,5593.21,6.14569],305,tuning1],
[[2686.21,5784.37,2.60499],24.9993,tuning2],
[[4365.28,3768.6,224.954],317.014,truckshop],
[[1908.96,5822.37,5.50144],284.996,airshop],
[[2748.27,5744.24,4.14933],13.242,miningt],
[[2124.02,5577.11,6.11113],90,resourcesell],
[[2039.68,2709.27,5.87675],135.952,RingShop],
[[5376.01,3777.62,4.85331],0,OilSell1],
[[3287.24,2932.32,229.18],224.999,gangarea1],
[[3282.65,2919.62,229.201],30.9314,gangbox1],
[[1977.5,3527.11,2.59371],88.4493,gangarea2],
[[1976.27,3503.49,2.6937],61.9691,gangbox2],
[[4512.65,6814.33,103.259],226.35,gangarea3],
[[4482.15,6805.66,104.8],81.3076,gangbox3],
[[3795.83,7911.53,17.4002],223.945,gangarea4],
[[3787.34,7909.28,17.3092],81.1197,gangbox4],
[[4277.4,2669.84,2.70383],224.905,gangarea5],
[[4287.67,2696.85,5.70874],30.9047,gangbox5],
[[4094.04,4599.9,221.231],120,cdrugsell],
[[3402.87,6042.68,5.07659],305,mdrugsell],
[[5505.24,4703.06,77.7293],34.1866,ldrugsell],
[[4426.86,3937.4,227.81],195.588,hdrugsell],
[[3247.26,5780.49,5.43836],38,copair],
[[3278.41,5807.22,4.967],214.998,copcar],
[[3301.94,5789.62,4.7085],214.998,swatcar],
[[2155.62,5345.32,8.74144],2.99835,tdoc],
[[3218.3,5814.16,5.42598],99.4427,copbasic],
[[3219.29,5815.58,5.36036],309.785,copbasicbox],
[[3214.02,5809.11,5.42873],163.399,coppatrol],
[[3212.9,5808.05,5.3666],106.058,coppatrolbox],
[[3223.63,5798.36,5.4661],331.296,copcriminal],
[[3224.91,5800.4,5.35487],286.334,copcriminalbox],
[[3215.39,5793.12,5.44681],37.3461,copswat],
[[3217.09,5792.09,5.36251],41.7235,copswatbox],
[[3225.17,5821.15,5.41145],217.818,copsnipe],
[[3224.03,5821.83,5.35574],5.75129,copsnipebox],
[[3228.93,5804.87,5.46093],309.999,copattach],
[[3228.01,5803.58,5.35185],309.96,copattachbox],
[[3002.96,6080.27,8.45077],190,carshop1],
[[3007.61,6091.3,10.316],55.0001,offroadshop],
[[2236.26,5729.65,6.00144],24.9993,carshop2],
[[1995.75,2723.04,2.76625],309.998,carshop3],
[[6555.9,5043.73,47.3481],280.002,carshop4],
[[2984.14,6095.48,7.87485],245.839,carshop5],
[[2969.47,6102.21,7.87344],169.482,carshop6],
[[2979.92,6064.41,7.532],309.905,carshop7],
[[2167.44,1888.59,3.64982],235,bmshop],
[[2168.57,1886.81,3.59826],83.4222,bmgunbox],
[[2162.14,1881.22,2.95127],285.064,bmshopair],
[[2160.47,1885.85,2.8919],300,bmshopveh],
[[2454.36,5644.16,74.3321],179.119,jailbike],
[[2683.25,5369.26,86.6116],155.001,busshop],
[[2565.92,5481.3,83],104.996,hornnpc],
[[3038.87,6075.75,11.4294],89.8037,chairnpc],
[[2852.78,5887.99,8.94936],270,clothshop],
[[2852.45,5889.34,8.89943],99.3708,itembox],
[[2869.83,5927.07,3.07425],44.9988,goggleshop],
[[4845.16,6552.28,119.478],180,armyshop],
[[4844.31,6551.38,119.465],99.42,armybox],
[[3060.58,6125.85,19.4902],251.999,foodshop],
[[5208.86,4992.16,222.991],350,attachshop],
[[5207.68,4992.03,222.98],329.482,attachbox],
[[2638.73,622.02,66.5307],135,terrornpc],
[[2641.63,623.195,66.4793],74.9937,terrorbox],
[[2638.01,602.069,69.8029],250.424,terrorveh],
[[2925.55,6035.73,3.50308],180,bagshop],
[[2875.54,5949.83,3.62581],298.062,lottoshop],
[[2128.72,4750.56,2.18067],90.0501,shop1export],
[[2137.41,4774.12,2.35039],182.532,shop2export],
[[2146.4,4753.59,2.79682],266.827,shop3export],
[[2129.22,4757.56,2.37708],96.2898,shop4export],
[[2911.92,6046.9,3.35849],34.998,taxi1],
[[2942.49,5924.53,3.76581],176.974,delivery1],
[[3103.19,6044.56,4.75144],180,travelagent],
[[2875.86,6104.43,3.10347],268.904,licenseflag7],
[[1875.27,2744.66,14.7092],46.1782,licenseflag7_1],
[[2873.15,6106.16,6.53728],213.349,licenseflag6],
[[1876.83,2746.54,17.5804],77.0299,licenseflag6_1],
[[2075.8,5674.76,6.21413],212.355,Diamond_1],
[[2863.4,6102.98,7.03055],20.0236,licenseflag5],
[[1874.52,2756.29,14.3218],76.6763,licenseflag5_1],
[[2861.95,6105.98,3.02921],162,licenseflag2],
[[1879.3,2749.29,14.814],168.3664,licenseflag2_1],
[[3238.69,5810.71,4.93315],39.0007,copbank],
[[1989.07,5280.73,3],100.002,Vehiclefactory],
[[4315.22,4352.53,180.286],307.799,genfac],
[[4314.5,4352.14,180.235],337.922,genfacbox],
[[6075.56,5640.07,17.4962],205.948,weaponfactory],
[[6077.9,5638.88,17.5566],208.265,wfgunbox],
[[1989.36,4180.01,3.13565],90,ringfactory],
[[2214.73,5662.28,6.72635],242.913,Furnace],
[[3083.77,2172.53,167.459],205,shitfac],
[[3061.07,6193.05,28.2803],39.9977,workplace1],
[[3498.67,4921.92,200.266],39.965,workplace2],
[[5275.4,5069.77,218.642],40.0066,workplace3],
[[2884.87,6006.33,3.64393],119.895,mainbank],
[[3238.69,5810.71,4.93315],39.0007,copbank],
[[3042.55,6100.02,12.0164],180,atm1],
[[3063.53,6100.03,12.049],179.999,atm1_1],
[[2269.83,5772.6,5.44198],189.996,atm2],
[[3761.41,4796.02,194.043],189.672,atm3],
[[4616.58,5874.41,142.429],190.011,atm4],
[[4065,6320.73,122.064],185.011,atm5],
[[2854.42,3692.52,45.2085],190.082,atm6],
//[[2015.87,2723.39,3.09951],124.97,atm7],
[[4120.32,7468.69,9.42758],359.797,atm8],
[[2160.57,1892.32,2.6576],49.9738,atmpf],
[[2643.58,621.155,66.5307],69,atmt],
[[2644.33,621.185,66.5307],260,atmtnpc],
[[5356.08,3792.16,11.8268],50.0007,workplacejob_deliveryflag1],
[[3769.33,4803.07,194.311],79.9982,workplacejob_deliveryflag2],
[[2836.58,5918.78,2.45097],20.0013,workplacejob_deliveryflag3],
[[2994.24,6198.49,27.7849],100.002,workplacejob_deliveryflag4],
[[3621.56,6771.09,46.6887],180,workplacejob_deliveryflag5],
[[1977,5686.42,5.77123],178.073,workplacejob_deliveryflag6],
[[3124.88,5956.39,2.84125],135.001,workplacejob_deliveryflag7],
[[5162.16,5000.81,222.128],60.0003,workplacejob_deliveryflag8],
[[4160.71,3298.54,157.87],354.68,workplacejob_deliveryflag9],
[[2601.36,4899.93,109.426],50.0007,workplacejob_deliveryflag10],
[[1973.41,2820.31,24.7422],265,hostage],
[[3248.6,6833.86,3.92857],175,assassin],
[[5034.18,5891.96,208.733],266.308,grapeprocess],
[[5027.51,5943.97,208.514],0.328725,hopsprocess],
[[4969.56,5902.26,208.058],177.765,barleyprocess],
[[4996.83,5931.5,208.601],266.316,ryeprocess],
[[2066.34,2703.25,7.66097],50.3342,Oil_1],
[[4996.83,5931.5,208.601],266.316,ryeprocess],
[[3059.36,6127.25,19.488],57.0014,cook],
[[2016.36,5836.36,5.70626],73.4348,impoundbuy],
[[1904.41,5728.8,5.60851],289.999,impoundbuy2],
[[1959.93,5152.95,3.02292],56.1972,boatimpoundbuy],
[[7030.8,5904.69,2.41823],298.568,prostituteflag]
];


_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_Mission","gangsarray"];
if (_read != "") then {
	_read = call compile _read;
	gangsarray = _read;
	{
		_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_Mission",_x];
		if (_read != "") then {
			_gangmarker = "";
			_label = "";
			_x setvariable["control",_read,true];
			if(_x == gangarea1) then {
				_label = format["%1's Camp (cocaine - lsd)", _read];
				_gangmarker = "gangmarker1";
			};
			if(_x == gangarea2) then {
				_label = format["%1's Camp (heroin - lsd)", _read];
				_gangmarker = "gangmarker2";
			};
			if(_x == gangarea3) then {
				_label = format["%1's Camp (heroin - marijuana)", _read];
				_gangmarker = "gangmarker3";
			};
			if(_x == gangarea4) then {
				_label = format["%1's Camp (marijuana - cocaine)", _read];
				_gangmarker = "gangmarker4";
			};
			if(_x == gangarea5) then {
				_label = format["%1's Camp (all drugs)", _read];
				_gangmarker = "gangmarker5";
			};
			_gangmarker setMarkerColor "ColorOrange";
			_gangmarker setMarkerText _label;
		}
	} foreach gangareas;
};


_read = "gc" callExtension format["R|%1|%2|%3","__A3SERVER__","GC_Mission","DateStamp"];
if (_read != "") then {
	_read = call compile _read;
	setDate _read;
};

  INV_itemstocks = [
    //fs
    [-1,10,10,10],
    [-1,10,10,10],
    [-1,10,10,10],
    [-1,10,10,10],
    [-1,10,10,10],

    //hunt
    [15,10,15,10,10,10,10,10,10,10,10,10,10,10,10],

    //boat (dont makeunlimited A3 NYI TODO)
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,

    //boat tuning (dont makeunlimited A3 NYI TODO)
    -1,
    -1,
    -1,
    -1,

    //scuba
    -1,
    //cave
    -1,

    //is
    [10,10,10,10,-1],
    [10,10,10,10,-1],
    [10,10,10,10,-1],
    [10,10,10,10,-1],
    [10,10,10,10,-1],

    //pub
    [-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1],

    //pshop
    [

    	15,15,15,15,50,25	//a3 shit
    ],

    //rshop
    [

    	10,10,10,10,200,30,30,30,30,
    	10,50,30,30,30,30	//a3 shit
    ],

    //equipShop
    [10,10,10,10,5,5,5,5,5,5],
    [10,10,10,10,5,5,5,5,5,5],

    //cu
    [10,10,10,5,5,5,10],
    [10,10,10,5,5,5,10],

    //ts  (dont make truck shop unlimited TODO A3 NYI)
    -1,

    //as
    -1,

    //mt
    [20,20,20],

    //rs
    [10,10,10,10,15,15,15],

    //gds
    [0,0,0,0],

    //os
    -1,

    //ga
    -1,
    -1,
    -1,
    -1,
    -1,

    //ds
    -1,
    -1,
    -1,
    -1,

    //ca
    -1,

    //cv
    -1,

    //sv
    -1,

    //td.
     -1,

    //cops
    -1,

    //copsp
    -1,

    //copsc
    -1,

    //copss
    -1,

    //copsnipe
    -1,
  //copattach
  -1,

    //cs
    [20,20,20,20,20,20,20,20],
    [20,20,20,20,20,20,20],
    [20,20,20,20,20,20,20],
    [20,20,20,20,20,20,20,20],
    [20,20,20,20,20,20,20,20],
    [20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20],  
    [20,20,20,20],
    [20,20,20,20,20,20,20,20,20,20],

   //blackmarket
    -1,

    //blackmarket_air
    -1,

    //blackmarket_veh
    -1,

    //jailbike
    -1,

    //bus
    -1,

    //horn shop
    -1,

  //chair shop
    -1,
    //clothes
    [20,20,20,20,20,20,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30],
    //goggles
    [20,20,20,20,20,20],
    //army
    [20,20,20,20,20,20,20,20,20,20,20,20],
    //food
    -1,
    //attach
    [20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20],

  //terror shop
    -1,

  //terror vehicle
  -1,

    //bags
    [20,20,20],
    
      //shit at the end
  -1,-1,-1,-1,-1,-1,-1
  ];

diag_log text format["Count of allMissionObjects ""All"": %1",(count allMissionObjects "All")];
diag_log text format["Count of playableUnits: %1",(count playableUnits)];
diag_log text format["Count of allGroups: %1",(count allGroups)];
diag_log text format["Count of allUnits: %1",(count allUnits)];
diag_log text format["Count of vehicles: %1",(count vehicles)];
diag_log text format["Count of INV_ServerVclArray: %1",(count INV_ServerVclArray)];
diag_log text format["Count of ServerKontoArray: %1",(count ServerKontoArray)];
diag_log text format["Count of gangsarray: %1",(count gangsarray)];
diag_log text format["Count of publicarbeiterarctionarray: %1",(count publicarbeiterarctionarray)];
diag_log text format["Count of workplacejob_taxi_serverarray: %1",(count workplacejob_taxi_serverarray)];
diag_log text format["Count of cashCache: %1",(count cashCache)];
diag_log text format["Count of loaded: %1",(count loaded)];
diag_log text format["Count of INV_itemstocks: %1",(count INV_itemstocks)];