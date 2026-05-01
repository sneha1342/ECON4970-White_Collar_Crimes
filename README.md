## Project Summary
This project dives deeper into financial transactions, particularly those that are illegal. Using a dataset focusing on Black Money Transactions from Kaggle of approximately 10,000 observations during the timeframe 2013-2014, I was able to observe patterns and trends between countries and various industries where illicit activities were highly concentrated.

I have always been interested in investigative and financial fraud cases; and its even more interesting when you get to analyze this type of data. When I first came across this dataset, I was drawn to get the insights of where financial fraud takes place the most and what kind of industries are involved. Therefore, I took this not only as an academic project, but also as an opportunity to explore more about white collar crimes. 



## Key Objectives
* Depict how many transactions were legal and illegal during the time frame of the dataset
* Get an insight about where illegal activity tends to show up more
* Compare type of transactions based on risk score and industries
* Depict how the regression models determine which countries were sent more money during 2013-2014 


## Top techniques used 
* Data cleaning - Filter and Summarise functions 
* Exploratory data analysis 
* data visualizations - Bar & Pie Charts
* Binary Regression Models 



## Legal Vs. Illegal transactions
#### Figure 1:
<img src = "https://github.com/sneha1342/ECON4970-Final-Project-/blob/main/Legal%20vs.%20Illegal.png" alt = "Logo" width="500">

The pie chart above in **Figure 1** depicts proportion of legal versus illegal transactions. Legal transactions make up 29.83% of all transactions during 2013-2014, while illegal being 70.17% of the transactions. This clealy states that the dataset is heavily weighted towards illegal activities, making it appropriate data to analyze trends for fraud and illegal behavior. 


## Top 6 Countries with Illegal Transactions - 
#### Figure 2:
<img src = "https://github.com/sneha1342/ECON4970-Final-Project-/blob/main/Top%20countries%20with%20Illegal%20Trans.png" alt = "Logo" width="560">

The bar chart in **Figure 2** highlights the countries with the highest number of illegal transactions. Brazil appears at the top with 748 transactions, followed  by South Africa, China, the United Kingdom, and Russia, while India shows slightly fewer illegal transactions compared to others. The insignificant differences in these values is depicting the fact that illegal activities are spread in multiple areas (countries) and not just one particular region. Now, you might think why this is the case - why do countries like Brazil and South Africa have higher illegal activities? 

According to the sources, Brazil had the most illicit transactions made during the timeframe 2013-2014, because it serves as an entry and exit point on borders for traffickers. In other words, Brazil observed large scale illegal activities including smuggling and weapon trafficking due to a weaker control over weapons. In addition, a study conducted by BBC News, claims that a large number of animal trafficking took place in South Africa during this exact timeframe. For instance, over thousand rhinos were poached (killed) for their horns. This led to an increase in the illegal transactions being made in South Africa. 


## Industries Vs. Illicit Transactions
#### Figure 3: 
<img src = "https://github.com/sneha1342/ECON4970-Final-Project-/blob/main/Top%20Industries%20with%20Illegal%20Trans.png" alt = "Logo" width="560">

The bar chart in **Figure 3** highlights the industries with the highest number of illegal transactions in certain countries. Brazil again has the most illicit transactions i.e. 127, but in the Arms Trade industry. This finding, thereby, supports the study discussed in the above section. The Casinos industry in United Arab Emirates, on the other hand, has the least but significant amount of illicit transactions. This might be because Casinos are a major hub in the UAE to most illegal activities and most of the black money can easily be converted into white. Apart from Arms Trade and Casinos, other industries with slightly higher fraud activities are Finance, Luxury Goods, and Construction. These also play a major role in illicit activities as they involve transactions of large amounts in general.



## Mean Risk Score vs. Type of transaction 
#### Figure 4: 
<img src = "https://github.com/sneha1342/ECON4970-Final-Project-/blob/main/Risk%20Score.png" alt = "Logo" width = "560"> 

Cash Withdrawal has the most mean risk of being targeted in the financial fraud or money laundering, according to **Figure 4**. In fact, approximately $3,290,623,342 ($3.29) Billion dollars were involved in 1467 illegal transactions in cash withdrawal. Although all other types of transactions don't have any significant difference, the least risk is associated with the Offshore Transfers. According to AML network organization, Offshore Trnasfers is very vulnerable to financial frauds. That is why it is heavily monitored by financial institutions and international government bodies. 

## Regression Models - 
#### Model 1: Country of Origin
To understand the probability of illegal transactions in a better way, I built two linear regression models with "Illegality." The dependent variable is a binary operator where Illegal is assigned the value of "1" while legal is assigned the value of "0".

<img src = "https://github.com/sneha1342/ECON4970-White_Collar_Crimes/blob/main/Screenshot%202026-04-26%20131423.png" alt = "Logo" width = "400">

**Model 1** shows if the country where the transaction incurred predicts illegality. Out of 10 countries, Brazil is ommited from the model, serving as a baseline for all predictions in this model. Since China has the highest coefficient among all, it indicates that transactions incurred in China were more likely to be illegal during 2013 to 2014. Now, why might this be the case? The main reason is that China was considered a major hub for illicit money transfers (trade misinvoices) and underground banking in 2013-2014. Furthermore a study published on reuters, claims that about 410 Billion Yuan were involved in an underground banking case in China. 

#### Model 2: Destination Country
<img src = "https://github.com/sneha1342/ECON4970-White_Collar_Crimes/blob/main/Screenshot%202026-04-26%20132113.png" alt = "Logo" width = "400">

**Model 2** shows if the destination country - country where illegal funds were sent - predicts illegality. Out of 10 countries, Brazil serves as the baseline for all predictions in this model. USA has the highest coefficient among all other countries relative to Brazil. Ultimately leading to the fact that most probability of transferring the money involved in fraud was in the United States. However, it does not mean that ALL illegal money is sent to the USA. Few sources claim that it has liquid fianacial systems with extreme high and financial amounts, which can easily coverup any illegal transaction. This makes USA a strong destination country. 

## Descriptive Analysis - 
#### Figure 5:

<img src = "https://github.com/sneha1342/ECON4970-White_Collar_Crimes/blob/main/Screenshot%202026-04-26%20164910.png" alt = "Logo" width = "500">

The descriptive table depicts how risk score for money laundering is distributed among control and treatment groups. The control group in this project is **"Legal"** transactions, while treatment is **"Illegal"** transactions. According to **Figure 5**, everything except Mean is same, indicating that there is no significant difference in the distribution of risk scores among both legal and illegal transactions. The difference of 0.013 in the mean, however suggests that illegal transactions have slightly higher mean risk score than legal ones. 


### Run this Project - 
1. Clone this repository to your local machine
2. Download the ```Big_Black_Money_Dataset.csv``` from Kaggle
3. Place the CSV file in the cloned repository
4. Open and run ```Final Project.R``` in RStudio


### Outside References - 
1. https://africacenter.org/publication/wildlife-poaching-africas-surging-trafficking-threat/\
2. https://www.sciencedirect.com/science/article/pii/S0261560615002156?via%3Dihub
3. https://www.reuters.com/article/world/china-breaks-up-64-billion-underground-banking-state-media-idUSKCN0T910J/
4. https://www.globalpolicy.org/en/node/510
