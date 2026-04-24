install.packages("dplyr")
install.packages("tidyverse")

library(dplyr)
library(tidyverse)
-----------------------------------------------------------------------
# reading  in the data for black money 
  df = read.csv("Big_Black_Money_Dataset.csv")

# Transaction ID 🏷️: Unique identifier for each transaction (e.g., TX0000001).
# Country 🌍: Country where the transaction occurred (e.g., USA, China).
# Amount (USD) 💵: Transaction amount in US Dollars (e.g., 150,000.00).
# Transaction Type 🔄: Type of transaction (e.g., Wire Transfer, Real Estate Purchase).
# Date of Transaction 🗓️: Timestamp of the transaction (e.g., 2022-03-15 14:32:00).
# Person Involved 👤: Synthetic name or identifier of the entity involved (e.g., Entity_1234).
# Industry 🏦: Sector associated with the transaction (e.g., Real Estate, Finance).
# Destination Country ✈️: Country where the funds were sent (e.g., Switzerland).
# Reported by Authority ✅: Whether the transaction was flagged for further investigation (True/False).
# Source of Money 🧐: Classification of money origin (e.g., Business Revenue, Investment, High Risk).
# Risk Score (1-10) ⚠️: Risk level indicating potential financial irregularities (e.g., 8).
# Shell Companies Involved 🏢: Number of shell companies associated with the transaction (e.g., 3).
# Financial Institution 🏛️: Bank or institution handling the transaction (e.g., Bank_567).
# Tax Haven Country 🏝️: If applicable, the country where funds were transferred to a known tax haven (e.g., Cayman Islands

------------------------------------------------------------------------
  df = df |>
  select(
    Transaction.ID, Country, Amount..USD., Transaction.Type, Person.Involved, 
    Industry, Source.of.Money, Reported.by.Authority, Financial.Institution, 
    Money.Laundering.Risk.Score
  )

# making a pie chart to depict what percent of transactions are Legal and illegal 

# Convert counts to data frame
pie_df <- as.data.frame(table(df$Source.of.Money))
colnames(pie_df) <- c("Source", "Count") 

# making percentage of count
pie_df = pie_df |> 
  mutate(
    Percent = Count/sum(Count) * 100
  )

