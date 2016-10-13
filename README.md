# weather_forecast-data-mining-

PROBLEM STATEMENT:

To find the hidden patterns present inside the available weather
data and to predict the future atmospheric state using Decision
Tree.

We will be predicting the relative humidity and atmospheric pressure
for a day using the weather data ranging from 2012-2014.

The prediction is minutely basis for a day.


EVALUATION CRITIRIA:


Since we are using a linear regression model our evaluation metrics
are: MAE, MAPE and Area Under Curve.


DATA:


University of Edinburgh – School of Geosciences Raw weather data
is used.


The weather data for 2012-2014 consists of 525K rows (~90MB data
size).


The data is in minute-to-minute basis.


It has attributes such as date-time, atmospheric pressure, rainfall ,
wind speed, wind direction ,surface temperature, relative humidity
and solar flux.


Training data- 2012 to 2014 data. Test data- Jan 2015- April 2015
data.

DATA ANALYSIS


The data was checked for missing values, outliers and
unknown values.


Rattle package was used to cross-examine our manual
data analysis.


The datasets of the 2012-2014 was combined to obtain
the final training dataset.


Rattle allows ignoring the unnecessary attributes for
training.


The correlation between target attribute and the others
was found for reference to construct the decision tree
based on dependencies.


DECISION TREE


The decision tree is constructed for predicting the relative
humidity and atmospheric pressure for a day namely
Jan1,2015.


Rattle uses rpart() to construct the decision tree.


The method used here is “anova”


The decision trees are constructed for relative humidity
and atmospheric pressure by using the attributes from
decreasing values of correlation.


The tree is pruned by reducing the complexity (cp)
parameter.


The MAE and MAPE is determined to compare it with the
original data of Jan1,2015.


The Area Under Curve value determines how close the
predicted data is to that of the original data on the scale of
0 to 1.

