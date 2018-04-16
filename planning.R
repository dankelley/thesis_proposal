library(projectplanning)
data(gantt)
pdf("planning.pdf", width=10, height=4)
plot(gantt)
