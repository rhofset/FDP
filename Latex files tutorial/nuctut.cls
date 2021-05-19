%%
%  Simple tutorial class for unse at Noroff University College
%  v1 Barry Irwin <barry.irwin@noroff.no> April 2020
%  v1.1 Emlyn Butterfield - August 2020 
%  v1.2 Barry Irwin <barry.irwin@noroff.no> October 2020
%%
%% CHANGELOG
%% v1 - Inital revision
%% v1.1 - Integration into a usable form
%% v1.2 - Cleanup of layouts and addition of some more box types and examples. Fixed colour support

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{nuctut}
              [2020/10/30 NUC tutorial class]
              
\newcommand{\headlinecolor}{\normalcolor}

%\LoadClass[twocolumn]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,11pt]{article}


%%now required packages
\RequirePackage{geometry}  % sets page geometry
%define basic page layout
\geometry{left=25mm,right=25mm,bindingoffset=0mm, top=20mm,bottom=25mm}
\RequirePackage[dvipsnames]{xcolor} % see pic in Images
\RequirePackage{listings}  % gives us a listings environment
\RequirePackage{graphicx}  % pictures!
\RequirePackage{awesomebox} % cool infoboxes
\RequirePackage{url}        % urls are cool
\RequirePackage[utf8]{inputenc}  % deal with funny characters non ascii
\RequirePackage{fancyhdr}
\usepackage{lastpage}
\usepackage[export]{adjustbox}

\usepackage{enumitem}
\setlength{\headheight}{30pt}
% \usepackage{helvet}
\usepackage[british]{babel}
\usepackage{amsmath}
\usepackage{csquotes}% Recommended
\usepackage[nottoc]{tocbibind}
\usepackage{hyperref}
\usepackage{wrapfig}
\usepackage{tabularx}
\usepackage{booktabs}

\usepackage{parskip} % Set to not have indented paras

\usepackage[style=authoryear-ibid,backend=biber]{biblatex}
\addbibresource{refs.bib}



%linespacing
\linespread{1}

%Defines a logo Macro for use n the main document. uses absolute placement
\def\LOGO{%
\begin{picture}(0,0)\unitlength=1cm
\put (3,-2) {\includegraphics[width=5em]{Images/Noroff-logo-H.jpg}}
\end{picture}
}

% code listing settings
%TODO look at other options
% Currently Python Only
\lstset{
    language=Python,
    basicstyle=\linespread{0.8}\ttfamily\small,
    aboveskip={0.8\baselineskip},
    belowskip={0.8\baselineskip},
    columns=fixed,
    extendedchars=true,
    breaklines=true,
    tabsize=4,
    prebreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\hookleftarrow}},
    frame=lines,
    showtabs=false,
    showspaces=false,
    showstringspaces=false,
    keywordstyle=\color[rgb]{0.627,0.126,0.941}, % purple
    commentstyle=\color[rgb]{0.133,0.545,0.133}, % Green
    stringstyle=\color[rgb]{01,0,0},             % black
    numbers=left,
    numberstyle=\small,
    stepnumber=1,
    numbersep=10pt,
    captionpos=b, %bottom t= top
    escapeinside={\%*}{*)}
}
%%
%% setup for the hyperref package
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=cyan,
}


%% Set up pretty infoboxes for the tutorials
%https://ctan.uib.no/fonts/fontawesome5/doc/fontawesome5.pdf

%\awesomebox[vrulecolor][hrule][title]{vrulewidth}{icon}{iconcolor}{content}

\newcommand{\nukeblock}[1]{\awesomebox[lightgray]{2pt}{\faRadiation}{red}{#1}}
\newcommand{\gitblock}[2]{\awesomebox[lightgray]{2pt}{\faGithub}{black}{#1 \url{#2}}}
\newcommand{\setupblock}[1]{\awesomebox[lightgray]{2pt}{\faCogs}{darkgray}{#1}}
\newcommand{\dlblock}[2]{\awesomebox[lightgray]{2pt}{\faCloudDownload*}{darkgray}{#1 \url{#2}}}
\newcommand{\dlblocknar}[1]{\awesomebox[lightgray]{2pt}{\faCloudDownload*}{darkgray}{#1 }}
\newcommand{\quesblock}[1]{\awesomebox[lightgray]{2pt}{\faQuestion}{blue}{#1}}
\newcommand{\gdriveDLblock}[2]{\awesomebox[lightgray]{2pt}{\faGoogleDrive}{red}{#1 \url{#2}}}
\newcommand{\readblock}[1]{\awesomebox[lightgray]{2pt}{\faReadme}{darkgray}{#1}}
\newcommand{\blogblock}[1]{\awesomebox[lightgray]{2pt}{\faBlog}{darkgray}{#1}}
\newcommand{\helpblock}[1]{\awesomebox[lightgray]{2pt}{\faLightbulb}{yellow}{#1}}
\newcommand{\warnblock}[1]{\awesomebox{2pt}{\faExclamationTriangle}{orange}{#1}}
\newcommand{\bombblock}[1]{\awesomebox[white][\abLongLine][\textbf{Watch out}]{0pt}{\faBomb}{black}{#1}}
\newcommand{\checkblock}[1]{\awesomebox[lightgray]{2pt}{\faCheckCircle}{ForestGreen}{#1}}
% OS specific commands
% Microsoft Windows
\newcommand{\Winblock}[1]{\awesomebox[lightgray]{3px}{\faMicrosoft}{darkgray}{#1}}
% Apple MacOS
\newcommand{\Macblock}[1]{\awesomebox[lightgray]{3px}{\faApple}{darkgray}{#1}}
% Linux Derivatives
\newcommand{\Linblock}[1]{\awesomebox[lightgray]{3px}{\faLinux}{darkgray}{#1}}
\newcommand{\Ubuntublock}[1]{\awesomebox[lightgray]{3px}{\faUbuntu}{darkgray}{#1}}

%% ----- other commands
\newcommand{\cmd}[1]{\texttt{#1}}  % sets a console command in typewriterfont eg \cmd{ls}
\newcommand{\pline}{\par\noindent\rule{\textwidth}{0.4pt}}
\newcommand{\Rtext}[1]{\color[HTML]{F03F24}{#1}\color[HTML]{000000}}
\newcommand{\Btext}[1]{\color[HTML]{3F24FA}{#1}\color[HTML]{000000}}
\newcommand{\Gtext}[1]{\color[HTML]{03FA02}{#1}\color[HTML]{000000}}
\newcommand{\Ytext}[1]{\color[HTML]{F0FA24}{#1}\color[HTML]{000000}}
\newcommand{\Grtext}[1]{\color{lightgray}{#1}\color[HTML]{000000}}
\newcommand{\Wtext}[1]{\color[HTML]{FFFFFF}{#1}\color[HTML]{000000}} % hide white text
%%  Footers

%%--------------------END