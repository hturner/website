
# Binary logistic regression $\newcommand{\stext}[1]{{\style{font-family:inherit}{\text{#1}}}}$

$$
y_i =
\begin{cases}
1 & \stext{event happens}\\
0 & \stext{otherwise}
\end{cases}
$$

$$
\mu_i = E(y_i) = \stext{probability that event happens}
$$

$$
\text{var}(y_i) = \mu_i(1-\mu_i)
$$

Variance is completely determined by mean.

Common link functions are logit, probit, and (complementary) log-log, all
of which transform constrained $\mu$ into unconstrained $\eta$.







