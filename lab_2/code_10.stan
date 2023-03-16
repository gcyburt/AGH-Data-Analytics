data {
   int<lower=10> N;
}

parameters {
   real y[N];
   real theta;
}

model {
   y~normal(theta, 1);
   theta~normal(0,1);
}

generated quantities {
   real mean_y = mean(y);
}