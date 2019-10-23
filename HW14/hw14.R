library(arules)
data("AdultUCI")
str(AdultUCI)
data("Adult")
itemFrequencyPlot(Adult, topN = 12, type = 'absolute')

rules <- apriori(Adult, parameter = list(supp = 0.5, conf = 0.3, maxlen = 4))
options(digits = 4)
supp_rules <- sort(rules, by = 'support')
inspect(supp_rules[1:12])
library(arulesViz)
plot(supp_rules[1:12], method = 'graph', measure = 'confidence', shading = 'lift')

dim(Adult)
tab <- crossTable(Adult)
tab['age=Middle-aged', 'age=Middle-aged']
tab['age=Middle-aged', 'workclass=Private']
