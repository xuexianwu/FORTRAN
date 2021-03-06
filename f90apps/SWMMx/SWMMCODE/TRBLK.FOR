      BLOCK DATA TRBLK
C=======================================================================
C  Updated 8/93 by WCH (CDM - Chuck Moore) for incorporation of Type 26
C  tabular flow divider.  Some arrays increased to 26 and other new
C  initialization.  
C=======================================================================
C     TYPE=01   CIRCULAR CONDUIT                               KLASS = 2
C     TYPE=02   RECTANGULAR CONDUIT                            KLASS = 1
C     TYPE=03   EGG-SHAPED CONDUIT                             KLASS = 2
C     TYPE=04   HORSESHOE CONDUIT                              KLASS = 2
C     TYPE=05   GOTHIC SHAPED CONDUIT                          KLASS = 2
C     TYPE=06   CATENARY CONDUIT                               KLASS = 2
C     TYPE=07   SEMI ELLIPTICAL CONDUIT                        KLASS = 2
C     TYPE=08   BASKET-HANDLE CONDUIT                          KLASS = 2
C     TYPE=09   SEMI-CIRCULAR CONDUIT                          KLASS = 2
C     TYPE=10   MODIFIED BASKET-HANDLE CONDUIT                 KLASS = 1
C     TYPE=11   RECTANGULAR CONDUIT (TRIANGULAR BOTTOM)        KLASS = 1
C     TYPE=12   RECTANGULAR CONDUIT (ROUND BOTTOM)             KLASS = 1
C     TYPE=13   TRAPEZOIDAL CHANNEL                            KLASS = 1
C     TYPE=14   PARABOLIC CHANNEL                              KLASS = 2
C     TYPE=15   POWER FUNCTION                                 KLASS = 2
C     TYPE=16   NATURAL CHANNEL                                KLASS = 2
C     TYPE=17   USER SUPPLIED                                  KLASS = 2
C     TYPE=18   USER SUPPLIED                                  KLASS = 2
C     TYPE=19   MANHOLE                                        KLASS = 3
C     TYPE=20   LIFT STATION                                   KLASS = 3
C     TYPE=21   FLOW DIVIDER                                   KLASS = 3
C     TYPE=22   STORAGE UNIT                                   KLASS = 3
C     TYPE=23   FLOW DIVIDER                                   KLASS = 3
C     TYPE=24   FLOW DIVIDER                                   KLASS = 3
C     TYPE=25   BACKWATER ELEMENT                              KLASS = 3
C     TYPE=26   TABULAR FLOW DIVIDER                           KLASS = 3
C=======================================================================
      INCLUDE 'NAMES.INC'
      COMMON/TABLES/KDEPTH(26),KLASS(26),PSIMAX(18),ALFMAX(18),
     1              NN(26),MM(26),ANORM(18,51),QN1(144),QN2(144),
     2              QN3(144),QN4(144),QN5(144),QN6(144),QN7(54),
     3              DN1(144),DN2(144),DN3(144),DN4(144),DN5(144),
     2              DN6(144),DN7(54),AFACT(18),RFACT(18)
