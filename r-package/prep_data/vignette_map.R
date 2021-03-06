
library(aopdata)
library(sf)
library(ggplot2)
library(data.table)


# Download
df2 <- aop::read_access(city='bho',
                       mode='public_transport',
                       year=2019)

ggplot() +
  geom_boxplot(data=subset(df2, !is.na(R003)),
               aes(x = factor(R003), y=CMAET30, color=factor(R003))) +
  scale_color_brewer(palette = 'RdBu') +
  labs(title='Distribution of the proportion of jobs accessible', color="Income\ndecile",
       subtitle='by public transport in less than 30 min. by income decile',
       x='Income decile', y="Accessibility") +
  scale_x_discrete(labels=c("D1 Poorest", paste0('D', 2:9), "D10 Wealthiest")) +
  scale_y_continuous(labels = scales::percent) +
  theme_minimal()

weight=P001
summary(df2$P001)







library(aopdata)
library(data.table)

df <- aop::read_access(city='all', mode='walk', year=2019)

df[, round(weighted.mean(x = CMATT30, w=P001),3), by=name_muni]


