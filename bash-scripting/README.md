# LICENSING

These are the scripts for [the talk](https://ipm-oam.github.io/presentations/2023/06_14_Pedram_Ashofteh_Ardakani/) given at IPM Observational Astronomy Meeting on June 14th, 2023. Mostly they are based on the [SMACK talks](https://gitlab.com/makhlaghi/smack-talks-iac) given at IAC.

Original Author:

> Pedram Ashofteh-Ardakani <pedramardakani@pm.me>

Copyright (C) 2023 Free Software Foundation, Inc.

The content and the scripts in this work are free work: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This file is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this file. If not, see <http://www.gnu.org/licenses/>.

# Introduction

## The Why
There are several reasons why one might choose to use bash scripting instead of executing commands directly in the command line.
Firstly, scripting allows for automation and repeatability. By writing a script, you can automate a series of tasks and ensure that they are performed consistently each time the script is run.
Additionally, scripting enables you to more easily share and collaborate on complex commands or workflows with others.

## The How
Gnuastro has a good [astronomy-oriented tutorial on bash scripting](https://www.gnu.org/software/gnuastro/manual/html_node/Writing-scripts-to-automate-the-steps.html) in its manual.
In terms of best practices for bash scripting, there are several other resources available.
My personal suggestion is the [exercism platform](https://exercism.org/tracks/bash) which provides various online challenges while giving access to human mentors and code-reviewers completely free. This [Red Hat article](https://www.redhat.com/sysadmin/learn-bash-scripting) also provides some useful tips for writing effective bash scripts, including keeping your scripts simple and modular, testing your scripts thoroughly before using them in production environments, and using tools like shellcheck to identify potential syntax errors or other issues in your scripts.

## The origins
Overall, while there are certainly benefits to executing commands directly in the command line, bash scripting can be a powerful tool for automating complex tasks and ensuring consistency in your workflows.
With resources like those mentioned above, you can learn to write effective scripts that follow best practices and improve your productivity as a developer.
This session is based on [SMACK4](https://gitlab.com/makhlaghi/smack-talks-iac/-/blob/master/smack-4-scripting.md) which uses Gnuastro [already presented in the IPM OAM](https://ipm-oam.github.io/presentations/2023/05_24_Elham_Saremi/) for the simple job of selecting a bright and red galaxy from the [ABYSS HUDF WFC3/IR](http://research.iac.es/proyecto/abyss) project.

# The Scenario

We are following almost the [same steps](https://gitlab.com/makhlaghi/smack-talks-iac/-/blob/master/smack-4-scripting.md#working-scenario) covered in SMACK4.

But you can follow the scenario we went through in the meeting from [here](IPM-OAM.org)