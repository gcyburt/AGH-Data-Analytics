data {
  int<lower=1> N;
  real height[N];
  real weight[N];
}

parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}

model {
  alpha ~ normal(170, 10);
  beta ~ normal(0, 1);
  sigma ~ normal(0, 10);
  
  for (i in 1:N) {
    height[i] ~ normal(alpha + beta * weight[i], sigma);
  }
}

generated quantities {
  real alpha_ppc;
  real beta_ppc;
  real<lower=0> sigma_ppc;
  real height_ppc[N];
  
  alpha_ppc = normal_rng(170, 10);
  beta_ppc = normal_rng(0, 1);
  sigma_ppc = abs(normal_rng(0, 10));
  
  for (i in 1:N) {
    height_ppc[i] = normal_rng(alpha_ppc + beta_ppc * weight[i], sigma_ppc);
  }
}
