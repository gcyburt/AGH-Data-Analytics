generated quantities {
  real mi = normal_rng(175, 10); // prior mean and standard deviation of heights
  real<lower=0> delta = cauchy_rng(0, 10); // prior for standard deviation of measurements
  real height = normal_rng(mi, delta + 15); // measurement of height with unknown error
}
