\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Packages/beamerLACSC}[2013/11/06 Beamer for LACSC Presentations]

%% Beamer options
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{a5paper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{b5paper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{legalpaper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{executivepaper}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{beamer}}

\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{beamer}}

\DeclareOption{dvips}{\PassOptionsToClass{\CurrentOption}{beamer}}
\DeclareOption{t}{\PassOptionsToClass{\CurrentOption}{beamer}}

\newif\if@final
\@finaltrue
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{beamer}\@finalfalse}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{beamer}\@finaltrue}



\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{beamer}}

%% Custom package options
%\newcommand\myLanguages{frenchb}
%\def\myLanguage{frenchb}
%\DeclareOption{french}{\def\myLanguage{frenchb}}

\newif\if@maxime
\@maximefalse
\DeclareOption{maxime}{\@maximetrue}
\DeclareOption{nomaxime}{\@maximefalse}

\newif\if@glossaries
\@glossariesfalse
\DeclareOption{glossaries}{\@glossariestrue}
\DeclareOption{noglossaries}{\@glossariesfalse}

\newif\if@biblatex
\@biblatexfalse
\DeclareOption{biblatex}{\@biblatextrue}
\DeclareOption{nobiblatex}{\@biblatexfalse}

\newif\if@debug
\@debugtrue
\DeclareOption{debug}{\@debugtrue}
\DeclareOption{nodebug}{\@debugfalse}

\newif\if@serif
\@seriftrue
\DeclareOption{avecserif}{\@seriftrue}
\DeclareOption{sansserif}{\@seriffalse}

