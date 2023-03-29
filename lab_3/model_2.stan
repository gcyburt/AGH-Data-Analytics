data {
  // number of trials
  int<lower=0> N;

  // number of successes (allergic reactions)
  int<lower=0, upper=N> y;
}

parameters {
  // probability of allergic reaction
  real<lower=0, upper=1> p;
}

model {
  // prior for p
  p ~ beta(1, 1);

  // likelihood
  y ~ binomial(N, p);
}

generated quantities {
  // predicted number of allergic reactions
  int<lower=0, upper=N> y_pred = binomial_rng(N, p);
}
