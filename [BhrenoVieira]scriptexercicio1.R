################################################################################
################################################################################
################################################################################
############        Exerc�cio 1 - An�lise de Dados     #########################
############                Bhreno Vieira              #########################
############                     2021.1                #########################
################################################################################
################################################################################
################################################################################


#### Quest�o 1 - Crie um data.frame de 500 casos:  ####
#### Distribui��o Normal - desvio padr�o  ####

x1 <- rnorm(500)

x2 <- rnorm(500)

summary(x1)
summary(x2)

plot(x1)
plot(x2)

boxplot(x1, x2)

hist(x1)
hist(x2)

sd(x1)
sd(x2)


#### Vari�vel de Contagem (poisson) ####

x3 <- rpois(500, 0.7)

summary(x3)

hist(x3)
plot(x3)

#### Vari�vel de contagem com dispers�o (binomial negativa) ####

x4 <- rnbinom(500, mu = 2, size = 1)

summary(x4)

plot(x4)

hist(x4)

sd(x4)



#### Vari�vel binomial ####

x5 <-  rbinom(500, 1, 0.7)

summary(x5)

plot(x5)

table(x5)


#### Vari�vel qualitativa ####


x6 <- factor(x5, labels = c("Esquerda", "Direita"), lev = c("0", "1"))

table(x6)

#### vari�vel index ####

x7 <- seq(1, length(x1))

summary(x7)

plot(x7)


#### Criando o banco de dados ####

bdex <- data.frame(
  VNormal1 = x1, 
  VNormal2 = x2, 
  Poisson = x3, 
  BiNegativa = x4, 
  Binomial = x5, 
  Quali = x6,
  Index = x7
) 


names(bdex)
summary(bdex)
str(bdex)

setwd("C:/Users/Win10/Desktop/RScript")
dir()
saveRDS(bdex, file = "bdex.rds")


#### Quest�o 2 - Centralize as vari�veis normais #### 

central1 <- x1 - mean(x1)
hist(central1)
boxplot(central1, x1)
summary(central1)
summary(x1)



central2 <- x2 - mean(x2)
hist(central2)
boxplot(central2, x2)
summary(central2)
summary(x2)


#### Quest�o 3 - troque os 0 por 1 nas vari�veis de contagem ####

bdex$Poisson[bdex$Poisson == "0"] <- 1
table(bdex$Poisson)
hist(bdex$Poisson)


bdex$BiNegativa[bdex$BiNegativa == "0"] <- 1
table(bdex$BiNegativa)
hist(bdex$BiNegativa)

#### Quest�o 4 - Crie um novo data.frame com uma amostra de 100 casos ####

## Instalando pacotes:
# Este pacote foi utilizado para criar um novo data.frame com uma amostra de 
# 100 casos da base original.

install.packages("Momocs")
library(Momocs)


## Criando data.frame com amostra: 
bdexamostra <- sample_n(bdex, 100)

summary(bdexamostra)

## salvando nova base de dados:

saveRDS(bdexamostra, file = "bdexamostra2.rds")
