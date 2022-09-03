Poisson Generalized Additive Model (PGAM)
=====================================


A PGAM for the estimation neural tuning functions. Responses are rerpresented in terms of B-splines regularized by a smoothing enforcing penalization. B-spline coefficients and regularization hyperparameters are jointly learned from the data by numerical optimization of the a cross-validation score. The model infers maginal confidence bounds for the contribution of each feature to the neural response, and uses such bonuds to  identify the minimal subset of features each neuron reponds to.  See [[1]](#1) for a more details.

Table of Contents
=================
* [Setup](#setup)
     * [Conda environment](#conda-environment)
     	* [Inspect and edit the PATH environment variable](#env-var)
     * [Docker image](#docker-image)
* [Usage](#usage)
   * [Notebooks](#notebooks)
   * [Model parameters](#model-parameters)
* [References](#references)


# Setup
The package was implemented on macOS (Monterey version 12.5.1), and tested on Linux (RHEL version 8.4) and Windows 10. 
It requires python (>=3.6), and R (>= 3.6). 


Below we will provide two recomanded ways of setting up the package:

1. Install all software requirerments and create a dedicated [conda environment](#conda-environment)
2. Download and run a [Docker image](#docker-image).

## Conda environemnt

In order to set up a conda environment with the specified packages repeat the following steps,

1. Download  and install <a href="https://www.r-project.org/">R<a> and <a href="https://www.anaconda.com/products/distribution"> Anaconda <a>. Make sure that the path to R is in the system PATH environment variable after the installation, [add it otherwise](#env-var) . 

2. Open the terminal/command prompt and create a conda environment with
	
	```
	conda create -n pgam python=3.9
	```

3. Activate the environment and install the required python packages

	```
	conda activate pgam
	conda install jupyter
	conda install numpy pandas dill scikit-learn matplotlib -y
	conda install seaborn pyyaml h5py numba -y
	pip install rpy2 opt_einsum statsmodels
	```

4. Install the R package *survey*. The recommended option is to install the package directly through rpy2 with the following steps:
	<ol type="a"; start="a">
  		<li>Run python, import r utils and install the package <em>survey</em>
  		</li>
  	</ol> 
  	
  	```
	python
  	from rpy2.robjects.packages import importr
  	utils = importr('utils')
  	utils.chooseCRANmirror(ind=1) # any CRAN mirror id
  	utils.install_packages('survey')
  	exit()
	```


Test the installation by *cd* to the *PGAM/GAM_library* directory and run,

```
	python
	from GAM_library import *
	exit()
```

### Inspect and edit the PATH environment variable

On **windows**, inspect the folder in PATH by enterinng	

	```
	echo %PATH:;=&echo.%
	```
 
 in the command prompt, the R home folder shold be listed  (usually *C:\R\R-version\\*).
 
 If not add it manually, on Windows 10:
 
 1. 	open the "Control Panel"
 
 2. 	search for "environment"
 
 3. 	Click on "Edit the system environment variables"->"Edit variables..."
 
 4. 	Scroll on "System variables" and click on "Path"
 
 5. 	Click on "Edit..." -> "New", type the path to the R home folder and click "Ok".

 6.	Close the second pop-up by clicking on "Ok"

 7. 	In the first pop-up, cllck "Apply" and then "Ok".

 8.    Restart the commad prompt.




On **mac OS X** and **Linux**, inspect PATH by enterinng in the terrminal,
 
	```
	echo $PATH | tr : '\n'
	```
	

If the R home folder is not listed, add it to the paths,

On **mac OS X**:

1. 	Open the .bash_profile file in your home directory (for example, /Users/your-user-name/.bash_profile) in a text editor.

2. 	Add <br>
	*export PATH="your-dir:$PATH"* <br>
	to the last line of the file, where your-dir is the R home directory.
	
3.	Save the .bash_profile file.
    Restart your terminal.
    
On **Linux**:

1.	Open the .bashrc file in your home directory (for example, /home/your-user-name/.bashrc) in a text editor.

2.	Add <br>
	*export PATH="your-dir:$PATH"* <br>
	 to the last line of the file, where your-dir is the R home directory.
	
3.	Save the .bashrc file.

4.	Restart your terminal

  
## Docker image


# Usage

## Demo

## Notebook



# References
<a id="1">[1]</a> 
<a href="https://proceedings.neurips.cc/paper/2020/hash/94d2a3c6dd19337f2511cdf8b4bf907e-Abstract.html">
Balzani, Edoardo , et al., 
"Efficient estimation of neural tuning during naturalistic behavior."
Advances in Neural Information Processing Systems 33 (2020): 12604-12614.<a>