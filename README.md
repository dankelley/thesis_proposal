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
(https://github.com/dankelley/thesis_proposal/issues).

**Dan Kelley, Dalhousie University Oceanography Graduate Coordinator 2009 to
2017.** 
