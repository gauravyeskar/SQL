--        ###################################################
--        Final Project Summary: Crime & Justice Efficacy (2018–2022)
--        This project analyzed five years of NCRB data on rape cases across India, moving analysis beyond raw counts to assess the performance 
--        and efficiency of the entire justice pipeline (Police and Courts).
--        ###################################################

/* Stage 1: Data Modeling & Schema Design (The Foundation):- The goal is to convert it into a long format using two main tables. */
-- (i) Defining the table and Columns
-- (ii) Loading the data :- 
create table DIM_StateUT (StateUT_ID int primary key AUTO_INCREMENT,StateUT_Name varchar(100) not null unique);
INSERT INTO DIM_StateUT (StateUT_Name) VALUES ('Andhra Pradesh'), ('Arunachal Pradesh'),
('Assam'),('Bihar'),('Chhattisgarh'),('Goa'),('Gujarat'),('Haryana'),('Himachal Pradesh'),
('Jammu & Kashmir'),('Jharkhand'),('Karnataka'),('Kerala'),('Madhya Pradesh'),
('Maharashtra'),('Manipur'),('Meghalaya'),('Mizoram'),
('Nagaland'),('Odisha'),('Punjab'),('Rajasthan'),
('Sikkim'),('Tamil Nadu'),('Tripura'),('Uttar Pradesh'),
('Uttarakhand'),('West Bengal'),('A & N Islands'),('Chandigarh'),
('D & N Haveli and Daman & Diu'),('Delhi'),('Ladakh'),
('Lakshadweep'),('Puducherry'),('Telangana'),('Total State(s)');

CREATE TABLE FACT_RAPE_Cases (
    case_fact_id INT PRIMARY KEY AUTO_INCREMENT,
    StateUT_ID INT NOT NULL,
    year INT NOT NULL,
    cases_registered_Minor INT NOT NULL,
    cases_registered_Adult INT NOT NULL,
    cases_Registered_total INT NOT NULL,
    cases_Chargesheet_CCS INT NOT NULL,
    Trial_completed_CTC INT NOT NULL,
	FOREIGN KEY (StateUT_ID) REFERENCES DIM_StateUT(StateUT_ID)
);

INSERT INTO FACT_Rape_Cases (StateUT_ID, Year, Cases_Registered_Minor, Cases_Registered_Adult, Cases_Registered_Total, Cases_Chargesheet_CCS, Trial_Completed_CTC) VALUES
(1, 2018, 503, 468, 971, 898, 589),(1, 2019, 544, 542, 1086, 691, 686),(1, 2020, 577, 518, 1095, 1134, 402),(1, 2021, 614, 574, 1188, 1320, 305),
(1, 2022, 0, 621, 621, 585, 561),(2, 2018, 29, 38, 67, 52, 7),(2, 2019, 24, 39, 63, 42, 4),(2, 2020, 29, 31, 60, 63, 1),
(2, 2021, 54, 29, 83, 69, 23),(2, 2022, 30, 44, 74, 75, 26),(3, 2018, 89, 1559, 1648, 1283, 898),(3, 2019, 88, 1685, 1773, 1468, 519),
(3, 2020, 18, 1639, 1657, 1195, 462),(3, 2021, 3, 1730, 1733, 1175, 348),(3, 2022, 4, 1109, 1113, 1354, 710),(4, 2018, 4, 647, 651, 721, 159),
(4, 2019, 1, 729, 730, 539, 206),(4, 2020, 1, 805, 806, 697, 67),(4, 2021, 0, 786, 786, 684, 127),(4, 2022, 0, 881, 881, 915, 251),
(5, 2018, 1215, 876, 2091, 1959, 1274),(5, 2019, 3, 1033, 1036, 1051, 1263),(5, 2020, 13, 1197, 1210, 1221, 313),(5, 2021, 0, 1093, 1093, 1090, 482),
(5, 2022, 0, 1246, 1246, 1291, 886),(6, 2018, 0, 15, 15, 15, 7),(6, 2019, 0, 11, 11, 14, 2),(6, 2020, 0, 17, 17, 16, 2),
(6, 2021, 0, 25, 25, 28, 4),(6, 2022, 0, 25, 25, 27, 2),(7, 2018, 0, 810, 810, 689, 442),(7, 2019, 0, 785, 785, 638, 563),
(7, 2020, 0, 780, 780, 829, 208),(7, 2021, 0, 796, 796, 729, 340),(7, 2022, 0, 809, 809, 803, 303),(8, 2018, 160, 483, 643, 584, 170),
(8, 2019, 0, 938, 938, 770, 201),(8, 2020, 0, 930, 930, 800, 195),(8, 2021, 0, 1162, 1162, 1018, 250),(8, 2022, 0, 1737, 1737, 1259, 239),
(9, 2018, 0, 310, 310, 253, 114),(9, 2019, 0, 290, 290, 255, 136),(9, 2020, 0, 344, 344, 302, 101),(9, 2021, 0, 477, 477, 428, 186),
(9, 2022, 0, 529, 529, 463, 135),(10, 2018, 0, 196, 196, 163, 76),(10, 2019, 0, 237, 237, 185, 52),(10, 2020, 1, 164, 165, 119, 20),
(10, 2021, 0, 187, 187, 117, 33),(10, 2022, 0, 284, 284, 219, 44),(11, 2018, 14, 1109, 1123, 1007, 311),(11, 2019, 1, 1418, 1419, 1196, 335),
(11, 2020, 0, 1374, 1374, 1177, 123),(11, 2021, 0, 1716, 1716, 1581, 273),(11, 2022, 0, 1541, 1541, 1438, 206),(12, 2018, 0, 1650, 1650, 1782, 1005),
(12, 2019, 0, 1381, 1381, 1558, 866),(12, 2020, 0, 1128, 1128, 1215, 343),(12, 2021, 0, 1332, 1332, 1126, 420),(12, 2022, 0, 1228, 1228, 1162, 577),
(13, 2018, 0, 1916, 1916, 1667, 1144),(13, 2019, 0, 1883, 1883, 1324, 1085),(13, 2020, 0, 1783, 1783, 1212, 508),(13, 2021, 0, 2085, 2085, 1461, 881),
(13, 2022, 0, 2182, 2182, 1533, 933),(14, 2018, 0, 4882, 4882, 4528, 3037),(14, 2019, 0, 4771, 4771, 3591, 3106),(14, 2020, 0, 3960, 3960, 3497, 1032),
(14, 2021, 0, 3584, 3584, 3218, 1205),(14, 2022, 0, 3029, 3029, 3042, 1357),(15, 2018, 0, 1686, 1686, 1801, 747),(15, 2019, 0, 1797, 1797, 1980, 1079),
(15, 2020, 0, 1616, 1616, 1599, 442),(15, 2021, 0, 2404, 2404, 2154, 764),(15, 2022, 0, 2904, 2904, 2697, 1038),(16, 2018, 0, 42, 42, 36, 16),
(16, 2019, 0, 47, 47, 41, 15),(16, 2020, 0, 38, 38, 29, 13),(16, 2021, 0, 67, 67, 63, 13),(16, 2022, 0, 56, 56, 52, 23),
(17, 2018, 0, 46, 46, 38, 36),(17, 2019, 0, 52, 52, 46, 26),(17, 2020, 0, 65, 65, 60, 10),(17, 2021, 0, 67, 67, 57, 17),
(17, 2022, 0, 89, 89, 78, 20),(18, 2018, 0, 20, 20, 19, 2),(18, 2019, 0, 23, 23, 22, 4),(18, 2020, 0, 15, 15, 14, 6),
(18, 2021, 0, 21, 21, 16, 10),(18, 2022, 0, 22, 22, 20, 11),(19, 2018, 0, 18, 18, 14, 0),(19, 2019, 0, 27, 27, 23, 3),
(19, 2020, 0, 17, 17, 16, 1),(19, 2021, 0, 14, 14, 13, 4),(19, 2022, 0, 15, 15, 15, 3),(20, 2018, 0, 2525, 2525, 2025, 1059),
(20, 2019, 0, 2984, 2984, 2408, 1141),(20, 2020, 0, 2545, 2545, 2207, 731),(20, 2021, 0, 3163, 3163, 2728, 1007),(20, 2022, 0, 2603, 2603, 2503, 907),
(21, 2018, 0, 394, 394, 362, 134),(21, 2019, 0, 497, 497, 470, 139),(21, 2020, 0, 525, 525, 488, 155),(21, 2021, 0, 684, 684, 658, 175),
(21, 2022, 0, 755, 755, 715, 194),(22, 2018, 0, 4335, 4335, 3752, 1718),(22, 2019, 0, 5997, 5997, 4782, 1888),(22, 2020, 0, 5310, 5310, 4425, 1698),
(22, 2021, 0, 6265, 6265, 5202, 1888),(22, 2022, 0, 5399, 5399, 4429, 2197),(23, 2018, 0, 2, 2, 2, 1),(23, 2019, 0, 1, 1, 1, 0),
(23, 2020, 0, 2, 2, 2, 1),(23, 2021, 0, 1, 1, 1, 0),(23, 2022, 0, 5, 5, 5, 0),(24, 2018, 0, 486, 486, 452, 217),
(24, 2019, 0, 628, 628, 595, 220),(24, 2020, 0, 631, 631, 608, 157),(24, 2021, 0, 770, 770, 725, 237),(24, 2022, 0, 1146, 1146, 1083, 313),
(25, 2018, 0, 104, 104, 73, 22),(25, 2019, 0, 104, 104, 76, 21),(25, 2020, 0, 110, 110, 77, 19),(25, 2021, 0, 94, 94, 82, 26),
(25, 2022, 0, 96, 96, 85, 21),(26, 2018, 0, 4269, 4269, 3953, 2315),(26, 2019, 0, 4781, 4781, 3816, 2390),(26, 2020, 0, 2769, 2769, 2249, 1375),
(26, 2021, 0, 2589, 2589, 2845, 2219),(26, 2022, 0, 3690, 3690, 2824, 1935),(27, 2018, 268, 293, 561, 352, 76),(27, 2019, 184, 342, 526, 445, 193),(27, 2020, 5, 482, 487, 418, 119),(27, 2021, 0, 534, 534, 423, 212),
(27, 2022, 0, 867, 867, 754, 197),(28, 2018, 4, 1065, 1069, 858, 497),(28, 2019, 0, 1068, 1068, 948, 707),(28, 2020, 0, 1128, 1128, 983, 393),
(28, 2021, 0, 1123, 1123, 1108, 224),(28, 2022, 0, 1111, 1111, 991, 378),(29, 2018, 0, 0, 0, 0, 0),(29, 2019, 0, 0, 0, 0, 0),
(29, 2020, 0, 3, 3, 0, 0),(29, 2021, 0, 1, 1, 0, 0),(29, 2022, 0, 1, 1, 0, 0),(30, 2018, 1, 16, 17, 17, 0),
(30, 2019, 0, 18, 18, 16, 4),(30, 2020, 0, 14, 14, 12, 1),(30, 2021, 0, 17, 17, 19, 1),(30, 2022, 0, 20, 20, 16, 1),
(31, 2018, 0, 0, 0, 0, 0),(31, 2019, 0, 0, 0, 0, 0),(31, 2020, 0, 0, 0, 0, 0),(31, 2021, 0, 0, 0, 0, 0),
(31, 2022, 0, 0, 0, 0, 0),(32, 2018, 104, 1540, 1644, 1957, 801),(32, 2019, 84, 1530, 1614, 1569, 954),(32, 2020, 49, 1268, 1317, 1210, 329),
(32, 2021, 49, 1605, 1654, 1519, 342),(32, 2022, 49, 1555, 1604, 1515, 634),(33, 2018, 0, 0, 0, 0, 0),(33, 2019, 0, 0, 0, 0, 0),
(33, 2020, 1, 1, 2, 1, 2),(33, 2021, 1, 1, 2, 1, 1),(33, 2022, 1, 4, 5, 5, 1),(34, 2018, 0, 2, 2, 0, 0),
(34, 2019, 0, 0, 0, 0, 0),(34, 2020, 0, 3, 3, 0, 0),(34, 2021, 0, 0, 0, 2, 0),(34, 2022, 0, 4, 4, 3, 0),
(35, 2018, 0, 0, 0, 0, 0),(35, 2019, 0, 10, 10, 7, 0),(35, 2020, 0, 8, 8, 10, 10),(35, 2021, 0, 2, 2, 2, 0),
(35, 2022, 0, 9, 9, 12, 3),(36, 2018, 0, 1558, 1558, 1958, 801),(36, 2019, 0, 1531, 1531, 1570, 954),(36, 2020, 0, 1269, 1269, 1212, 329),
(36, 2021, 0, 1612, 1612, 1523, 342),(36, 2022, 0, 1567, 1567, 1533, 635),(37, 2018, 9312, 24044, 33356, 28469, 17313),(37, 2019, 4936, 27096, 32032, 24938, 16911),
(37, 2020, 2640, 25406, 28046, 23693, 9713),(37, 2021, 3033, 28644, 31677, 26164, 11783),(37, 2022, 1004, 30512, 31516, 26508, 18517);

select * from dim_stateut order by StateUT_ID;
Select * from fact_rape_cases;

-- Stage 3, Topic 1 (Basic): Core Aggregation and Retrieval:- 
select * from dim_stateut state
join fact_rape_cases rape on state.StateUT_ID = rape.StateUT_ID order by state.StateUT_ID;

-- Calculates the sum of Cases_Registered_Total for each state.
select state.StateUT_Name,sum(cases_Registered_total) as total_cases_from_2018_2022  from dim_stateut state
join fact_rape_cases rape on state.StateUT_ID = rape.StateUT_ID Where state.StateUT_Name not in ('Total State(s)','Total UT(s)') 
group by state.StateUT_Name order by total_cases_from_2018_2022 desc limit 5;

-- Topic 2 (Basic) - Age Group Comparison :- 
--  State-wise Comparison of Minor vs. Adult Cases (2022).
select d.StateUT_Name,f.cases_registered_Adult,f.cases_registered_Minor,f.cases_Registered_total,(f.cases_registered_Adult / nullif(f.cases_registered_Minor,0)) as age_ratio 
from dim_stateut d join fact_rape_cases f on d.StateUT_ID = f.StateUT_ID
 where f.year = 2022 and d.StateUT_Name not in ('Total State(s)', 'Total UT(s)', 'Total (All India') 
 order by f.cases_Registered_total desc;

-- Topic 3 (Intermediate): Judicial Performance Analysis :- 
-- (i) Charge-sheet Ratio (Police investigated case):- 
select s.StateUT_Name,c.year,c.cases_Registered_total,c.cases_Chargesheet_CCS,((c.cases_Chargesheet_CCS / c.cases_Registered_total)*100.0) as Charge_sheet_ratio 
from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
 where s.StateUT_Name not in ('Total State(s)','Total UT(s)') and c.year = 2022 order by c.cases_Registered_total desc;

-- (ii) Trial Completion Ratio (Court Completed case) :-
select s.StateUT_Name,c.cases_Registered_total,c.Trial_completed_CTC,((c.Trial_completed_CTC / c.cases_Registered_total)*100.0) as Court_Disposal_case 
from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID where c.year = 2022 and s.StateUT_Name not in('Total State(s)') 
order by c.cases_Registered_total desc;

-- Write the SQL query that calculates the two ratio percentages (Charge_Sheet_Ratio_Percent and Trial_Completion_Ratio_Percent) for every state in 2022. 
SELECT s.StateUT_Name, c.Cases_Registered_Total, c.Cases_Chargesheet_CCS, c.Trial_Completed_CTC,
(c.Cases_Chargesheet_CCS * 100.0 / NULLIF(c.Cases_Registered_Total, 0)) AS Charge_Sheet_Ratio_Percent,
(c.Trial_Completed_CTC * 100.0 / NULLIF(c.Cases_Registered_Total, 0)) AS Trial_Completion_Ratio_Percent
FROM DIM_StateUT s JOIN FACT_Rape_Cases c ON s.StateUT_ID = c.StateUT_ID 
WHERE c.Year = 2022 AND s.StateUT_Name NOT IN ('Total State(s)', 'Total UT(s)', 'Total (All India)')
ORDER BY Trial_Completion_Ratio_Percent DESC;

