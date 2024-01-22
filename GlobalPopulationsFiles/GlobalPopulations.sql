CREATE DATABASE GlobalPopulation;
SHOW DATABASES;
USE GlobalPopulation;
SELECT DATABASE();

CREATE TABLE GlobalPopulation.WorldCountryPopulations(
	population_in_2023 INT,
    population_in_2022 INT,
    city VARCHAR(50),
    country VARCHAR(50),
    population_growthRate FLOAT,
    type VARCHAR(20)
);

SHOW VARIABLES LIKE 'secure_file_priv';

#Loading data from csv file into the table
LOAD DATA INFILE '/Users/varkol/Desktop/SQL-Side-Project/world-country-populations.csv' 
INTO TABLE GlobalPopulation.WorldCountryPopulations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Loading csv data directly into the table is not working, so we will insert all the records manually
INSERT INTO GlobalPopulation.WorldCountryPopulations (population_in_2023, population_in_2022, city, country, population_growthRate, type)
VALUES
(7194105,37274002,"Tokyo","Japan",-0.0021,"w"),
(32941309,32065760,"Delhi","India",0.0273,"w"),
(29210808,28516903,"Shanghai","China",0.0243,"w"),
(23209616,22478117,"Dhaka","Bangladesh",0.0325,"w"),
(22619736,22429799,"Sao Paulo","Brazil",0.0085,"w"),
(22281442,22085139,"Mexico City","Mexico",0.0089,"w"),
(22183201,21750020,"Cairo","Egypt",0.0199,"w"),
(21766214,21333331,"Beijing","China",0.0203,"w"),
(21296517,20961473,"Mumbai","India",0.016,"w"),
(19013434,19059857,"Osaka","Japan",-0.0024,"w"),
(17340704,16874741,"Chongqing","China",0.0276,"w"),
(17236230,16839950,"Karachi","Pakistan",0.0235,"w"),
(16315534,15628085,"Kinshasa","DR Congo",0.044,"w"),
(15945912,15387639,"Lagos","Nigeria",0.0363,"w"),
(15847768,15636243,"Istanbul","Turkey",0.0135,"w"),
(15490415,15369919,"Buenos Aires","Argentina",0.0078,"w"),
(15332793,15133888,"Kolkata","India",0.0131,"w"),
(14667089,14406059,"Manila","Philippines",0.0181,"w"),
(14284353,13964637,"Guangzhou","China",0.0229,"w"),
(14238643,14011828,"Tianjin","China",0.0162,"w"),
(13979390,13541764,"Lahore","Pakistan",0.0323,"w"),
(13727720,13634274,"Rio de Janeiro","Brazil",0.0069,"w"),
(13607800,13193035,"Bangalore","India",0.0314,"w"),
(13072633,12831330,"Shenzhen","China",0.0188,"w"),
(12680389,12640818,"Moscow","Russia",0.0031,"w"),
(11776147,11503293,"Chennai","India",0.0237,"w"),
(11507960,11344312,"Bogota","Colombia",0.0144,"w"),
(11248839,11074811,"Jakarta","Indonesia",0.0157,"w"),
(11208440,11142303,"Paris","France",0.0059,"w"),
(11204382,11044607,"Lima","Peru",0.0145,"w"),
(11069982,10899698,"Bangkok","Thailand",0.0156,"w"),
(10801163,10534418,"Hyderabad","India",0.0253,"w"),
(9988049,9975709,"Seoul","South Korea",0.0012,"w"),
(9698464,9429381,"Nanjing","China",0.0285,"w"),
(9653772,9478521,"Chengdu","China",0.0185,"w"),
(9648110,9540576,"London","United Kingdom",0.0113,"w"),
(9569328,9571596,"Nagoya","Japan",-0.0002,"w"),
(9499781,9381546,"Tehran","Iran",0.0126,"w"),
(9320866,9077158,"Ho Chi Minh City","Vietnam",0.0268,"w"),
(9292336,8952496,"Luanda","Angola",0.038,"w"),
(8785174,8537646,"Xi-an Shaanxi","China",0.029,"w"),
(8718250,8591611,"Wuhan","China",0.0147,"w"),
(8650605,8450228,"Ahmedabad","India",0.0237,"w"),
(8621724,8419566,"Kuala Lumpur","Malaysia",0.024,"w"),
(8237206,8044878,"Hangzhou","China",0.0239,"w"),
(8074031,7764499,"Suzhou","China",0.0399,"w"),
(8064949,7784276,"Surat","India",0.0361,"w"),
(7888121,8172684,"New York City","NY",-0.0348,"us"),
(7775865,7404689,"Dar es Salaam","Tanzania",0.0501,"w"),
(7711305,7511920,"Baghdad","Iraq",0.0265,"w"),
(7684801,7643256,"Hong Kong","Hong Kong",0.0054,"w"),
(7682430,7538200,"Riyadh","Saudi Arabia",0.0191,"w"),
(7680967,7527975,"Shenyang","China",0.0203,"w"),
(7597386,7497263,"Foshan","China",0.0134,"w"),
(7587049,7511851,"Dongguan","China",0.01,"w"),
(7166374,6987077,"Pune","India",0.0257,"w"),
(6903392,6856939,"Santiago","Chile",0.0068,"w"),
(6803811,6665951,"Haerbin","China",0.0207,"w"),
(6751374,6713557,"Madrid","Spain",0.0056,"w"),
(6371958,6312974,"Toronto","Canada",0.0093,"w"),
(6344348,6160327,"Khartoum","Sudan",0.0299,"w"),
(6247889,6194292,"Belo Horizonte","Brazil",0.0087,"w"),
(6198016,6065354,"Johannesburg","South Africa",0.0219,"w"),
(6080859,6039577,"Singapore","Singapore",0.0068,"w"),
(6077995,5930140,"Dalian","China",0.0249,"w"),
(5986525,5865232,"Qingdao","China",0.0207,"w"),
(5859272,5690312,"Zhengzhou","China",0.0297,"w"),
(5806031,5663015,"Ji-nan Shandong","China",0.0253,"w"),
(5687356,5658472,"Barcelona","Spain",0.0051,"w"),
(5686350,5515790,"Abidjan","Ivory Coast",0.0309,"w"),
(5610241,5514454,"Yangon","Myanmar",0.0174,"w"),
(5588477,5483605,"Alexandria","Egypt",0.0191,"w"),
(5561294,5535556,"Saint Petersburg","Russia",0.0046,"w"),
(5490271,5502591,"Fukuoka","Japan",-0.0022,"w"),
(5460591,5227794,"Addis Ababa","Ethiopia",0.0445,"w"),
(5419880,5339583,"Guadalajara","Mexico",0.015,"w"),
(5397098,5309690,"Ankara","Turkey",0.0165,"w"),
(5379660,5252842,"Chittagong","Bangladesh",0.0241,"w"),
(5325160,5118844,"Nairobi","Kenya",0.0403,"w"),
(5253385,5067352,"Hanoi","Vietnam",0.0367,"w"),
(5235407,5150766,"Melbourne","Australia",0.0164,"w"),
(5120894,5056571,"Sydney","Australia",0.0127,"w"),
(5116647,5036535,"Monterrey","Mexico",0.0159,"w"),
(4921487,4809887,"Changsha","China",0.0232,"w"),
(4890280,4800954,"Cape Town","South Africa",0.0186,"w"),
(4873048,4803877,"Brasilia","Brazil",0.0144,"w"),
(4865038,4710203,"Urumqi","China",0.0329,"w"),
(4862941,4780740,"Jiddah","Saudi Arabia",0.0172,"w"),
(4761284,4657381,"Kunming","China",0.0223,"w"),
(4710382,4616002,"Changchun","China",0.0204,"w"),
(4615758,4496456,"Hefei","China",0.0265,"w"),
(4588666,4457882,"Kabul","Afghanistan",0.0293,"w"),
(4573713,4490411,"Shantou","China",0.0186,"w"),
(4537901,4405292,"Ningbo","China",0.0301,"w"),
(4509287,4336670,"Yaounde","Cameroon",0.0398,"w"),
(4504147,4470672,"New Taipei","Taiwan",0.0075,"w"),
(4420855,4343584,"Tel Aviv","Israel",0.0178,"w"),
(4370473,4285135,"Shijiazhuang","China",0.0199,"w"),
(4348481,4219209,"Kano","Nigeria",0.0306,"w"),
(4315671,4297877,"Rome","Italy",0.0041,"w"),
(4307958,4276526,"Montreal","Canada",0.0073,"w"),
(4263940,4220458,"Recife","Brazil",0.0103,"w"),
(4211933,4185488,"Porto Alegre","Brazil",0.0063,"w"),
(4207084,4106756,"Jaipur","India",0.0244,"w"),
(4206240,4163953,"Fortaleza","Brazil",0.0102,"w"),
(4191890,4085697,"Nanning","China",0.026,"w"),
(4145010,4061003,"Taiyuan Shanxi","China",0.0207,"w"),
(4118327,4044660,"Ekurhuleni","South Africa",0.0182,"w"),
(4102308,4067758,"Medellin","Colombia",0.0085,"w"),
(4088555,3920873,"Kozhikode","India",0.0428,"w"),
(4063200,3926645,"Douala","Cameroon",0.0348,"w"),
(4009087,3816345,"Malappuram","India",0.0505,"w"),
(3981658,3869213,"Changzhou","China",0.0291,"w"),
(3958384,3920132,"Salvador","Brazil",0.0098,"w"),
(3945409,3854224,"Lucknow","India",0.0237,"w"),
(3935484,3862882,"Xiamen","China",0.0188,"w"),
(3922202,3843753,"Fuzhou Fujian","China",0.0204,"w"),
(3920379,3817888,"Nanchang","China",0.0268,"w"),
(3919724,3824561,"Wenzhou","China",0.0249,"w"),
(3892837,3840396,"Casablanca","Morocco",0.0137,"w"),
(3874908,3756445,"Ibadan","Nigeria",0.0315,"w"),
(3872264,3699900,"Antananarivo","Madagascar",0.0466,"w"),
(3846102,3651919,"Kampala","Uganda",0.0532,"w"),
(3839646,3652029,"Abuja","Nigeria",0.0514,"w"),
(3814702,3693292,"Tangshan Hebei","China",0.0329,"w"),
(3813082,3770919,"Curitiba","Brazil",0.0112,"w"),
(3769485,3809182,"Los Angeles","CA",-0.0104,"us"),
(3768239,3630326,"Kumasi","Ghana",0.038,"w"),
(3729351,3622203,"Bekasi","Indonesia",0.0296,"w"),
(3710845,3624804,"Faisalabad","Pakistan",0.0237,"w"),
(3580904,3495855,"Guiyang","China",0.0243,"w"),
(3573938,3570750,"Berlin","Germany",0.0009,"w"),
(3523890,3457626,"Santo Domingo","Dominican Republic",0.0192,"w"),
(3510511,3452315,"Asuncion","Paraguay",0.0169,"w"),
(3482456,3351322,"Thrissur","India",0.0391,"w"),
(3480101,3324694,"Port Harcourt","Nigeria",0.0467,"w"),
(3471949,3468139,"Busan","South Korea",0.0011,"w"),
(3437346,3375810,"Wuxi","China",0.0182,"w"),
(3429536,3326001,"Dakar","Senegal",0.0311,"w"),
(3422796,3384564,"Campinas","Brazil",0.0113,"w"),
(3406055,3301294,"Kochi","India",0.0317,"w"),
(7194105,37274002,"Tokyo","Japan",-0.0021,"w"),
(32941309,32065760,"Delhi","India",0.0273,"w"),
(29210808,28516903,"Shanghai","China",0.0243,"w"),
(3344761,3294779,"Puebla","Mexico",0.0152,"w"),
(3302077,3208722,"Indore","India",0.0291,"w"),
(3297759,3238523,"Kuwait City","Kuwait",0.0183,"w"),
(3157538,3132527,"Pyongyang","North Korea",0.008,"w"),
(3154570,3149223,"Milan","Italy",0.0017,"w"),
(3154463,3153781,"Athens","Greece",0.0002,"w"),
(3142466,3092355,"Guayaquil","Ecuador",0.0162,"w"),
(1611651,1597844,"Calgary","Canada",0.0175,"w"),
(1635458,1609057,"Qiqihaer","China",0.0164,"w"),
(1627549,1620227,"Marseille","France",0.0045,"w"),
(1623382,1552630,"Onitsha","Nigeria",0.0456,"w"),
(1618313,1567437,"Mashhad","Iran",0.0151,"w"), -- Corrected entry
(1639613,1611475,"Karaj","Iran",0.0278,"w");


