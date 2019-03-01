library(ggplot2)

x_grid_1 <- seq(from = -4, to = 0, length = 101)

region_to_shade1 <- data.frame(
  x = c(-4, x_grid_1, 0),
  y = c(0, dnorm(x_grid_1, log = FALSE), 0)
)

ggplot(data = data.frame(x = c(-4, 4)), mapping = aes(x = x)) +
  geom_polygon(
    mapping = aes(x = x, y = y),
    fill = "cornflowerblue",
    data = region_to_shade1) +
      stat_function(fun = dnorm) +
  geom_vline(xintercept = 0) +
  coord_cartesian(xlim = c(-4, 4), ylim = c(0, 0.75), expand = FALSE) +
  xlab("log(x)") +
  ylab("") +
  theme_bw(base_size = 16)



x_grid_2 <- seq(from = 0, to = 1, length = 101)

region_to_shade2 <- data.frame(
  x = c(0, x_grid_2, 1),
  y = c(0, dlnorm(x_grid_2, log = FALSE), 0)
)

ggplot(data = data.frame(x = c(0, 8)), mapping = aes(x = x)) +
  geom_polygon(
    mapping = aes(x = x, y = y),
    fill = "cornflowerblue",
    data = region_to_shade2) +
  stat_function(fun = dlnorm, n = 1001) +
  geom_vline(xintercept = 0) +
  coord_cartesian(xlim = c(0, 8), ylim = c(0, 0.75), expand = FALSE) +
  ylab("") +
  theme_bw(base_size = 16)

