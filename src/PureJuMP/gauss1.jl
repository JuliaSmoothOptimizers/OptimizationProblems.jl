
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/gauss1.dat

NIST/ITL StRD
Dataset Name:  Gauss1            (Gauss1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  48)
               Certified Values  (lines 41 to  53)
               Data              (lines 61 to 310)

Procedure:     Nonlinear Least Squares Regression

Description:   The data are two well-separated Gaussians on a 
               decaying exponential baseline plus normally 
               distributed zero-mean noise with variance = 6.25.

Reference:     Rust, B., NIST (1996).

Data:          1 Response  (y)
               1 Predictor (x)
               250 Observations
               Lower Level of Difficulty
               Generated Data

Model:         Exponential Class
               8 Parameters (b1 to b8) 

               y = b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
                                   + b6*exp( -(x-b7)**2 / b8**2 ) + e

=#
# T. Migot, Montreal, 2023.

export gauss1

function gauss1(args...; kwargs...)
  y = Rational{Int}[
    97.62227 1.000000
    97.80724 2.000000
    96.62247 3.000000
    92.59022 4.000000
    91.23869 5.000000
    95.32704 6.000000
    90.35040 7.000000
    89.46235 8.000000
    91.72520 9.000000
    89.86916 10.000000
    86.88076 11.00000
    85.94360 12.00000
    87.60686 13.00000
    86.25839 14.00000
    80.74976 15.00000
    83.03551 16.00000
    88.25837 17.00000
    82.01316 18.00000
    82.74098 19.00000
    83.30034 20.00000
    81.27850 21.00000
    81.85506 22.00000
    80.75195 23.00000
    80.09573 24.00000
    81.07633 25.00000
    78.81542 26.00000
    78.38596 27.00000
    79.93386 28.00000
    79.48474 29.00000
    79.95942 30.00000
    76.10691 31.00000
    78.39830 32.00000
    81.43060 33.00000
    82.48867 34.00000
    81.65462 35.00000
    80.84323 36.00000
    88.68663 37.00000
    84.74438 38.00000
    86.83934 39.00000
    85.97739 40.00000
    91.28509 41.00000
    97.22411 42.00000
    93.51733 43.00000
    94.10159 44.00000
    101.91760 45.00000
    98.43134 46.00000
    110.4214 47.00000
    107.6628 48.00000
    111.7288 49.00000
    116.5115 50.00000
    120.7609 51.00000
    123.9553 52.00000
    124.2437 53.00000
    130.7996 54.00000
    133.2960 55.00000
    130.7788 56.00000
    132.0565 57.00000
    138.6584 58.00000
    142.9252 59.00000
    142.7215 60.00000
    144.1249 61.00000
    147.4377 62.00000
    148.2647 63.00000
    152.0519 64.00000
    147.3863 65.00000
    149.2074 66.00000
    148.9537 67.00000
    144.5876 68.00000
    148.1226 69.00000
    148.0144 70.00000
    143.8893 71.00000
    140.9088 72.00000
    143.4434 73.00000
    139.3938 74.00000
    135.9878 75.00000
    136.3927 76.00000
    126.7262 77.00000
    124.4487 78.00000
    122.8647 79.00000
    113.8557 80.00000
    113.7037 81.00000
    106.8407 82.00000
    107.0034 83.00000
    102.46290 84.00000
    96.09296 85.00000
    94.57555 86.00000
    86.98824 87.00000
    84.90154 88.00000
    81.18023 89.00000
    76.40117 90.00000
    67.09200 91.00000
    72.67155 92.00000
    68.10848 93.00000
    67.99088 94.00000
    63.34094 95.00000
    60.55253 96.00000
    56.18687 97.00000
    53.64482 98.00000
    53.70307 99.00000
    48.07893 100.00000
    42.21258 101.00000
    45.65181 102.00000
    41.69728 103.00000
    41.24946 104.00000
    39.21349 105.00000
    37.71696 106.0000
    36.68395 107.0000
    37.30393 108.0000
    37.43277 109.0000
    37.45012 110.0000
    32.64648 111.0000
    31.84347 112.0000
    31.39951 113.0000
    26.68912 114.0000
    32.25323 115.0000
    27.61008 116.0000
    33.58649 117.0000
    28.10714 118.0000
    30.26428 119.0000
    28.01648 120.0000
    29.11021 121.0000
    23.02099 122.0000
    25.65091 123.0000
    28.50295 124.0000
    25.23701 125.0000
    26.13828 126.0000
    33.53260 127.0000
    29.25195 128.0000
    27.09847 129.0000
    26.52999 130.0000
    25.52401 131.0000
    26.69218 132.0000
    24.55269 133.0000
    27.71763 134.0000
    25.20297 135.0000
    25.61483 136.0000
    25.06893 137.0000
    27.63930 138.0000
    24.94851 139.0000
    25.86806 140.0000
    22.48183 141.0000
    26.90045 142.0000
    25.39919 143.0000
    17.90614 144.0000
    23.76039 145.0000
    25.89689 146.0000
    27.64231 147.0000
    22.86101 148.0000
    26.47003 149.0000
    23.72888 150.0000
    27.54334 151.0000
    30.52683 152.0000
    28.07261 153.0000
    34.92815 154.0000
    28.29194 155.0000
    34.19161 156.0000
    35.41207 157.0000
    37.09336 158.0000
    40.98330 159.0000
    39.53923 160.0000
    47.80123 161.0000
    47.46305 162.0000
    51.04166 163.0000
    54.58065 164.0000
    57.53001 165.0000
    61.42089 166.0000
    62.79032 167.0000
    68.51455 168.0000
    70.23053 169.0000
    74.42776 170.0000
    76.59911 171.0000
    81.62053 172.0000
    83.42208 173.0000
    79.17451 174.0000
    88.56985 175.0000
    85.66525 176.0000
    86.55502 177.0000
    90.65907 178.0000
    84.27290 179.0000
    85.72220 180.0000
    83.10702 181.0000
    82.16884 182.0000
    80.42568 183.0000
    78.15692 184.0000
    79.79691 185.0000
    77.84378 186.0000
    74.50327 187.0000
    71.57289 188.0000
    65.88031 189.0000
    65.01385 190.0000
    60.19582 191.0000
    59.66726 192.0000
    52.95478 193.0000
    53.87792 194.0000
    44.91274 195.0000
    41.09909 196.0000
    41.68018 197.0000
    34.53379 198.0000
    34.86419 199.0000
    33.14787 200.0000
    29.58864 201.0000
    27.29462 202.0000
    21.91439 203.0000
    19.08159 204.0000
    24.90290 205.0000
    19.82341 206.0000
    16.75551 207.0000
    18.24558 208.0000
    17.23549 209.0000
    16.34934 210.0000
    13.71285 211.0000
    14.75676 212.0000
    13.97169 213.0000
    12.42867 214.0000
    14.35519 215.0000
    7.703309 216.0000
    10.234410 217.0000
    11.78315 218.0000
    13.87768 219.0000
    4.535700 220.0000
    10.059280 221.0000
    8.424824 222.0000
    10.533120 223.0000
    9.602255 224.0000
    7.877514 225.0000
    6.258121 226.0000
    8.899865 227.0000
    7.877754 228.0000
    12.51191 229.0000
    10.66205 230.0000
    6.035400 231.0000
    6.790655 232.0000
    8.783535 233.0000
    4.600288 234.0000
    8.400915 235.0000
    7.216561 236.0000
    10.017410 237.0000
    7.331278 238.0000
    6.527863 239.0000
    2.842001 240.0000
    10.325070 241.0000
    4.790995 242.0000
    8.377101 243.0000
    6.264445 244.0000
    2.706213 245.0000
    8.362329 246.0000
    8.983658 247.0000
    3.362571 248.0000
    1.182746 249.0000
    4.875359 250.0000
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:8])
  set_start_value.(x, [97, 0.009, 100, 65, 20, 70, 178, 16.5])
  # other: [94, 0.0105, 99, 63, 25, 71, 180, 20]

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        y[i, 1] - (
          x[1] * exp(-x[2] * y[i, 2]) +
          x[3] * exp(-(y[i, 2] - x[4])^2 / x[5]^2) +
          x[6] * exp(-(y[i, 2] - x[7])^2 / x[8]^2)
        )
      )^2 for i = 1:250
    )
  )

  return nlp
end
