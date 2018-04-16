%% This file 'thesis_proposal.cls', was written by Dan Kelley and
%% is covered by the GPL open-source license.

\def\tpversion{0.12}
\def\fileversion{v0.12}
\def\filedate{2010/02/02}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_proposal}[\filedate\space\fileversion]
\immediate\write16{Class file for students writing thesis proposals 
  in the Department of Oceanography at Dalhousie University}
\def\filename{thesis_proposal.dtx}

% Indicate style name at end of document
\def\revtex@pageid{\xdef\@thefnmark{\null}
  \@footnotetext{This document was prepared with the thesis\_proposal \LaTeX\/ macros, version \tpversion, available from Dan Kelley.}}
\let\ltx@enddoc=\enddocument
\def\enddocument{\vfill\revtex@pageid\ltx@enddoc}


\RequirePackage{setspace,fancyhdr,ifthen,graphicx}

%\RequirePackage{ifthen,times,xspace,hyperref,titlesec,titletoc,graphicx,fancyhdr}

\newcommand{\dal@ptsize}{12pt}
\newif\if@mainmatter        \@mainmattertrue
\newif\if@title@page        \@title@pagetrue
\newif\if@signature@page    \@signature@pagetrue
\newif\if@permission@page   \@permission@pagetrue
\newif\if@contents@page     \@contents@pagetrue
%\newif\if@tables@page       \@tables@pagetrue
%\newif\if@figures@page      \@figures@pagetrue
%\newif\if@dedication@page   \@dedication@pagetrue
%\newif\if@dedication        \@dedicationfalse
\newif\if@third@reader      \@third@readerfalse
\newif\if@fourth@reader     \@fourth@readerfalse
\newif\if@fifth@reader      \@fifth@readerfalse
\newif\if@phd               \@phdfalse
\newif\if@draft@mode        \@draft@modefalse
\newif\if@print@bib         \@print@bibtrue
\newif\if@first@bibitem     \@first@bibitemtrue
\DeclareOption{10pt}{\renewcommand{\dal@ptsize}{10pt}}
\DeclareOption{11pt}{\renewcommand{\dal@ptsize}{11pt}}
\DeclareOption{12pt}{} % \dal@ptsize already set to 12pt
\DeclareOption{draft}{\AtEndOfClass{\draft}
  \PassOptionsToClass{draft}{report}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[\dal@ptsize]{report}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\setlength{\topmargin}{-0.25in}
\setlength{\headsep}{0.25in}
\setlength{\textwidth}{7in}
\setlength{\textheight}{9in}
\setlength{\marginparwidth}{40pt}
\setlength{\marginparsep}{10pt}
\newcommand{\properpagestyle}{%
  \pagestyle{myheadings}
  \markboth{}{}
  \markright{}
}
\brokenpenalty=10000
\linespread{1.37}\normalsize
\renewenvironment{figure}{\linespread{1}\@float{figure}}{\end@float}
\renewenvironment{figure*}{\linespread{1}\@dblfloat{figure}}{\end@dblfloat}
\renewenvironment{table}{\linespread{1}\@float{table}}{\end@float}
\renewenvironment{table*}{\linespread{1}\@dblfloat{table}}{\end@dblfloat}
\long\def\@footnotetext#1{\insert\footins{%
    \linespread{1} % Set single-spacing
    \reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark
    }%
    \color@begingroup
    \@makefntext{%
      \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
    \color@endgroup}%
}
\long\def\@mpfootnotetext#1{%
  \global\setbox\@mpfootins\vbox{%
    \unvbox\@mpfootins
    \linespread{1} % Set single-spacing
    \reset@font\footnotesize
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel
        {\csname p@mpfootnote\endcsname\@thefnmark}%
        \color@begingroup
        \@makefntext{%
          \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
        \color@endgroup}%
}
\let\orig@thebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \if@print@bib
  \newpage
  \addcontentsline{toc}{chapter}{\bibname} %%%DEK%%% no effect
  \linespread{1}\normalsize
  \orig@thebibliography{#1}
  \else
  \newbox\dal@bib@box
  \newbox\dal@bibitem@box
  \let\b@group={
    \let\e@group=}
  \def\endthebibliography{\egroup\e@group}
  \let\orig@bibitem\bibitem
  \def\bibitem{%
    \if@first@bibitem
    \@first@bibitemfalse
    \else
    \egroup
    \fi
    \setbox\dal@bibitem@box=\vbox\bgroup
    \orig@bibitem}
  \setbox\dal@bib@box=\vbox\b@group
  \orig@thebibliography{#1}
  \fi
}

\def\previousdegree#1{\gdef\@previousdegree{#1}}
\def\submitmip#1{\gdef\@submitmip{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\defenddate#1{\gdef\@defenddate{#1}}
\def\acceptdate#1{\gdef\@acceptdate{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\def\supervisorycommittee#1{\gdef\@supervisorycommittee{#1}}
\def\defensecommittee#1{\gdef\@defensecommittee{#1}}
\def\defensechair#1{\gdef\@defensechair{#1}}

\def\degree#1{\gdef\@degree{#1}}
\def\degreeinitial#1{\gdef\@degreeinitial{#1}}
\def\msc{\degree{Master of Science}\degreeinitial{MSc}}
\def\phd{\degree{Doctor of Philosophy}\degreeinitial{PhD}\@phdtrue}

\def\@title{}
\def\@author{}
\def\@previousdegree{}
\def\@supervisor{}
\def\@cosupervisor{}
\def\@submitdate{}
\def\@submitmip{}
\def\@defenddate{}
\def\@acceptdate{}
\def\@supervisorycommittee{}
\def\@defensechair{}
\def\@defensecommittee{}

\renewcommand\maketitle{\par
  \begingroup
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \@maketitle
  \thispagestyle{empty}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@author\@empty
  \global\let\@previousdegree\@empty
  \global\let\@submitdate\@empty
  \global\let\@submitmip\@empty
  \global\let\@defenddate\@empty
  \global\let\@acceptdate\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\previousdegree\relax
  \global\let\submitdate\relax
  \global\let\submitmip\relax
  \global\let\defenddate\relax
  \global\let\acceptdate\relax
  \global\let\and\relax
}

\gdef\@author{\mbox{}}
\def\author{\@ifnextchar[{\@authortwo}{\@authorone}}
\def\@authortwo[#1]#2{\gdef\@author{#2}\gdef\@shortauthor{#1}}
\def\@authorone#1{\gdef\@author{#1}\begingroup\gdef\@shortauthor{#1}\endgroup}
\def\shortauthor#1{\gdef\@shortauthor{#1}}
\gdef\@shortauthor{}
  
\gdef\@title{\mbox{}}
\def\title{\@dblarg\@titletwo}
\def\@titletwo[#1]#2{\gdef\@title{#2}\gdef\@shorttitle{#1}}
\def\shorttitle#1{\gdef\@shorttitle{#1}}
\gdef\@shorttitle{}

% As RoySoc
\def\@maketitle{%
  \begin{center}
    {\scshape \Large \expandafter{\@degreeinitial} Proposal\par}
    \vskip 10pt plus 5pt minus 10pt
    \bfseries\large\@title\par
    \vskip 10pt plus 5pt minus 10pt
    \normalfont\scshape\normalsize \@author\footnote{\@previousdegree}\par
    \vskip 5pt plus 5pt minus 5pt%
    \typeout{\@defenddate}
    \ifthenelse{\equal{\@defenddate}{}}%
               {\itshape Submitted \@submitdate\/ (month \@submitmip\/ in program); accepted \@acceptdate}%
               {\itshape Submitted \@submitdate\/ (month \@submitmip\/ in program); defended \@defenddate; accepted \@acceptdate}
  \end{center}
}

\newcommand{\no@breaks}[1]{%
  {\def\\{ \ignorespaces}#1}%
}

% dal logo, partial fulfillment block

% Abstract similar to Royal Society style
\newsavebox{\keywords}
\renewenvironment{abstract}[1]{%
  \sbox{\keywords}{
    \begin{minipage}{\textwidth}
      {\vskip 10pt plus 5pt minus 10pt}
      \begin{center}
	\noindent{\footnotesize {\bf Keywords:} #1}
      \end{center}
    \end{minipage}
  }
  \par\linespread{1}
  \normalsize\noindent\ignorespaces {\bfseries Abstract:}
}%
{
  \par\noindent\usebox{\keywords}\par\noindent
  \vskip 10pt plus 5pt minus 10pt%
  \ifthenelse{\equal{\@cosupervisor}{}}%
             {\par\noindent{\bfseries Supervisor:} \@supervisor}
             {\par\noindent{\bfseries Supervisors:} \@supervisor\/ and \@cosupervisor}
   \vskip 5pt plus 5pt minus 5pt%
   \par\noindent{\bfseries Supervisory committee:} \@supervisorycommittee
   \ifthenelse{\equal{\@defensecommittee}{}}%
	      {}%
	      {
                \vskip 5pt plus 5pt minus 5pt
                \par\noindent{\bfseries Defense committee:}
                \@defensecommittee
                \vskip 5pt plus 5pt minus 5pt
                \par\noindent{\bfseries Defense chair:}
                \@defensechair
              }
    % In fulfillment block
    \begin{center}
      \vskip 2pt plus 5pt minus 2pt
      \includegraphics[scale=0.3]{logo-eagle}\par
      \vskip 2pt plus 5pt minus 2pt
      Submitted in partial fulfillment of the requirements
      for the degree of \@degree,\par Department of Oceanography,
      Dalhousie University.
    \end{center}
}
   
\newcommand{\symname}{List of Symbols}

\newenvironment{listofsymbols}%
    {\newcount\ab@page
    \ab@page=-\arabic{page}
    \prefacesection{\symname}}
   {\vfil
    \advance \ab@page by \arabic{page}}
\let\listofsymbols\listofsymbols
\let\endlistofsymbols\endlistofsymbols

\newcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
}

\newcommand\mainmatter{%
  \newpage
  \tableofcontents
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  % Goossens p99
  \pagestyle{fancy}
  \lhead[\fancyplain{}{\bfseries\@shortauthor}]%
	{\fancyplain{}{\bfseries\@shortauthor}}
        \rhead[\fancyplain{}{\thepage}]%
	      {\fancyplain{}{\thepage}}
              \chead{\@shorttitle}
              \cfoot{}
}

\newcommand\backmatter{%
  \if@openright
  \cleardoublepage
  \else
  \clearpage
  \fi
  \@mainmatterfalse
}

% See Goosens et al., p26 for info on controlling section appearance
\setcounter{secnumdepth}{3}
\def\thesection{\@arabic{\c@section}}
\def\thesubsection{\thesection.\hspace{0.1em}\@arabic{\c@subsection}}

\renewcommand\chapter{\@startsection {chapter}{0}{\z@}%
  {-5ex \@plus 1ex \@minus 2ex}%
  {2ex  \@plus 1ex \@minus 1ex}%
  {\normalfont\Large\bfseries}}
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-4.0ex \@plus -.5ex \@minus -.5ex}%
  {1.6ex \@plus.2ex}%
  {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {3.25ex\@plus 1ex \@minus .2ex}%
  {1.4ex \@plus .2ex}%
  {\normalfont\large\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {2.0ex \@plus 1.0ex \@minus 0.5ex}%
  {0.5ex \@plus 0.5ex \@minus 0.5ex}%
  {\raggedright\normalfont\normalsize\itshape}}

% Appendix
\renewcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{table}{0}
  \setcounter{figure}{0}
  \setcounter{equation}{0}
  \gdef\thetable{\Alph{table}}
  \gdef\thefigure{\Alph{figure}}
  \gdef\theequation{\Alph{section}-\arabic{equation}}
  \section*{Appendix}
  \gdef\thesection{\Alph{section}}
  \setcounter{section}{0}
  \renewcommand{\theHsection}{A\arabic{section}}}

% END (sectioning)

% TOC formatting
% These can be modified to change the look of the 
% table of contents.
% REFS: http://www.ripe.net/pam2001/IEEEtran2e.html
%       http://www.tex.ac.uk/cgi-bin/texfaq2html?label=tocloft
%       Http://epu.ucc.ie/articles/practex06?chunk=articleclass
\renewcommand\tableofcontents{%
  \chapter*{\contentsname%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \@starttoc{toc}%
}
\renewcommand{\bibname}{Literature Cited}
\renewcommand{\@pnumwidth}{0.5em} % space before page number
\renewcommand{\@tocrmarg}{1em} % right margin (but has no effect)
\renewcommand{\@dotsep}{1}   % space between dots (not sure of the unit)
\renewcommand{\contentsname}{Table of Contents}
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
  \addpenalty\@secpenalty
  \addvspace{1em \@plus\p@}%
  \setlength\@tempdima{1.5em}%
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode \normalfont\large\bfseries
  \advance\leftskip\@tempdima
  \hskip -\leftskip
  #1\nobreak\normalfont\normalsize\dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
  \endgroup
  \fi}
\renewcommand*\l@subsection[2]{%
  \ifnum \c@tocdepth >\z@
  \addpenalty\@secpenalty
  \addvspace{0em \@plus\p@}%
  \setlength\@tempdima{2.0em}%
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode \normalfont\large\itshape
  \advance\leftskip\@tempdima
  \hskip 0em
  #1\nobreak\normalfont\normalsize\dotfill \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
  \endgroup
  \fi}
\renewcommand*\l@subsubsection[2]{%
  \ifnum \c@tocdepth >\z@
  \addpenalty\@secpenalty
  \addvspace{0em \@plus\p@}%
  \setlength\@tempdima{2.3em}%
  \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  \leavevmode \normalfont\normalsize\itshape
  \advance\leftskip\@tempdima
  \hskip 2em
  #1 \nobreak\normalfont\normalsize\dotfill\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
  \endgroup
  \fi}
% end TOC formatting

\setcounter{tocdepth}{4}
  
  \setcounter{table}{0} % BUG: I'm not sure why this is needed [DK 2007-01-23]
  
  % \def\nolistoftables{\@tables@pagefalse}
%\def\nolistoffigures{\@figures@pagefalse}
\def\nofront{%
   \@signature@pagefalse
   \@permission@pagefalse
   \@dedication@pagefalse
   \@contents@pagefalse
   \@tables@pagefalse
   \@figures@pagefalse
   }
\def\nobib{\@print@bibfalse}
\msc % CHECK: what does this do?  Maybe make MSc by default??
%\properpagestyle


%%%
%%% Optional packages, uncommon ones commented out
\usepackage{hyperref} 	% provides hyperlink when using pdflatex
\usepackage{amsmath}	% provides extra mathematics symbols

%%% 
%%% Highly recommended packages
\usepackage{times} 		% Better fonts, on paper and in PDF
\usepackage{longtable}	% Useful for complex tables
\usepackage{varioref} % lets you say \vref{} instead of \ref{}, yielding page numbers
%\usepackage[myheadings]{fullpage}

%%%
%%% Required packages, without which thesis_proposal will not work
%\usepackage{thesis_proposal_bib} % file provided with this package
\usepackage{setspace} % for single-spacing of abstract
\usepackage{graphicx}

\endinput
%% End of file 'thesis_proposal.cls'.
