data {
  int<lower=0> N;
  real<lower=0> heights[N];
}

parameters {
  real mi;
  real<lower=0> delta;
}

model {
  mi ~ normal(175, 10);
  delta ~ cauchy(0, 10);
  heights ~ normal(mi, delta);
}

generated quantities {
  real height_sim = normal_rng(mi, delta);
}
