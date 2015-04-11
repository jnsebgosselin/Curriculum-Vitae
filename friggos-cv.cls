\ProvidesClass{friggos-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%===============================================
% COLORS 
%===============================================

\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{66CC00} %{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{FF00FF}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%===============================================
% FONTS 
%===============================================

%-----------------------------------------------
% ROBOTO
%-----------------------------------------------

%http://graphicdesign.stackexchange.com/questions/15462/

\RequirePackage[quiet]{fontspec}

\newfontfamily\bodyfont[Path = fonts/]{Roboto-Regular}
\newfontfamily\thinfont[Path = fonts/]{Roboto-Thin}
\newfontfamily\headingfont[Path = fonts/]{RobotoCondensed-Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path = fonts/]{Roboto-Light}

%-----------------------------------------------
% HELVETICA
%-----------------------------------------------

%\newfontfamily\bodyfont[]{HelveticaNeueLTStd-Lt}
%\newfontfamily\thinfont[]{HelveticaNeueLTStd-UltLt}
%\newfontfamily\headingfont[]{HelveticaNeueLTStd-BdCn}

%\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor]{HelveticaNeueLTStd-Lt}

%-----------------------------------------------
% MATH
%-----------------------------------------------

%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\setmathfont{XITS Math}

%-----------------------------------------------
% FONT AWESOME
%-----------------------------------------------

% http://tex.stackexchange.com/questions/121891/
% https://gist.github.com/sway/3101743
% https://coderwall.com/p/r67dyq/using-font-awesome-with-xe-latex
%http://tex.stackexchange.com/questions/134121/fontawesome-icons-are-getting-too-big-using-xelatex/134244#134244

\usepackage{fontawesome}
\newfontfamily\FA[Path = fonts/]{fontawesome-webfont}

\def\github{\color{gray}{\FA \faGithubSign}}
\def\facebook{\color{gray}{\FA \faFacebookSign}}
\def\linkedin{\color{gray}{\FA \faLinkedinSign}}
\def\phonea{\color{gray}{\FA \faPhone}}
\def\phoneb{\color{gray}{\FA \faPhoneSign}}
\def\phonec{\color{gray}{\FA \faMobile}}
\def\home{\color{gray}{\FA \faHome}}
\def\mail{\color{gray}{\FA \faEnvelopeAlt}}
\def\globe{\color{gray}{\FA \faGlobe}}

\def\circleFull{\small\color{gray}{\FA \faCircleFull}\hspace{0.15cm}}
\def\circleEmpty{\small\color{gray}{\FA \faCircleEmpty}\hspace{0.15cm}}

\newcommand{\skillScale}[1]
{
\ifnum#1=1
    \circleFull\circleEmpty\circleEmpty\circleEmpty\circleEmpty
\else\ifnum#1=2
    \circleFull\circleFull\circleEmpty\circleEmpty\circleEmpty
\else\ifnum#1=3
    \circleFull\circleFull\circleFull\circleEmpty\circleEmpty
\else\ifnum#1=4
    \circleFull\circleFull\circleFull\circleFull\circleEmpty
\else\ifnum#1=5
    \circleFull\circleFull\circleFull\circleFull\circleFull
\else 
    \circleEmpty\circleEmpty\circleEmpty\circleEmpty\circleEmpty
\fi\fi\fi\fi\fi
}

%===============================================
% HEADER 
%===============================================

\RequirePackage{tikz}

\newcommand{\rolefont}{\fontsize{14pt}{24pt} %
            \selectfont\thinfont\color{white}}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

%===============================================
% STRUCTURE 
%===============================================

\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%===============================================
% LIST ENVIRONMENT 
%===============================================

%\usepackage{tabularx}
%\usepackage{array}
%\usepackage{ltablex}
\setlength{\tabcolsep}{0pt}
%\usepackage{environ}
%\NewEnviron{entrylist}
%  {\begin{tabularx}{\textwidth}{@{\extracolsep{\fill}}ll}}
%    \BODY
%  {\end{tabularx}}
\newenvironment{entrylist}
  {\begin{tabular*}{\textwidth}{@{}p{2cm}l}
  }
  {\end{tabular*}}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.85cm}{%
     \textbf{#2}\hfill{%
     \footnotesize\addfontfeature{Color=lightgray}#3}\\
     \footnotesize#4\vspace{\parsep}%
  }\vspace{5pt}\\}
  
\newcommand{\entryMod}[5]{%
  #1&\parbox[t]{11.85cm}{%
     \large\textbf{#2}\hfill{%
     \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
     \small\emph{#4}\vspace{5pt}\\
     \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
  }\vspace{5pt}\\}
  
\newcommand{\entryBul}[5]
  {#1&\parbox[t]{11.85cm}{
        \large\textbf{#2}\hfill{%
        \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
        \small\emph{#4}\vspace{1pt}
        \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
        }\vspace{5pt}\\}
  
\newcommand{\entryAlt}[3]{%
  #1&\parbox[t]{11.85cm}{%
    \large\textbf{#2}\hfill%
    {\footnotesize\addfontfeature{Color=lightgray}#3}
  }\vspace{5pt}\\} 
  
\newcommand{\entryFULL}[5]
  {#1&\parbox[t]{16.5cm}{
        \large\textbf{#2}\hfill{%
        \footnotesize\addfontfeature{Color=lightgray}#3}\vspace{1pt}\\
        \small\emph{#4}\vspace{1pt}
        \footnotesize\addfontfeature{Color=gray}#5\vspace{\parsep}%
        }\vspace{5pt}\\}

%===============================================
% SIDE BLOCK 
%===============================================

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
    \let\oldsection\section
    \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
    \begin{textblock}{4.5}(15.85, 4.33)
        \begin{flushleft}
        \obeycr
}{%
        \restorecr
        \end{flushleft}
    \end{textblock}
  \let\section\oldsection
}

\newenvironment{aside2}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.5}(15.85, 1.4)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

%===============================================
% OTHER TWEAKS 
%===============================================

\RequirePackage[left=1.25cm,top=2cm,right=6.5cm,bottom=1.25cm,nohead,nofoot]{geometry}
\definecolor{lblue}{HTML}{0000EE}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=true,       
    linkcolor=lblue,          
    citecolor=lblue,        
    filecolor=lblue,      
    urlcolor = lblue}
    
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother