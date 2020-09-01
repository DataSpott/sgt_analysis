# SGT-Analyser
* by Riccardo Spott

## What is SGT-Analyser?
The SGT-Analyser is an tool for the automated analysis of growth-curves of, in an checkerboard-style treated bacteria.
The goal is to determine synergistic, additional or antagonistic effects between the two applied antibiotics.
For this the so called *"Start Growth Time"*-method is used.

## Getting started
You can use this program either in Google Colab or in your terminal.
The use via Google Colab is suited for non-informaticians and
provides a graphical interface to interact with.
To use the terminal-variant some informatical knowledge is required 
to setup the modules and use the flags.

In the following is described how to use either of this options.

### Using *SGT_Analyser* in Google Colab
* open the tab *"SGT_Analysis.ipynb"*
* use the link *"Open in Colab"*
* You will be directed to a Google Colab-site, where the program is setup
* start each block after the preceding, following the instrcutions given at the site

### Using *SGT_Analyser* in the terminal
* clone this git-repository to your computer using the command
```bash
git clone https://github.com/DataSpott/SGT-Analysis.git
```

* if not already installed use the following command to install pip for python3 in your terminal
:::info
sudo apt install python3-pip
:::

* use "pip3 install module_name" to install the following modules in your terminal
1. pandas
2. altair
3. xlrd
4. altair_saver
5. selenium
6. scipy
7. tabulate
8. IPython
9. tqdm

* 

**"SGT_Analyser.py"*-module in your terminal.

Further you will need an Excel-file with the data of your growth curves
## Using *SGT_Analyser* with Google Colab




Detailed instructions about the setup and use of *"SGT_Anaylser"* can be found in the manual provided in this repository.