SELECT * FROM GlobalPopulation.WorldCountryPopulations;

#Let's check for the US cities
SELECT * FROM GlobalPopulation.WorldCountryPopulations
WHERE TYPE = "us";

#Let's check for Indian cities
SELECT * FROM GlobalPopulation.WorldCountryPopulations
WHERE COUNTRY = "India";

SELECT DISTINCT * FROM GlobalPopulation.WorldCountryPopulations
WHERE COUNTRY = "India";


#The reason why I applied distinct to the above query is because I noticed that there were some city names being duplicated
# Applying distinct to everything will remove out all the duplicates, which means that the cities are not duplicated

#We will be creating two new tables. One for US cities and another for Indian cities
CREATE TABLE GlobalPopulation.USCities(
	population_in_2023 INT,
    population_in_2022 INT,
    city VARCHAR(50),
    state VARCHAR(50),
    population_growthRate FLOAT,
    country_code VARCHAR(20)
);

CREATE TABLE GlobalPopulation.INCities(
	population_in_2023 INT,
    population_in_2022 INT,
    city VARCHAR(50),
    state VARCHAR(50),
    population_growthRate FLOAT,
    country_code VARCHAR(20)
);

SELECT * FROM GlobalPopulation.USCities;
SELECT * FROM GlobalPopulation.INCities;


