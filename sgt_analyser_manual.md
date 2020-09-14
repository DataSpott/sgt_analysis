# SGT-Analyser manual

Welcome to the ***"SGT-Analyser"***, a tool for the automated analysis of antibiotic-synergisms via the "Start Growth Time"-method.


## 1. General information

The program ***"SGT-Analyser"*** uses the "Start Growth Time"-methode to analyse growth-curves and allow a statement about a possible synergism between two antibiotics.

By uploading an excel-dataset and defining the checkerboard as well as the antibiotics the program caluclates first the SGT-value of each well on the checkerboard and consequential the log-level-reduction of each well and the "Fractional Inhibitory Concentration Index" (FICI)-average for each checkerboard.

The layouts of the checkerboards at the well-plate are determined by using information about the first and last well of the board. The first well refers to the well in the upper left corner and should be your control (-> concentration of both antibiotics = 0 µg/ml). The last well describes the well in the lower right corner of the board. The layout is for better understanding also illustrated in the following image 1.

![Checkerboard-blueprint wasn´t able to load...](https://raw.githubusercontent.com/DataSpott/SGT-Analysis/master/pictures/Checkerboard_blueprint_with_description.png "Checkerboard-Blueprint")

The user can choose if the, for the calculations needed, µ-value is calculated automatically or if a manual input of a linear area over all growth-curves shall be used for the calculations.

To calculate the FICI-average the program uses the respectively first wells of each row and column of a checkerboard, that reached a log-level-reduction of equal to or more than 3 log-levels.

As a guideline:
* a FICI-average of <= 0.5 can be assumed as synergism between both antibiotics
* a value of 0.5 < FICI-average < 2.0 can be assumed as addition-effect between both antibiotics
* a FICI-average of >= 2.0 can be assumed as antagonism between both antibiotics

```bash
Due to limitations in the input of antibiotic concentrations the tool can only handle checkerboards 
with a similiar layout (= the same antibiotic combinations & arrangement for each checkerboard). 
To run checkerboards with different concentration-combinations or arrangements of the antibiotics 
please run multiple instances of the program instead.
```

```bash
SGT-Analyser uses Excel-formats as the Tecan Infinite or Tecan Sunrise create.
To download example-files of the supported formats use the links provided under "4. Testing SGT-Analyser".
```

You can make a Testrun by using the example data-files and parameters provided in chapter "4. Testing SGT-Analyser".


## 2. Using SGT-Analyser in Google Colab

### 2.1. Getting started in Google Colab

* To set the program up left-click the link [![badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/DataSpott/SGT-Analysis/blob/master/sgt_analyser.ipynb)
* a new browser-tab will be opened, which is directed to the Colab environment, where the program is set up

### 2.2. Executing the program in Google Colab

**1. Data-upload and program-initialization**
*  start the program by left-clicking the Play-Button of the first block
*  the first code-block will be executed and, after a confirmation that the installation is completed, a "browse"-button appear beneath the block
*  by left-clicking the "browse"-button an explorer-window opens and you can browse for your Excel-file

:::danger
The program is only able to read Excel-files in a format as created from the Tecan-Sunrise and -Infinite. If your data wasn´t created by such an device please bring your data first into a format matching one of the example-files in chapter "4. Testing SGT-Analyser" before you upload it.
:::

* select the Excel-file by double left-clicking or by a single left-click combined with a left-click at the button "Open"
* the file will now be uploaded and the upload will get confirmed with a text-message

```bash
If you run the program the first time in your browser make sure to allow cookies for this website, 
because otherwise Colab won´t be able to upload your data.
Also sometimes after opening the program for the first time following error-message appears:
"MessageError: TypeError: google.colab._files is undefined"
In this case just click the Play-Button again.
```

* when the text-message appears that the initialization is completed the first block is done

**2. Enter Parameters**
* insert your parameters into the according fields of the second block 
* start the second block by left-clicking the Play-button
* a image of your well-plate with the specified checkerboards will appear when the block is done

**3. Plot fitted sigmoid curves per Well**
* start the third block by left-clicking the Play-button
* the program will calculate a fitting sigmoid-curve for every well and, once finished, plot the raw data and fitted curve of each well

**4. Compute SGT-method & plot results**
* insert the Cut-Off-value for the OD in the fourth block 
* if you want to manually set a linear area from which the µ for the calculations is taken tick the box and insert a upper and lower border for the area
* start the fourth block by left-clicking the Play-button
* the program will calculate the SGT, log-level-reduction and FICI-average and print the results for each checkerboard as well as plots the resulting diagram for each well

**5. Download**
* start the fifth block by left-clicking the Play-button 
* a .md ("Markdown")-file with the results-tables and a .svg ("Scaleable Vector Graphic")-file with the resulting diagrams for all wells will be downloaded to your computer


## 3. Using SGT-Analyser with Shell-commandline

### 3.1 Getting started with Shell-commandline

* open a Shell-terminal
* use "git clone" to download the Git-repository from Github
* navigate into the downloaded repository-folder at your computer

```bash
The program is written using Python3, so there may be issues when executing with earlier Python-versions.
```

* if not present install pip3 for Python3 using
```bash
sudo apt install python3-pip
```

* use "pip3 install modul_name" to set up the following modules:
1. pandas
2. altair
3. xlrd
4. altair_saver
5. selenium
6. scipy
7. tabulate
8. IPython

### 3.2. Executing the program with Shell-commandline

* open a Shell-terminal
* use *"python3 ~/.../SGT_Analyser.py"* with the following flags to analyse your Excel-file:

**This flags are requried and specify your parameters**

1. --checkerboard_nr
2. --first_well
3. --last_well
4. --log_time
5. --antibiotic_one_name
6. --antibiotic_one_conc
7. --antibiotic_two_name 
8. --antibiotic_two_conc
9. --input **or** -i
10. --cut_off

**This flags are optional**

11. --output **or** -o
11. --use_linear_area **or** -u
12. --upper_boundary
13. --lower_boundary


**For help use the flag:**

14. -h **or** --help

```bash
If you use the optional flag --use_linear_area or -u you also need to use the flags --upper_boundary and --lower_boundary
```

* using only the required flags the program will automatically calculate µ
* if the *--output* flag isn't used the program creates a result-directory in the directory where SGT_Analyser.py is located
* using the optional flag *--output* **or** *-o* you can specify a directory-path where the program will create a results-directory
* using the optional flag *--use_linea_area* **or** *-u* in combination with *--upper_boundary* and *--lower_boundary* let you set a linear area over all grwoth-curves to calculate µ 
* write the corresponding parameters behind each flag as shown in the following example:

```
Example:
python3 ~/.../SGT_Analyser.py --checkerboard_nr 2 --first_well A01 A07 --last_well G06 G12 --log_time 70 --antibiotic_one_name Nitroxolin --antibiotic_one_conc 0 4 8 16 32 64 128 --antibiotic_two_name Dalbavancin --antibiotic_two_conc 0 0.5 1 2 4 8 --input ~/.../SGT_Analyser/Example_Data/Tecan_Sunrise_test_data.xlsx --cut_off 0.6 --output ~/.../SGT_Analyser --use_linear_area --upper_boundary 0.6 --lower_boundary 0.4
```

* confirm the command
* the program will inform you about it's progress via outputs to the terminal
* when the program finished the analysis it saves a .md ("Markdown")-file with the results-tables and a .svg ("Scaleable Vector Graphic")-file with the resulting diagrams for all wells in the created results-directory


## 4. Testing SGT-Analyser

### 4.1. Testing in Google Colab

To make a Testrun of the program using the Google Colab environment please download either of the two example-files by clicking the following links:

* <a href="https://github.com/DataSpott/SGT-Analysis/blob/master/example_data/tecan_sunrise_test_data.xlsx">Tecan-Sunrise example-file</a>
* <a href="https://github.com/DataSpott/SGT-Analysis/blob/master/example_data/tecan_infinite_test_data.xlsx">Tecan-Infinite example-file</a>

Alternatively download the example files directly from the Git-repository "SGT-Analysis".
* For this enter the subdirectory "Example data" by double left-click.
* Then left-click on either of the example file-names to open it.
* By left-clicking the download-button the file is downloaded to your computer

When running the first block "Data-upload and program-initialization" you can then browse for the example-files and upload them as described under chapter "2.2. Executing the program in Google Colab".

* follow the instructions as described in chapter "2.2. Executing the program in Google Colab"
* at the according points insert the following parameters:

|Parameter | Value| Comment|
|-|-|-|
|well_plate_format | 96|
|board_count | 2|
|first_wells | A01, A07|
|last_wells | G06, G12|
|log_time | 70|
|antibiotic_one_name | Nitroxoline|
|antibiotic_two_name | Dalbavancin|
|antibiotic_one_conc | 0, 4, 8, 16, 32, 64, 128|
|antibiotic_two_conc | 0, 0.5, 1, 2, 4, 8|
|cut_off | 0.6|
|upper_border| 0.6| only necessary if the box "use_linear_area" is ticked|
|lower_border| 0.4| only necessary if the box "use_linear_area" is ticked|

