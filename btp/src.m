% maximize R with respect to waterlevel
n = 1;
waterlevel = 0.2; % initial guess
delta = 0.05;
diff = 1;

% Iteration
while diff > 1e-7

w = [waterlevel-delta/2 waterlevel+delta/2];
avgGradient = 0;
times = 2;

% Compute Average gradient
for i = 1:times

[R, ~] = simulateChain(w,parameters);
avgGradient = avgGradient+(R(2)-R(1))/delta;

end

avgGradient = avgGradient/times;

a_n = 1/(10*n); % Step Size

%Stochastic Gradient Scheme
waterlevel = waterlevel + a_n*avgGradient;

diff = abs(a_n*(R(1)-R(2))/delta);
n = n+1;

end