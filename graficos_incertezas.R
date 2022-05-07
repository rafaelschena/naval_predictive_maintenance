# Gráfico de evolução dos modelos pelos cenários

library(ggplot2)
library(ggrepel)

df_comp <- read.csv('compressor_erros.csv')

# Gráfico para o compressor
p1 <- ggplot(df_comp, aes(Cenário, Acuracia.Recall, group = Algoritmo, colour = Algoritmo))

p2 <- p1 + geom_line(size = 1) + theme_bw() +  theme(legend.position="none")

(p3 <- p2 + geom_text_repel(data = df_comp[df_comp$Cenário==1,], aes(label = Algoritmo, 
                                                                     hjust = 1, vjust = 1))
  + ggtitle("Evolução de Acurácia x Recall_Emerg Compressor com Incertezas")
  + scale_x_continuous(limits = c(0, 2), n.breaks = 3)
  + scale_y_continuous(limits = c(0, 1), n.breaks = 10)
)

# Gráfico para a turbina

df_turb <- read.csv('turbina_erros.csv')

q1 <- ggplot(df_turb, aes(Cenário, Acuracia.Recall, group = Algoritmo, colour = Algoritmo))

q2 <- q1 + geom_line(size = 1) + theme_bw() +  theme(legend.position="none")

(q3 <- q2 + geom_text_repel(data = df_comp[df_comp$Cenário==1,], aes(label = Algoritmo, 
                                                                     hjust = 1, vjust = 1))
  + ggtitle("Evolução de Acurácia x Recall_Emerg Turbina com Incertezas")
  + scale_x_continuous(limits = c(0, 2), n.breaks = 3)
  + scale_y_continuous(limits = c(0, 1), n.breaks = 10)
)