-- Topic 4 (Intermediate): State Consistency and Vulnerability:- 
-- Tracking the state where minor are harested more then adult.
select s.StateUT_Name,c.cases_Registered_total,c.cases_registered_Minor,((c.cases_registered_Minor / c.cases_Registered_total) * 100.0) as minor_case_share_percent 
from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
 where year = 2022 and s.StateUT_Name not in ('Total State(s)', 'Total UT(s)') order by minor_case_share_percent desc;

-- Topic 5 (Intermediate): Long-Term Reliability :- 
select * from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID;
select s.StateUT_Name,avg(c.cases_Registered_total) as avg_cases,stddev_samp(c.cases_Registered_total) as Std_cases from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
 where s.StateUT_Name not in ('Total State(s)') group by s.StateUT_Name order by Std_cases desc;

-- Stage 4: Advanced Analysis (Window Functions and CTEs)
-- Calculate the Year-over-Year (YoY) percentage change in Cases_Registered_Total for every State/UT.
WITH Lagged_Cases AS (SELECT s.StateUT_Name,c.Year,c.Cases_Registered_Total,LAG(c.Cases_Registered_Total, 1, 0) OVER ( PARTITION BY s.StateUT_Name ORDER BY c.Year ) AS Previous_Cases 
FROM DIM_StateUT s JOIN FACT_Rape_Cases c ON s.StateUT_ID = c.StateUT_ID
    WHERE s.StateUT_Name NOT IN ('Total State(s)', 'Total UT(s)', 'Total (All India)') )
SELECT StateUT_Name,Year,Cases_Registered_Total AS Current_Year_Cases, Previous_Cases, CASE WHEN Previous_Cases = 0 THEN NULL 
ELSE ((Cases_Registered_Total - Previous_Cases) * 100.0 / Previous_Cases) END AS YoY_Change_Percent
FROM Lagged_Cases ORDER BY StateUT_Name,Year;

-- Rank the states based on the Trial Completion Ratio in 2022.
with trial_ratio_2022 as (select s.StateUT_Name,c.Cases_Registered_Total,c.Trial_Completed_CTC,
(c.Trial_Completed_CTC * 100.0 / NULLIF(c.Cases_Registered_Total, 0)) AS Trial_Completion_Ratio_Percent
from DIM_StateUT s join FACT_Rape_Cases c on s.StateUT_ID = c.StateUT_ID 
where c.Year = 2022 and s.StateUT_Name not in ('Total State(s)', 'Total UT(s)', 'Total (All India)')
)
select StateUT_Name,Cases_Registered_Total,Trial_Completed_CTC,Trial_Completion_Ratio_Percent,
dense_rank() over (ORDER BY Trial_Completion_Ratio_Percent DESC) AS Trial_Completion_Rank
from trial_ratio_2022 order by Trial_Completion_Rank;

-- Find all instances (State and Year) where the Year-over-Year (YoY) increase in Cases_Chargesheet_CCS was greater than 100%
with CTE_Lagged as ( select
        s.StateUT_Name,
        c.Year,
        c.Cases_Chargesheet_CCS as Current_CCS,
        lag(c.Cases_Chargesheet_CCS, 1) over (
            partition by s.StateUT_Name 
            order by c.Year
        ) as Previous_CCS
    from
        DIM_StateUT s
    join
        FACT_Rape_Cases c on s.StateUT_ID = c.StateUT_ID
    where
        s.StateUT_Name not in ('Total State(s)', 'Total UT(s)', 'Total (All India)')
),
CTE_YoY as (
select StateUT_Name,Year,
        Current_CCS, Previous_CCS,((Current_CCS - Previous_CCS) * 100.0 / NULLIF(Previous_CCS, 0)) AS YoY_Change_Percent
        from CTE_Lagged
)
select stateUT_Name,Year,Current_CCS,Previous_CCS,
    YoY_Change_Percent from CTE_YoY where
    YoY_Change_Percent > 100 order by YoY_Change_Percent DESC;