INSERT INTO GlobalPopulation.USCities (population_in_2023,population_in_2022,city,state,population_growthRate,country_code)
VALUES
(7888121,8172684,"New York City","NY",-0.0348,"us"),
(3769485,3809182,"Los Angeles","CA",-0.0104,"us");

INSERT INTO GlobalPopulation.INCities (population_in_2023,population_in_2022,city,state,population_growthRate,country_code)
VALUES
(32941309,32065760,"Delhi","DL",0.0273,"in"),
(21296517,20961473,"Mumbai","MH",0.016,"in"),
(15332793,15133888,"Kolkata","WB",0.0131,"in"),
(13607800,13193035,"Bangalore","KA",0.0314,"in"),
(11776147,11503293,"Chennai","TN",0.0237,"in"),
(10801163,10534418,"Hyderabad","TS",0.0253,"in"),
(8650605,8450228,"Ahmedabad","GJ",0.0237,"in"),
(8064949,7784276,"Surat","GJ",0.0361,"in"),
(7166374,6987077,"Pune","MH",0.0257,"in"),
(4207084,4106756,"Jaipur","RJ",0.0244,"in"),
(4088555,3920873,"Kozhikode","KL",0.0428,"in"),
(4009087,3816345,"Malappuram","KL",0.0505,"in"),
(3945409,3854224,"Lucknow","UP",0.0237,"in"),
(3482456,3351322,"Thrissur","KL",0.0391,"in"),
(3406055,3301294,"Kochi","KL",0.0317,"in"),
(3302077,3208722,"Indore","MP",0.0291,"in");

#Inner Join
SELECT GlobalPopulation.USCities.city
FROM GlobalPopulation.USCities
INNER JOIN GlobalPopulation.INCities
ON GlobalPopulation.USCities.country_code = GlobalPopulation.INCities.country_code;
#Expect no results

#LEFT Join
SELECT GlobalPopulation.USCities.city
FROM GlobalPopulation.USCities
LEFT JOIN GlobalPopulation.INCities
ON GlobalPopulation.USCities.country_code = GlobalPopulation.INCities.country_code;
#Expect only US Cities

#RIGHT Join
SELECT GlobalPopulation.USCities.city
FROM GlobalPopulation.USCities
RIGHT JOIN GlobalPopulation.INCities
ON GlobalPopulation.USCities.country_code = GlobalPopulation.INCities.country_code;
#Expect only Indian Cities
#We got null values

#FULL OUTER Join
SELECT GlobalPopulation.USCities.city
FROM GlobalPopulation.USCities
FULL JOIN GlobalPopulation.INCities
ON GlobalPopulation.USCities.country_code = GlobalPopulation.INCities.country_code;
#Error
