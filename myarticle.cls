\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myarticle}

% Declare options
\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\def\@@numcolumn{onecolumn}
\DeclareOption{onecolumn}{\def\@@numcolumn{onecolumn}}
\DeclareOption{twocolumn}{\def\@@numcolumn{twocolumn}}
\def\@@twocolumn{twocolumn}

\ProcessOptions\relax

% Load parent class and packages
\LoadClass[letterpaper,french,\@@ptsize,\@@numcolumn]{article}
\RequirePackage{fullpage}
\RequirePackage[french]{babel}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{empheq}
\RequirePackage[math-style=french]{unicode-math}
\RequirePackage{newunicodechar}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{bracket}

% Reduce header size if in two column mode
\AtBeginDocument{%
\ifx\@@numcolumn\@@twocolumn
\usepackage[small,compact]{titlesec}
\titlespacing*{\section}{0pt}{0ex}{-2ex}
\setlength{\belowdisplayskip}{0pt}
\setlength{\belowdisplayshortskip}{0pt}
\setlength{\abovedisplayskip}{0pt}
\setlength{\abovedisplayshortskip}{0pt}
\fi
}

% Set fonts
\setmainfont{FreeSerif}
\setsansfont{FreeSans}
\setmonofont{FreeMono}
% Fonts supported by unicode-math:
% Latin Modern Math
% TeX Gyre Bonum Math
% TeX Gyre Pagella Math
% TeX Gyre Schola Math
% TeX Gyre Termes Math
% TeX Gyre DejaVu Math
% Asana-Math fonts
% STIX Math
% XITS Math
% Libertinus Math
% Fira Math
\setmathfont{STIX Math}

% Safe way to declare new commands
\AtBeginDocument{%
  \providecommand*{\mycmd}[2]{}
  \renewcommand*{\mycmd}[2]{%
    \providecommand*{#1}{#2}
    \renewcommand*{#1}{#2}
  }
}
% Declare colors
\definecolor{light-blue}{HTML}{55CDFC}
\colorlet{medium-blue}{light-blue!130!}
\colorlet{pastel-blue}{light-blue!30!}
\definecolor{light-pink}{HTML}{F7A8B8}
\colorlet{pastel-pink}{light-pink!30!}
\definecolor{dark-green}{HTML}{5A7463}
\definecolor{dark-red}{HTML}{AA381E}
\definecolor{light-yellow}{HTML}{FDEB6C}

% Declare colored boxes
\DeclareRobustCommand{\bluebox}[1]{\colorbox{pastel-blue}{#1}}
\DeclareRobustCommand{\pinkbox}[1]{\colorbox{pastel-pink}{#1}}
\DeclareRobustCommand{\greenbox}[1]{\colorbox{dark-green}{\color{white}#1}}
\DeclareRobustCommand{\redbox}[1]{\colorbox{dark-red}{\color{white}#1}}
\DeclareRobustCommand{\yellowbox}[1]{\colorbox{light-yellow}{#1}}

% Declare colored boxed to use in equations
\DeclareRobustCommand{\blueboxed}[1]{\bluebox{$\displaystyle #1$}}
\DeclareRobustCommand{\pinkboxed}[1]{\pinkbox{$\displaystyle #1$}}
\DeclareRobustCommand{\greenboxed}[1]{\greenbox{$\displaystyle #1$}}
\DeclareRobustCommand{\redboxed}[1]{\redbox{$\displaystyle #1$}}
\DeclareRobustCommand{\yellowboxed}[1]{\yellowbox{$\displaystyle #1$}}

% Variables to set for the title page
\newcommand*{\mytitle}[1]{\newcommand*\@mytitle{#1}}
\newcommand*{\mysupervisor}[1]{\newcommand*\@mysupervisor{#1}}
\newcommand*{\mycourse}[1]{\newcommand*\@mycourse{#1}}
\newcommand*{\mycoursesigil}[1]{\newcommand*\@mycoursesigil{#1}}
\newcommand*{\myname}[1]{\newcommand*\@myname{#1}}
\newcommand*{\mystudentid}[1]{\newcommand*\@mystudentid{#1}}
\newcommand*{\myprogram}[1]{\newcommand*\@myprogram{#1}}
\newcommand*{\myschool}[1]{\newcommand*\@myschool{#1}}
\newcommand*{\mydate}[1]{\newcommand*\@mydate{#1}}

% Title page
\newcommand*{\mymaketitle}{%
  \begin{titlepage}
    \begin{center}
      \vspace*{\fill}
      \Huge
      \textbf{
        \@mytitle
      }
    \vspace{2cm}

    \Large
    Présenté à\\
    \vspace{0.10cm}
    \@mysupervisor
    \vspace{1cm}

    \LARGE
    \@mycoursesigil\\
    \vspace{0.10cm}

    \large
    \@mycourse
    \vspace{1cm}

    \Large
    Par\\
    \vspace{0.10cm}

    \@myname\\
    \vspace{0.10cm}

    \large
    \@mystudentid\\
    \vspace{0.10cm}

    \@myprogram
    \vspace{2cm}

    \Large
    \@myschool\\
    \vspace{0.10cm}

    \@mydate
    \vspace{\fill}
  \end{center}
\end{titlepage}
}

% Set paragraph indent and spacing and disable justification.
\setlength{\parindent}{0cm}
\setlength{\parskip}{\baselineskip}
\RequirePackage[document]{ragged2e}

% Set equation numbers to match sections.
\numberwithin{equation}{section}
\numberwithin{figure}{section}

% Define QED symbol
\renewcommand{\qedsymbol}{$■$}

% Define some environments
\newtheorem{theorem}{Théorème}[section]
\newtheorem{lemma}[theorem]{Lemme}
\newtheorem{corollary}[theorem]{Corollaire}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Définition}
\theoremstyle{definition}
\newtheorem{proposition}[theorem]{Proposition}
\theoremstyle{remark}
\newtheorem{example}{Exemple}[theorem]
\theoremstyle{remark}
\newtheorem*{remark}{Remarque}
\theoremstyle{remark}
\newtheorem*{notation}{Notation}

% Some useful math commands.
% DEPRECATED; use \set{} and \Set{} from bracket package instead
% commands\DeclarePairedDelimiter{\set}{\{}{\}}

% commands to generate overline notation more easily
\newcommand*{\ovl}[1]{\overline{#1}}
\newcommand*{\cls}[1]{\overline{#1}}
\newcommand*{\cmp}[1]{\overline{#1}}

% Other useful commands
% Linear Algebra
\let\Im\relax
\DeclareMathOperator*{\Im}{Im}
\let\dim\relax
\DeclareMathOperator*{\dim}{dim}
\let\Ker\relax
\DeclareMathOperator*{\Ker}{Ker}
\let\Card\relax
\DeclareMathOperator*{\Card}{Card}
% Geometry
\DeclareMathOperator*{\cis}{cis}
% Complex numbers
\let\R\relax
\DeclareMathOperator*{\R}{\mathfrak{Re}}
\let\I\relax
\DeclareMathOperator*{\I}{\mathfrak{Im}}
% Functions
\let\id\relax
\DeclareMathOperator*{\id}{id}

% New math symbols
\newunicodechar{√}{\sqrt}
\newunicodechar{⟌}{\overline{)}}
\newunicodechar{｜}{\mid}

% Some extra text formatting commands
\newcommand*{\conclusion}[1]{\pinkbox{\textbf{Conclusion~: }#1}}
