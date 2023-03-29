generated quantities {
  int<lower=0> N = 50;  // number of trials
  int<lower=0, upper=N> y;  // number of successes
  real<lower=0, upper=1> p;  // probability of allergic reaction
  p = beta_rng(2, 2);  // prior for p (Beta(2, 2))
  y = binomial_rng(N, p);  // sample from binomial distribution
  real ratio = y / N;
}