C=======================================================================
      DATA NAME/'CIRCULAR        ','RECTANGULAR     ',
     *          'EGG-SHAPHED     ','HORSE SHOE      ',
     *          'GOTHIC SHAPED   ','CATENARY SHAPED ',
     *          'SEMI ELLIPTICAL ','BASKET HANDLE   ',
     *          'SEMI CIRCULAR   ','MODIFIED B. H.  ',
     *          'RECT.-TRIANGULAR','RECT.-ROUND     ',
     *          'TRAPEZOID       ','PARABOLIC       ',
     *          'POWER FUNCTION  ','NATURAL CHANNEL ',
     *          'USER SUPPLIED   ',
     *          'USER SUPPLIED   ','MANHOLE         ',
     *          'LIFT STATION    ','FLOW DIVIDER    ',
     *          'STORAGE UNIT    ','FLOW DIVIDER    ',
     *          'FLOW DIVIDER    ','BACKWATER UNIT  ',
     *          'TAB FLOW DIVIDER'/
      DATA GNO/'NO  '/, YES/'YES '/
      DATA KDEPTH/2,1,7*2,4*1,5*2,8*3/
      DATA KLASS/2,1,7*2,4*1,5*2,8*3/
      DATA NN/51,1,7*51,9*1,8*0/
      DATA MM/51,1,7*51,9*1,8*0/
      DATA ALFMAX/.96,.97,.96,.96,.96,.98,.98,.96,.96,3*.98,6*1.0/
      DATA PSIMAX/1.08,.9505,1.065,1.077,1.065,1.05,1.045,1.06078,
     1 1.06637,9*1.0/
      DATA AFACT/0.7853982,0.0,0.5105,0.8293,0.6554,0.70277,0.785,
     1           0.7862,1.2697,9*0.0/
      DATA RFACT/0.25,0.0,0.1931,0.2538,0.2269,0.23172,0.242,
     1           0.2464,0.2946,9*0.0/
      DATA ANORM/18*0.0,18*.02,18*.04,18*.06,18*.08,18*.10,18*.12,
     *     18*.14,18*.16,18*.18,18*.20,18*.22,18*.24,18*.26,18*.28,
     *            18*.30,18*.32,18*.34,18*.36,18*.38,18*.40,18*.42,
     *            18*.44,18*.46,18*.48,18*.50,18*.52,18*.54,18*.56,
     *            18*.58,18*.60,18*.62,18*.64,18*.66,18*.68,18*.70,
     *            18*.72,18*.74,18*.76,18*.78,18*.80,18*.82,18*.84,
     *            18*.86,18*.88,18*.90,18*.92,18*.94,18*.96,18*.98,
     *            18*1.0/
      DATA QN1/0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,
     *          0.0   ,0.0    ,0.0    ,0.0    ,7*0.0,
     *          0.00529,0.0    ,0.00295,0.00467,0.00500,0.00605,0.00438,
     *          0.00758,0.00757,0.0    ,0.0    ,7*0.0,
     *          0.01432,0.0    ,0.01331,0.01237,0.01740,0.01455,0.01227,
     *          0.01812,0.01815,0.0    ,0.0    ,7*0.0,
     *          0.02559,0.0    ,0.02629,0.02268,0.03098,0.02540,0.02312,
     *          0.03000,0.03000,0.0    ,0.0    ,7*0.0,
     *          0.03859,0.0    ,0.04000,0.03515,0.04272,0.03863,0.03638,
     *          0.03966,0.03580,0.0    ,0.0    ,7*0.0,
     *          0.05304,0.0    ,0.05657,0.04943,0.05500,0.05430,0.05145,
     *          0.04957,0.04037,0.0    ,0.0    ,7*0.0,
     *          0.06877,0.0    ,0.07500,0.06525,0.06980,0.07127,0.06783,
     *          0.06230,0.04601,0.0    ,0.0    ,7*0.0,
     *          0.08551,0.0    ,0.09432,0.08212,0.08620,0.08778,0.08500,
     *          0.07849,0.05500,0.0    ,0.0    ,7*0.0/
       DATA QN2/0.10326,0.0    ,0.11473,0.10005,0.10461,0.10372,0.10093,
     *          0.09618,0.07475,0.0    ,0.0    ,7*0.0,
     *          0.12195,0.0    ,0.13657,0.11891,0.12463,0.12081,0.11752,
     *          0.11416,0.09834,0.0    ,0.0    ,7*0.0,
     *          0.14144,0.0    ,0.15894,0.13856,0.14500,0.14082,0.13530,
     *          0.13094,0.12500,0.0    ,0.0    ,7*0.0,
     *          0.16162,0.0    ,0.18030,0.15896,0.16309,0.16375,0.15626,
     *          0.14808,0.15570,0.0    ,0.0    ,7*0.0,
     *          0.18251,0.0    ,0.20036,0.18004,0.18118,0.18779,0.17917,
     *          0.16583,0.18588,0.0    ,0.0    ,7*0.0,
     *          0.20410,0.0    ,0.22000,0.20172,0.20000,0.21157,0.20296,
     *          0.18381,0.20883,0.0    ,0.0    ,7*0.0,
     *          0.22636,0.0    ,0.23919,0.22397,0.22181,0.23478,0.22654,
     *          0.20294,0.22300,0.0    ,0.0    ,7*0.0,
     *          0.24918,0.0    ,0.25896,0.24677,0.24487,0.25818,0.24962,
     *          0.22500,0.23472,0.0    ,0.0    ,7*0.0/
       DATA QN3/0.27246,0.0    ,0.28000,0.27006,0.26888,0.28244,0.27269,
     *          0.25470,0.24667,0.0    ,0.0    ,7*0.0,
     *          0.29614,0.0    ,0.30504,0.29380,0.29380,0.30741,0.29568,
     *          0.28532,0.26758,0.0    ,0.0    ,7*0.0,
     *          0.32027,0.0    ,0.33082,0.31790,0.31901,0.33204,0.31848,
     *          0.31006,0.29346,0.0    ,0.0    ,7*0.0,
     *          0.34485,0.0    ,0.35551,0.34237,0.34389,0.35505,0.34152,
     *          0.32804,0.32124,0.0    ,0.0    ,7*0.0,
     *          0.36989,0.0    ,0.37692,0.36720,0.36564,0.37465,0.36500,
     *          0.34555,0.35000,0.0    ,0.0    ,7*0.0,
     *          0.39531,0.0    ,0.39809,0.39239,0.38612,0.39404,0.38941,
     *          0.36944,0.37720,0.0    ,0.0    ,7*0.0,
     *          0.42105,0.0    ,0.42000,0.41792,0.40720,0.41426,0.41442,
     *          0.40032,0.40540,0.0    ,0.0    ,7*0.0,
     *          0.44704,0.0    ,0.44625,0.44374,0.43000,0.43804,0.44000,
     *          0.43203,0.43541,0.0    ,0.0    ,7*0.0/
       DATA QN4/0.47329,0.0    ,0.47321,0.46984,0.45868,0.46531,0.46636,
     *          0.46004,0.46722,0.0    ,0.0    ,7*0.0,
     *          0.49980,0.0    ,0.50000,0.49619,0.48895,0.49357,0.49309,
     *          0.47849,0.50000,0.0    ,0.0    ,7*0.0,
     *          0.52658,0.0    ,0.52255,0.52276,0.52000,0.52187,0.52000,
     *          0.49591,0.53532,0.0    ,0.0    ,7*0.0,
     *          0.55354,0.0    ,0.54481,0.54950,0.55032,0.54925,0.54628,
     *          0.51454,0.56935,0.0    ,0.0    ,7*0.0,
     *          0.58064,0.0    ,0.56785,0.57640,0.58040,0.57647,0.57285,
     *          0.53810,0.60000,0.0    ,0.0    ,7*0.0,
     *          0.60777,0.0    ,0.59466,0.60345,0.61000,0.60321,0.60000,
     *          0.56711,0.61544,0.0    ,0.0    ,7*0.0,
     *          0.63499,0.0    ,0.62485,0.63065,0.63762,0.62964,0.62949,
     *          0.60000,0.62811,0.0    ,0.0    ,7*0.0,
     *          0.66232,0.0    ,0.65518,0.65795,0.66505,0.65639,0.65877,
     *          0.64092,0.64170,0.0    ,0.0    ,7*0.0/
       DATA QN5/0.68995,0.0    ,0.68181,0.68531,0.69290,0.68472,0.68624,
     *          0.68136,0.66598,0.0    ,0.0    ,7*0.0,
     *          0.71770,0.0    ,0.70415,0.71271,0.72342,0.71425,0.71017,
     *          0.71259,0.70010,0.0    ,0.0    ,7*0.0,
     *          0.74538,0.0    ,0.72585,0.74009,0.75467,0.74303,0.73304,
     *          0.73438,0.73413,0.0    ,0.0    ,7*0.0,
     *          0.77275,0.0    ,0.74819,0.76738,0.78500,0.76827,0.75578,
     *          0.75500,0.76068,0.0    ,0.0    ,7*0.0,
     *          0.79979,0.0    ,0.77482,0.79451,0.81165,0.79168,0.77925,
     *          0.78625,0.78027,0.0    ,0.0    ,7*0.0,
     *          0.82658,0.0    ,0.80515,0.82144,0.83654,0.81500,0.80368,
     *          0.81880,0.80000,0.0    ,0.0    ,7*0.0,
     *          0.85320,0.0    ,0.83534,0.84814,0.86000,0.84094,0.83114,
     *          0.85000,0.82891,0.0    ,0.0    ,7*0.0,
     *          0.87954,0.0    ,0.86193,0.87450,0.88253,0.86707,0.85950,
     *          0.86790,0.85964,0.0    ,0.0    ,7*0.0/
       DATA QN6/0.90546,0.0    ,0.88465,0.90057,0.90414,0.89213,0.88592,
     *          0.88483,0.89000,0.0    ,0.0    ,7*0.0,
     *          0.93095,0.0    ,0.90690,0.92652,0.92500,0.91607,0.90848,
     *          0.90431,0.91270,0.0    ,0.0    ,7*0.0,
     *          0.95577,0.0    ,0.93000,0.95244,0.94486,0.94000,0.93000,
     *          0.93690,0.93664,0.0    ,0.0    ,7*0.0,
     *          0.97976,0.0    ,0.95866,0.97724,0.96475,0.96604,0.95292,
     *          0.97388,0.96677,0.0    ,0.0    ,7*0.0,
     *          1.00291,0.0    ,0.98673,0.99988,0.98567,0.99000,0.97481,
     *          1.00747,1.00000,0.0    ,0.0    ,7*0.0,
     *          1.02443,0.0    ,1.01238,1.02048,1.00833,1.00714,0.99374,
     *          1.03300,1.02661,0.0    ,0.0    ,7*0.0,
     *          1.04465,0.0    ,1.03396,1.03989,1.03000,1.02158,1.01084,
     *          1.05000,1.04631,0.0    ,0.0    ,7*0.0,
     *          1.06135,0.0    ,1.05000,1.05698,1.05360,1.03814,1.02858,
     *          1.05464,1.05726,0.0    ,0.0    ,7*0.0/
       DATA QN7/1.08208,0.0    ,1.06517,1.07694,1.06500,1.05000,1.04543,
     *          1.06078,1.06637,0.0    ,0.0    ,7*0.0,
     *          1.07662,0.0    ,1.05380,1.07562,1.05500,1.05000,1.05000,
     *          1.05500,1.06000,0.0    ,0.0    ,7*0.0,
     *          1.00000,0.0    ,1.00000,1.00000,1.00000,1.00000,1.00000,
     *          1.00000,1.00000,0.0    ,0.0    ,7*0.0/
       DATA DN1/0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,0.0    ,
     *          0.0    ,0.0    ,0.0    ,0.0    ,7*0.0,
     *          0.05236,0.0    ,0.04912,0.04146,0.04522,0.02974,0.03075,
     *          0.04112,0.04102,0.0    ,0.0    ,7*0.0,
     *          0.08369,0.0    ,0.08101,0.07033,0.07825,0.06439,0.05137,
     *          0.07380,0.07407,0.0    ,0.0    ,7*0.0,
     *          0.11025,0.0    ,0.11128,0.09098,0.10646,0.08433,0.07032,
     *          0.10000,0.10000,0.0    ,0.0    ,7*0.0,
     *          0.13423,0.0    ,0.14161,0.10962,0.12645,0.10549,0.09000,
     *          0.12236,0.11769,0.0    ,0.0    ,7*0.0,
     *          0.15643,0.0    ,0.16622,0.12921,0.14645,0.12064,0.11323,
     *          0.14141,0.13037,0.0    ,0.0    ,7*0.0,
     *          0.17755,0.0    ,0.18811,0.14813,0.16787,0.13952,0.13037,
     *          0.15857,0.14036,0.0    ,0.0    ,7*0.0,
     *          0.19772,0.0    ,0.21356,0.16701,0.18641,0.15560,0.14519,
     *          0.17462,0.15000,0.0    ,0.0    ,7*0.0/
       DATA DN2/0.21704,0.0    ,0.23742,0.18565,0.20129,0.17032,0.15968,
     *          0.18946,0.16546,0.0    ,0.0    ,7*0.0,
     *          0.23581,0.0    ,0.25742,0.20401,0.22425,0.18512,0.18459,
     *          0.20315,0.18213,0.0    ,0.0    ,7*0.0,
     *          0.25412,0.0    ,0.27742,0.22211,0.24129,0.20057,0.19531,
     *          0.21557,0.20000,0.0    ,0.0    ,7*0.0,
     *          0.27194,0.0    ,0.29741,0.23998,0.25624,0.21995,0.21354,
     *          0.22833,0.22018,0.0    ,0.0    ,7*0.0,
     *          0.28948,0.0    ,0.31742,0.25769,0.27344,0.24011,0.22694,
     *          0.24230,0.24030,0.0    ,0.0    ,7*0.0,
     *          0.30653,0.0    ,0.33742,0.27524,0.29097,0.25892,0.23947,
     *          0.25945,0.25788,0.0    ,0.0    ,7*0.0,
     *          0.32349,0.0    ,0.35747,0.29265,0.30529,0.27595,0.25296,
     *          0.27936,0.27216,0.0    ,0.0    ,7*0.0,
     *          0.34017,0.0    ,0.37364,0.30990,0.32607,0.29214,0.26500,
     *          0.30000,0.28500,0.0    ,0.0    ,7*0.0/
       DATA DN3/0.35666,0.0    ,0.40000,0.32704,0.33755,0.30802,0.27784,
     *          0.32040,0.29704,0.0    ,0.0    ,7*0.0,
     *          0.37298,0.0    ,0.41697,0.34406,0.35073,0.32372,0.29212,
     *          0.34034,0.30892,0.0    ,0.0    ,7*0.0,
     *          0.38915,0.0    ,0.43372,0.36101,0.36447,0.33894,0.30970,
     *          0.35892,0.32128,0.0    ,0.0    ,7*0.0,
     *          0.40521,0.0    ,0.45000,0.37790,0.37558,0.35315,0.32982,
     *          0.37595,0.33476,0.0    ,0.0    ,7*0.0,
     *          0.42117,0.0    ,0.46374,0.39471,0.40000,0.36557,0.35000,
     *          0.39214,0.35000,0.0    ,0.0    ,7*0.0,
     *          0.43704,0.0    ,0.47747,0.41147,0.41810,0.37833,0.36738,
     *          0.40802,0.36927,0.0    ,0.0    ,7*0.0,
     *          0.45284,0.0    ,0.49209,0.42818,0.43648,0.39230,0.38390,
     *          0.42372,0.38963,0.0    ,0.0    ,7*0.0,
     *          0.46858,0.0    ,0.50989,0.44484,0.45374,0.40970,0.40000,
     *          0.43894,0.41023,0.0    ,0.0    ,7*0.0/
       DATA DN4/0.48430,0.0    ,0.53015,0.46147,0.46805,0.42982,0.41667,
     *          0.45315,0.43045,0.0    ,0.0    ,7*0.0,
     *          0.50000,0.0    ,0.55000,0.47807,0.48195,0.45000,0.43333,
     *          0.46557,0.45000,0.0    ,0.0    ,7*0.0,
     *          0.51572,0.0    ,0.56429,0.49468,0.49626,0.46769,0.45000,
     *          0.47833,0.46769,0.0    ,0.0    ,7*0.0,
     *          0.53146,0.0    ,0.57675,0.51134,0.51352,0.48431,0.46697,
     *          0.49230,0.48431,0.0    ,0.0    ,7*0.0,
     *          0.54723,0.0    ,0.58834,0.52803,0.53190,0.50000,0.48372,
     *          0.50945,0.50000,0.0    ,0.0    ,7*0.0,
     *          0.56305,0.0    ,0.60000,0.54474,0.55000,0.51466,0.50000,
     *          0.52936,0.51443,0.0    ,0.0    ,7*0.0,
     *          0.57892,0.0    ,0.61441,0.56138,0.56416,0.52886,0.51374,
     *          0.55000,0.52851,0.0    ,0.0    ,7*0.0,
     *          0.59487,0.0    ,0.62967,0.57804,0.57787,0.54292,0.52747,
     *          0.57000,0.54271,0.0    ,0.0    ,7*0.0/
       DATA DN5/0.61093,0.0    ,0.64582,0.59478,0.59224,0.55729,0.54209,
     *          0.59000,0.55774,0.0    ,0.0    ,7*0.0,
     *          0.62710,0.0    ,0.66368,0.61171,0.60950,0.57223,0.55950,
     *          0.61023,0.57388,0.0    ,0.0    ,7*0.0,
     *          0.64342,0.0    ,0.68209,0.62881,0.62941,0.58780,0.57941,
     *          0.63045,0.59101,0.0    ,0.0    ,7*0.0,
     *          0.65991,0.0    ,0.70000,0.64609,0.65000,0.60428,0.60000,
     *          0.65000,0.60989,0.0    ,0.0    ,7*0.0,
     *          0.67659,0.0    ,0.71463,0.66350,0.67064,0.62197,0.62000,
     *          0.66756,0.63005,0.0    ,0.0    ,7*0.0,
     *          0.69350,0.0    ,0.72807,0.68111,0.69055,0.64047,0.64000,
     *          0.68413,0.65000,0.0    ,0.0    ,7*0.0,
     *          0.71068,0.0    ,0.74074,0.69901,0.70721,0.65980,0.66000,
     *          0.70000,0.66682,0.0    ,0.0    ,7*0.0,
     *          0.72816,0.0    ,0.75296,0.71722,0.72031,0.67976,0.68000,
     *          0.71481,0.68318,0.0    ,0.0    ,7*0.0/
       DATA DN6/0.74602,0.0    ,0.76500,0.73583,0.73286,0.70000,0.70000,
     *          0.72984,0.70000,0.0    ,0.0    ,7*0.0,
     *          0.76424,0.0    ,0.77784,0.75490,0.74632,0.71731,0.71843,
     *          0.74579,0.71675,0.0    ,0.0    ,7*0.0,
     *          0.78297,0.0    ,0.79212,0.77447,0.76432,0.73769,0.73865,
     *          0.76417,0.73744,0.0    ,0.0    ,7*0.0,
     *          0.80235,0.0    ,0.80945,0.79471,0.78448,0.76651,0.76365,
     *          0.78422,0.76651,0.0    ,0.0    ,7*0.0,
     *          0.82240,0.0    ,0.82936,0.81564,0.80421,0.80000,0.79260,
     *          0.80477,0.80000,0.0    ,0.0    ,7*0.0,
     *          0.84353,0.0    ,0.85000,0.83759,0.82199,0.82090,0.82088,
     *          0.82532,0.82090,0.0    ,0.0    ,7*0.0,
     *          0.86563,0.0    ,0.86731,0.86067,0.84363,0.84311,0.85000,
     *          0.85000,0.84311,0.0    ,0.0    ,7*0.0,
     *          0.88970,0.0    ,0.88769,0.88557,0.87423,0.87978,0.88341,
     *          0.88277,0.87978,0.0    ,0.0    ,7*0.0/
       DATA DN7/0.91444,0.0    ,0.91400,0.91159,0.90617,0.91576,0.90998,
     *          0.91500,0.91576,0.0    ,0.0    ,7*0.0,
     *          0.94749,0.0    ,0.95000,0.94520,0.93827,0.95000,0.93871,
     *          0.95000,0.95000,0.0    ,0.0    ,7*0.0,
     *          1.00000,0.0    ,1.00000,1.00000,1.00000,1.00000,1.00000,
     *          1.00000,1.00000,0.0    ,0.0    ,7*0.0/
      END
