clear all, clc

ts = readtable('timeseries.csv');

ts.time = datetime(ts.time,'Format','yyyy-MM-dd''T''HH:mm:ss.SSSX','TimeZone','UTC');

ts.group5min = discretize(ts.time, minutes(5));

min5minutes = varfun(@min, ts, 'InputVariables', {'value'}, 'GroupingVariable', 'group5min');
max5minutes = varfun(@max, ts, 'InputVariables', {'value'}, 'GroupingVariable', 'group5min');
mean5minutes = varfun(@mean, ts, 'InputVariables', {'value'}, 'GroupingVariable', 'group5min');
std5minutes = varfun(@std, ts, 'InputVariables', {'value'}, 'GroupingVariable', 'group5min');

tsmin = min5minutes{:,3};
tsmax = max5minutes{:,3};
tsmean = mean5minutes{:,3};
tsstd = std5minutes{:,3};

C = table(tsmin, tsmax, tsmean, tsstd)