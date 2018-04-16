---
title: using the thesis_proposal latex package
author: Dan Kelley and Christoph Renkl, Dalhousie University
---

# LaTeX style file for thesis proposals


This directory contains a latex style that was designed to help students
prepare MSc and PhD proposals for the Department of Oceanography at Dalhousie
University. The department has no requirements on the formatting of these
documents, so there's no need to use the style provided here. The point is just
to save students a bit of time that might otherwise be spent learning how to
format a bibliography or deciding whether to include committee members in the
document.

Latex is quirky, so your first step should be to try to run the sample file
named *myproposal.tex* on your machine. If you're on a unix machine, simply
typing *make* in a terminal should create a file *myproposal.pdf*. If you're on
another type of machine, or if you have a different workflow, just adjust
things accordingly.

The thing most likely to give a problem is the inclusion of figures. If you use
pdflatex, you'll probably want to use *pdf* figures.  Different versions of
latex handle the inclusion of graphics files differently. Some systems are
clever enough to use a variety of graphics files, without changing the tex
file; all of this is beyond the present scope however.  The present example
uses *pdflatex* and so the *includegraphics* line refers to a PDF file. To help
you in your experimentation, this directory contains a figure in two formats,
*figure1p.pdf* and *figure1e.eps*.

After you have, ahem, figured out figures, you'll find it easy to do the rest.
Just edit *myproposal.tex* and start filling in information where suggested,
e.g. changing the string *(insert author name here)* to your name.

Some options are available, and these are indicated in the sample file.

Please note that this is an early version of the file, and so there are lots of
possibilities for improvement. Please report problems and suggestions using the
issues tab of the github website
(https://github.com/dankelley/thesis_proposal/issues).  Those with good github
skills may wish to contribute improvements either by contacting the author by
email or by issuing a pull request on the github website
(https://github.com/dankelley/thesis_proposal/pulls).

**Dan Kelley, Dalhousie University Oceanography Graduate Coordinator 2009 to
2017.** 

## Configuration

### University logo
It is possible to put a university logo on the front page; with
```latex
\documentclass{thesis_proposal}
```
as the first line of a `.tex` file, then no logo will appear. However, the
Dalhousie University logo (included in this repository) will appear on the
first page if the file uses
```latex
\documentclass[logo=logo-eagle]{thesis_proposal}
```

## Installation

If you want to use the `thesis_proposal` package like any regular LaTeX package without
copying the provided style sheets into the directory of your document, you may
install the package in a root path of your TeX distribution. The procedure
depends on the operating system, and so some steps listed below are divided
into Linux and MacOS (formerly OSX) variants; a procedure on Windows may be
added if a user explains it to the developers.

### Step 1: set up directories

Open a terminal and type
```
kpsewhich -var-value=TEXMFHOME
```

to find the root path of your TeX distribution. On linux and unix-like systems,
this is typically `/home/<username>/texmf`, where `<username>` is the name of
your user account on your computer. On MacOS (or the previous OSX) this will be
`/Users/<username>/Library/texmf`.  It is possible that this directory (and
necessary subdirectories) does not exist. In this case use the terminal and
create the requisite subdirectories, with
```
mkdir -p ~/texmf/tex/latex
mkdir -p ~/texmf/bibtex/bst
```
on Linux or
```
mkdir -p ~/Library/texmf/tex/latex
mkdir -p ~/Library/texmf/bibtex/bst
```
on MacOS.


### Step 2: clone the Dalhousie thesis repository

At this stage, you are set up for doing work with Latex, and you will not need
to repeat these steps for any later updates to the Dalhousie thesis style sheet.

The next step is to clone the `thesis_proposal` repository. In the terminal, type
```
cd ~/texmf/tex/latex
git clone https://github.com/dankelley/thesis_proposal.git thesis_proposal
```
on Linux, or 
```
cd ~/Library/texmf/tex/latex
git clone https://github.com/dankelley/thesis_proposal.git thesis_proposal
```
on MacOS.

Finally, set up the bibliography style sheet, with
```
cd ~/texmf/bibtex/bst
ln -s ../../tex/latex/thesis_proposal/thesis_proposal.bst .
```
on Linux or
```
cd ~/Library/texmf/bibtex/bst
ln -s ../../tex/latex/thesis_proposal/thesis_proposal.bst .
```
on MacOS.


### Step 3. testing the setup

You can test if your TeX distribution is able to find the class file and style
sheets by typing in the terminal:
```
kpsewhich thesis_proposal.cls
kpsewhich thesis_proposal.bst
```
and verifying that both commands report the full path to the respective files,
as you've set them up.

## Updating the installation

If `thesis_proposal` gets updated, you may update your installation by doing
```
cd ~/texmf/tex/latex/thesis_proposal
```
on Linux or
```
cd ~/Library/texmf/tex/latex/thesis_proposal
```
on MacOS, and then typing
```
git pull
```