# Create pie chart
ggplot(pie_df, aes(x = "", y = Count, fill = Source)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  scale_fill_manual(
    values = c(
      "Legal" = "#92758A",
      "Illegal" = "#F7B7B3"
    )
  )+
  labs(
    title = "Legal vs Illegal Transactions",
    fill = "Source"
  ) +
  geom_text(aes(label = paste0(Percent,"%")),
            position = position_stack(vjust = 0.5
            ))+
  theme_void()

# Question 1 - 
# Finding which countries have the most illegal transactions - 
# Filter the data frame by illegal source of money 
# Group by country to find the total number of illegal transactions took place in each country

  df_illegal = df |>
    filter(Source.of.Money == "Illegal")
  
  illegal_country = df_illegal |>
    group_by(Country) |>
    summarise(
      Illegal_transactions = n()
    ) |>
    arrange(desc(Illegal_transactions))

# top 5 countries with illegal transactions
 top_illegal = head(illegal_country)

# MAKE A BAR GRAPH OF THIS SHOWING ALL 10 COUNTRIES 
install.packages("ggplot2")
library(ggplot2)
install.packages("scales")
library(scales)
 
 ggplot(data = top_illegal, aes(x = reorder(Country, Illegal_transactions), y = Illegal_transactions, fill = Country)) +
    geom_col() +
   geom_text(aes(label = comma(Illegal_transactions)), 
             vjust = -0.3,
             size = 4) + 
    scale_y_continuous(labels = scales::comma) +
    scale_fill_viridis_d(option = "rocket") +
    labs(
      title = "Top countries with Illegal Transactions",
      x = "Country",
      y = "Illegal Transactions") + 
    theme_classic() +
    theme(legend.position = "none")
 
 
 ggsave("D:/Personal/Sneha/Assignments GSU/Econ Data Science (R)/Top countries with Illegal Trans.png",
        width = 10, height = 6, bg = "white")
# the graph depicts the number of illegal transactions that took place in the top 6 countries 

 
# Question 2 -
# which industries have the most illegal transactions in these top 6 countries. 
 
 illegal_industry = df_illegal |>
   group_by(Country, Industry) |>
   summarise(
     Illegal_transactions = n()) |>
   arrange(desc(Illegal_transactions)) |>
    slice(1:5)
 
# getting 1 industry per country  
 top_industries = illegal_industry |>
   group_by(Country) |>
 slice_max(Illegal_transactions, n = 1)|>
   arrange(desc(Illegal_transactions))
   
  top_industry_country = head(top_industries)

# graphing top_industry_country as a bar graph 
  ggplot(data = top_industry_country, aes(x= reorder(Country,Illegal_transactions), y= Illegal_transactions, fill = Industry)) +
    geom_col()+
    geom_text(aes(label = comma(Illegal_transactions)), 
              vjust = -0.1,
              size = 4) +
    scale_y_continuous(labels = scales::comma) +
    scale_fill_manual(
      values = c(
        "Arms Trade" = "#C98",
        "Finance" = "#A9832A",
        "Luxury Goods" = "#7BCCC4",
        "Construction" = "#467",
        "Casinos" = "#42137A"
        )) +
    labs(
      title = "Top industries with Illegal Transactions",
      x = "Country",
      y = "Illegal Transactions", 
    fill = "Industry") +
    theme_classic() +
    theme(legend.position = "right")
  
  ggsave("D:/Personal/Sneha/Assignments GSU/Econ Data Science (R)/Top Industries with Illegal Trans.png",
       width = 10, height = 6, bg = "white")
 
# the graph depicts that Brazil had the most illegal trans. in Arms Trade industry in 2013
# whereas, UAE had the most illegal trans. in casinos industry during 2013
  # WHY? 
  
# grouping and summarizing for means 
  mean_rs = df_illegal |>
    group_by(Transaction.Type) |>
    summarise(
      mean_risk_score = mean(Money.Laundering.Risk.Score),
      Illegal_transaction = n()
    ) |>
    arrange(desc(Illegal_transaction))
    
# graphing which transaction types had the most risk score during 2013-2014

  ggplot(data = mean_rs,aes(x = mean_risk_score, y = reorder(Transaction.Type,mean_risk_score), 
                                   fill = Transaction.Type)) +
    geom_col()+
    geom_text(aes(label = round(mean_risk_score, 2)),
                 hjust = -0.07, 
                  size = 3.5) +
    scale_x_continuous(labels= scales:: comma)+
    scale_fill_viridis_d(option = "cividis") +
   labs(
      title = "Mean Risk Score Vs. Transaction Type",
      x = "Mean Risk Score",
      y = "Transaction Type",
      fill = "mean_risk_score") +
    theme_classic() +
    theme(legend.position = "none")

# the most Risk score is associated with Cash Withdrawal transaction type with 1467 
# illegal transactions in total 
# and the lowest in Offshore Transfer, meaning the lowest amount of risk of illegal 
# transaction is "Offshore Transfers". 


# using ggsave 
 ggsave("D:/Personal/Sneha/Assignments GSU/Econ Data Science (R)/Risk Score.png",
         width = 10, height = 6, bg = "white")
    
# Making Amount..USD. as numeric 
  df_illegal$Amount..USD.= as.numeric(
    chartr(",", "$", df_illegal$Amount..USD.)
  )
# Finding how much Money was involved in Cash Withdrawal illegal transactions 
  money_cw = df_illegal |>
    filter(Transaction.Type == "Cash Withdrawal") |>
    summarise(
      total_money = sum(Amount..USD., na.rm =TRUE)
    )

# the total amount of illegal money for cash withdrawal is $3,290,623,342 OR $3.29 B

  
# QUESTION 3 - 
  
# creating a column for "Illegality" showing legal as 0 and illegal as 1 
  df_clean = df |>
    mutate(
      Illegality = case_when(
        Source.of.Money == "Illegal" ~ 1,
        Source.of.Money == "Legal" ~ 0
      )
      ) |> 
    select(-Source.of.Money)
  

# what is increasing the probability that a trans. is illegal? - Destination country and country of trans.  
# creating a regression model to answer the question 
  
  model1 = lm(
    Illegality ~ Country, data = df_clean
  )
summary(model1) 


# The most transactions were made in South Africa with respect to Brazil as it is 
# omitted out from the regression 

model2 = lm(
  Illegality ~ Destination.Country, data = df_clean
)
summary(model2)


## the most illegal transactions were sent to India with respect to Brazil as it is
# omitted out from the regression 

# Making Legal transactions as Control group and Illegal trans. as Treatment group 

control= subset(df_clean, Illegality == 0)
treatment = subset(df_clean, Illegality == 1)

# finding the mean, median, and quartiles for risk score 

summary(control$Money.Laundering.Risk.Score)
summary(treatment$Money.Laundering.Risk.Score)

# making the descriptive table for both control and treatment groups taking their 
# Risk Score as our observation value. 

descriptive_table = data.frame(
  Group = c("Control", "Treatment"), 
  
  Minimum = c(
    min(control$Money.Laundering.Risk.Score,na.rm =TRUE),
    min(treatment$Money.Laundering.Risk.Score, na.rm = TRUE)
  ), 
  
  Q1 = c(
    quantile(control$Money.Laundering.Risk.Score, 0.25, na.rm =TRUE),
    quantile(treatment$Money.Laundering.Risk.Score, 0.25, na.rm = TRUE)
  ),
  
  
  Median = c(
    median(control$Money.Laundering.Risk.Score,na.rm =TRUE),
    median(treatment$Money.Laundering.Risk.Score, na.rm = TRUE)
  ), 
  
  Mean= c(
    mean(control$Money.Laundering.Risk.Score,na.rm =TRUE),
    mean(treatment$Money.Laundering.Risk.Score, na.rm = TRUE)
  ), 
  
  Q3 = c(
    quantile(control$Money.Laundering.Risk.Score, 0.75, na.rm =TRUE),
    quantile(treatment$Money.Laundering.Risk.Score, 0.75, na.rm = TRUE)
  ), 
  
  Maximum = c(
    max(control$Money.Laundering.Risk.Score,na.rm =TRUE),
    max(treatment$Money.Laundering.Risk.Score, na.rm = TRUE)
  )
)