-- Which states in 2022 reported zero cases charge-sheeted (Cases_Chargesheet_CCS), despite having registered cases?
select s.StateUT_Name,c.cases_Chargesheet_CCS,c.cases_Registered_total from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
where c.year = 2022 and c.cases_Chargesheet_CCS = 0 and c.cases_Registered_total >0;

-- Which state has the highest percentage of minor cases compared to total cases in 2022?
select s.StateUT_Name,c.cases_registered_Minor,c.cases_Registered_total,(c.cases_registered_Minor * 100.0 / nullif(c.cases_Registered_total,0)) as minor_case_share_percent 
from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
where c.year = 2022 and s.StateUT_Name not in ('Total State(s)', 'Total UT(s)', 'Total (All India)') order by minor_case_share_percent desc limit 5;

-- For the state of Rajasthan, calculate the running total (cumulative sum) of Cases_Registered_Total from the earliest year (2018) to the latest year (2022).
select s.StateUT_Name,c.year,c.cases_Registered_total,
sum(c.cases_Registered_total) over(partition by s.StateUT_Name order by c.year rows between unbounded preceding and current row) as cumlative_cases_total
from dim_stateut s join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID 
where s.StateUT_Name = 'Maharashtra';

-- By the end of each year, what percentage of the total 5-year All-India registered cases did 
-- the state of Rajasthan account for cumulatively?
with grand_total as (
	select sum(c.cases_Registered_total) as national_Grand_Total from dim_stateut s 
    join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
    where s.StateUT_Name = 'Total(All India)') 
select s.StateUT_Name,f.year,f.cases_Registered_total as Annual_case,
sum(f.cases_Registered_total)over(partition by s.StateUT_Name order by f.year)as cum_state_total,
(sum(f.cases_Registered_total) over(partition by s.StateUT_Name order by f.year) *100.0 / 
(select national_Grand_Total from Grand_Total)) as cum_share_percent from dim_stateut s 
join fact_rape_cases f on s.StateUT_ID = f.StateUT_ID
where s.StateUT_Name = 'Rajasthan' order by f.year;

-- write the SQL query that calculates the Rolling_3_Year_Avg_CCS for Madhya Pradesh across all five years, using the AVG() function with the ROWS BETWEEN clause.
select c.year,c.cases_Chargesheet_CCS, avg(c.cases_Chargesheet_CCS) over(partition by s.StateUT_Name order by c.year rows between 2 preceding and current row) as 3_yr_rolling_avg_CSS 
from dim_stateut s 
join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID
where s.StateUT_Name = 'Madhya Pradesh' 
order by c.year;

-- Top 10 States/UTs with the Largest Increase in Pending Cases (2018-2022)
select s.StateUT_Name,s.StateUT_id,sum(c.cases_Registered_total) as total_Registered_cases,
sum(c.cases_Chargesheet_CCS) as total_Charge_casesheet,
((sum(c.cases_Registered_total))-(sum(c.cases_Chargesheet_CCS))) as Pending_cases from dim_stateut s 
join fact_rape_cases c on s.StateUT_ID = c.StateUT_ID group by c.StateUT_ID order by total_Registered_cases desc
limit 10;

-- ##################
-- Core Conclusion
-- This data analysis successfully provided a metric-driven performance dashboard, highlighting States/UTs that excel in court disposal capacity 
-- and those facing critical challenges in timely police investigation and charge-sheeting. The project established a methodology for diagnosing 
-- efficiency throughout the criminal justice process.
-- ###################################################################################################################################################################
-- -------------------------------X---------END OF PROJECT---------X--------------------------------------------------