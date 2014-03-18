% Read in the datafile
data = csvread('TGMC_SampleData.csv');

datasize = size(data);
% Remove the first column (row numbers)
data = data(:,2:datasize(2));
% Transpose so rows are now vectors
data = data';

% Define vector subsets' lower and upper indices.
% This way subsets can easily be changed by changing the
% values here and not the code.
s11 = 1;
s12 = 50;
s21 = 200;
s22 = 250;
s31 = 400;
s32 = 450;
s41 = 600;
s42 = 650;
s51 = 800;
s52 = 850;

% Time to create a network for each subset.
% Array of numbers represents 3 hidden layers of the sizes indicated
net1 = feedforwardnet([7 8 5], 'trainlm');
net2 = feedforwardnet([7 8 5], 'trainlm');
net3 = feedforwardnet([3 4 9], 'trainlm');
net4 = feedforwardnet([3 4 9], 'trainlm');
net5 = feedforwardnet([7 8 5], 'trainlm');

EPOCHS = 10000;
% Set number of epochs
net1.trainParam.epochs = EPOCHS;
net2.trainParam.epochs = EPOCHS;
net3.trainParam.epochs = EPOCHS;
net4.trainParam.epochs = EPOCHS;
net5.trainParam.epochs = EPOCHS;

% Set performance parameters
% Not sure how to get the ratio to work. I get a warning message
net1.performFcn='msereg';
net1.performParam.ratio=0.5;
net2.performFcn='msereg';
net2.performParam.ratio=0.5;
net3.performFcn='msereg';
net3.performParam.ratio=0.5;
net4.performFcn='msereg';
net4.performParam.ratio=0.5;
net5.performFcn='msereg';
net5.performParam.ratio=0.5;

% Train 'em up good
net1 = train(net1, data(1:319,s11:s12), data(320,s11:s12));
net2 = train(net2, data(1:319,s21:s22), data(320,s21:s22));
net3 = train(net3, data(1:319,s31:s32), data(320,s31:s32));
net4 = train(net4, data(1:319,s41:s42), data(320,s41:s42));
net5 = train(net5, data(1:319,s51:s52), data(320,s51:s52));