%% Fallback
\DeclareOption*{
	\ClassWarning{beamerLACSC}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{a4paper,10pt,final,nomaxime,noglossaries,debug,avecserif,nobiblatex}

%% Process given options
\ProcessOptions\relax


\PassOptionsToClass{xcolor=table}{beamer}

%% Load base
\LoadClass{beamer}

\RequirePackage[frenchb]{babel}
%% Load additional packages and commands.
%\RequirePackage{mathptmx} % rm & math
%\RequirePackage[scaled=0.90]{helvet} % ss
%\RequirePackage{courier} % tt
%\normalfont
%\RequirePackage[T1]{fontenc}

\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
%\RequirePackage[sfmath]{kpfonts}
\rmfamily % manquant ?
\DeclareFontShape{T1}{lmr}{bx}{sc}{<-> ssub * cmr/bx/sc}{}
\DeclareFontShape{T1}{lmr}{b}{sc}{<-> ssub * cmr/b/sc}{}


\RequirePackage{multirow} %% Use multirow in tables
\RequirePackage{ifpdf} %% To test if we compile with PDFLatex (ifpdf) or with LaTeX (else)
\RequirePackage{xifthen} %% provides \isempty test

\newcommand{\parend}{\vspace{\baselineskip}} %% End a paragraph with a larger space without creating badbox
%\newcommand{\textquote}[1]{``#1''} %% Quote a text : \textquote{mytext}

\RequirePackage{csquotes} %% Quote a text : \textquote{mytext}
\newcommand{\textquoteMy}[1]{``#1''} %% Quote a text : \textquoteMy{mytext} in maximes ??!

%% Additional TeX/LaTeX code...

\if@final
	\RequirePackage{aecompl} %% Better PDF/font rendering
	\pdfminorversion=5
	\pdfcompresslevel=9
	\pdfobjcompresslevel=3
\else
	\pdfminorversion=5
	\pdfcompresslevel=0
	\pdfobjcompresslevel=0
\fi

\if@debug
	\newcommand{\debug}[1]{{\colorbox{yellow!50}{\Large \color{red}DEBUG #1}}} %% Show debug command
	%Show badness for vbox and hbox starting from value :
	\hbadness=1000
	\vbadness=1000
\else
	\newcommand{\debug}[1]{} %% Hide debug command
	%Show badness for vbox and hbox starting from value :
	\hbadness=7000
	\vbadness=7000
\fi

\if@serif
	\usefonttheme{serif}
\else
	
\fi

%%% Math Definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{xfrac}
%\RequirePackage{stmaryrd} %% Use \rrbracket et \llbracket to have [| and|]
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%% Algorithmes
%\usepackage[french,ruled,longend,linesnumbered,titlenumbered]{algorithm2e}


%%% Hyperref et Images %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Load Hyperref before xcolor
%% Load images and Hyperref in function of compiler : PDFLatex (ifpdf) or LaTeX (else)

\RequirePackage{makeidx}
\ifpdf
%	\RequirePackage[table,usenames,dvipsnames]{xcolor} %% To have more colors and colors in cells in tables
	\RequirePackage{graphicx}
	\DeclareGraphicsExtensions{.jpg,.png}
%	\RequirePackage[hyperindex=true]{hyperref}
	\RequirePackage{epstopdf}
	\RequirePackage{pdfpages}
	\RequirePackage{microtype} % Try to delete h/vbox Underfull/Overfull  
\else
%	\RequirePackage[table,usenames,dvipsnames,dvipdfmx]{xcolor} %% To have more colors and colors in cells in tables
	\RequirePackage[dvipdfmx]{graphicx}
	\DeclareGraphicsExtensions{.ps,.eps}
%	\RequirePackage[dvipdfmx,hyperindex=true]{hyperref} 
	%\RequirePackage[dvips,hyperindex=true]{hyperref}
\fi


\graphicspath{ {./Images/} }

\hypersetup{
	bookmarksopen=true,
	pdfmenubar=true, %menubar shown
	pdfhighlight=/O, %effect of clicking on a link
	%colorlinks=true, %couleurs sur les liens hypertextes
	pdfpagemode=UseOutlines, %aucun mode de page UseNone, FullScreen, UseOutlines ...
	pdfpagelayout=SinglePage, %ouverture en simple page - SinglePage, TwoPageLeft, TwoPageRight
	%pdfcreator = Test,
	pdffitwindow=true, %pages ouvertes entierement dans toute la fenetre
}

\RequirePackage{epsfig}
\RequirePackage{wrapfig}
\RequirePackage{subfig}
%\renewcommand{\l@subfigure}{\@dottedxxxline{\ext@subfigure}{2}{3.8em}{3.2em}}
\renewcommand{\l@subfigure}{\l@subsection}
\renewcommand{\p@subfigure}{}
\renewcommand{\thesubfigure}{\thefigure.\arabic{subfigure}}
\captionsetup[subfigure]{labelformat=empty,labelsep=colon,listofformat=subsimple,font=scriptsize,labelfont=scriptsize}
\captionsetup{
	justification=centering,
	%position=above,
	%skip=\onelineskip,
	%width=\linewidth,
	%labelfont={small},
	font={scriptsize}, 
	labelfont={scriptsize},
	labelformat=empty,
}
%\captionsetup{lofdepth=2}


%%% Glossaries / Maximes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\if@maxime
	\RequirePackage{Packages/myMaximes}
\fi
\if@glossaries
	\RequirePackage{Packages/myGlossaries}
	\makeglossaries
	\robustify{\gls}% Make \gls not fragile, to use it into captions or sections
	\robustify{\glsentryfirst}
	\robustify{\glsentryfirstplural}
	\robustify{\glsentrydesc}
	\robustify{\glsentrytext}
	\newcommand\glsdisplayentry[1]{#1}
	\pdfstringdefDisableCommands{\let\glsentryfirst\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentryfirstplural\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentrytext\glsdisplayentry}
	\pdfstringdefDisableCommands{\let\glsentrydesc\glsdisplayentry}
\fi

%%% Listing/Code  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
\RequirePackage{listings}
\definecolor{gris}{rgb}{0.95,0.95,0.95}
\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{darkblue}{rgb}{0.0,0.0,0.6}
\definecolor{cyan}{rgb}{0.0,0.6,0.6}

\lstset{
	language=XML,
	numbers=left,
	tabsize=4,
	backgroundcolor=\color{gris},
	frame=single,
	breaklines=true,
	stringstyle=\ttfamily,
	framexleftmargin=6mm,
	xleftmargin=6mm,
	keywordstyle=\color{black}\bfseries,
	commentstyle=\color{red}\textit,
	stringstyle=\color{Orange}\ttfamily
}

\lstdefinelanguage{XML}{
	morestring=[b],
	morestring=[s]{>}{<},
	morecomment=[s]{<?}{?>},
	stringstyle=\color{black},
	identifierstyle=\color{darkblue},
	keywordstyle=\color{cyan},
	morekeywords={xmlns,version}% list your attributes here
}

\lstset{
	tabsize=2,
	backgroundcolor=\color{gris},
	frame=single,
	breaklines=true,
	columns=fullflexible,
	showstringspaces=false,
	numbers=none,
	framexleftmargin=1mm,
	xleftmargin=1mm
}

%%% Big Center  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Use \begin{bigcenter} \end{bigcenter} ou \bigcentering to center on the full page (without text margin)

\newskip\@bigflushglue \@bigflushglue = -100pt plus 1fil
\def\bigcenter{\trivlist \bigcentering\item\relax}
\def\bigcentering{\let\\\@centercr\rightskip\@bigflushglue%
\leftskip\@bigflushglue
\parindent\z@\parfillskip\z@skip}
\def\endbigcenter{\endtrivlist}




%%% Bibliography  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 
\if@biblatex
	\RequirePackage[backref=true,backend=bibtex8,backrefstyle=none,style=alphabetic,labelalpha=true,block=space,maxbibnames=5,maxcitenames=2,abbreviate=false,sorting=nty]{biblatex} 
	\RequirePackage{xstring}
	
	\setbeamertemplate{bibliography item}[text] %% Display biblatex key
	
	\def\getfirstparameter#1,#2\relax{#1}
	\newcommand{\etal}[2][]{%
	\ifx&#1&%
		\IfSubStr{#2}{,}{%
			\Citeauthor{\getfirstparameter#2\relax} \cite{#2}%
		}{%
			\Citeauthor{#2} \cite{#2}%
		}%
	\else%
 		#1 \cite{#2}%
	\fi%
	}
	% style=authoryear to verify author names (merged) or style=alphabetic for Alpha style
	\defbibheading{bibliographySection}[\bibname]{%
		\section*{#1}%
		\markboth{#1}{#1}
	}
	
	\setlength{\bibitemsep}{\baselineskip}
	\DefineBibliographyStrings{french}{%
		backrefpage = {Cit{\'e} en page },
		backrefpages= {Cit{\'e} en pages },
	}
	
	\renewbibmacro*{pageref}{%
		\addperiod% NEW
		\iflistundef{pageref}
		{}
		{
			\newline \hspace*{\fill} \printtext[parens]{% NEW
				\ifnumgreater{\value{pageref}}{1}
					{\bibstring{backrefpages}\ppspace}
					{\bibstring{backrefpage}\ppspace}%
				\printlist[pageref][-\value{listtotal}]{pageref}%\addperiod
			}
		}
	}
	\patchcmd{\bibsetup}{\interlinepenalty=5000}{\interlinepenalty=10000}{}{}
	
	\RequirePackage{xpatch}% or use http://tex.stackexchange.com/a/40705
	
	\def\makenamesetup{%
		\def\bibnamedelima{~}%
		\def\bibnamedelimb{ }%
		\def\bibnamedelimc{ }%
		\def\bibnamedelimd{ }%
		\def\bibnamedelimi{ }%
		\def\bibinitperiod{.}%
		\def\bibinitdelim{~}%
		\def\bibinithyphendelim{.-}}    
	\newcommand*{\makename}[3]{\begingroup\makenamesetup\xdef#1{#2, #3}\endgroup}
	
	\newbibmacro*{name:bold}[2]{%
		\makename{\currname}{#1}{#2}%
		\makename{\findname}{\lastname}{\firstname}%
		\makename{\findinit}{\lastname}{\firstinit}%
		\ifboolexpr{ test {\ifdefequal{\currname}{\findname}} or test {\ifdefequal{\currname}{\findinit}} }{\bfseries}{}}
	
	\newcommand*{\underlinename}[3]{%
		\def\lastname{#1}%
		\def\firstname{#2}%
		\def\firstinit{#3}}
	\underlinename{}{}{}
	
	\xpretobibmacro{name:last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:first-last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:last-first}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
	\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}
	
	\xapptobibmacro{name:last}{\endgroup}{}{}
	\xapptobibmacro{name:first-last}{\endgroup}{}{}
	\xapptobibmacro{name:last-first}{\endgroup}{}{}
	\xapptobibmacro{name:delim}{\endgroup}{}{}
	
	% Force \fullcite to use the maxbibnames value instead maxcitenames
	\DeclareCiteCommand{\fullcite}
		{\defcounter{maxnames}{\blx@maxbibnames}%
		\usebibmacro{prenote}}
		{\usedriver
			{\DeclareNameAlias{sortname}{default}}
			{\thefield{entrytype}}}
		{\multicitedelim}
		{\usebibmacro{postnote}}
		
	% Author with small capitals
	\renewcommand{\mkbibnamefirst}[1]{\textsc{#1}}
	\renewcommand{\mkbibnamelast}[1]{\textsc{#1}}
	\renewcommand{\mkbibnameprefix}[1]{\textsc{#1}}
	\renewcommand{\mkbibnameaffix}[1]{\textsc{#1}}
\fi

%%% Backup Slides : no number and no count in total slides %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 
\newcommand{\beginbackupslides}{
   \newcounter{framenumbervorappendix}
   \setcounter{framenumbervorappendix}{\value{framenumber}}
}
\newcommand{\stopbackupslides}{
   \addtocounter{framenumbervorappendix}{-\value{framenumber}}
   \addtocounter{framenumber}{\value{framenumbervorappendix}} 
}




\usepackage{Packages/beamerthemeLACSC} 

%\usetheme{Packages/LACSC}

\endinput
