%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-*-TeX-*-%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% IDENTIFICATION & PACKAGE LOADING
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mcs}

\newif\ifhandout
\handouttrue

\newif\ifproblemonly
\problemonlyfalse

\newif\ifshowsolutions
\showsolutionsfalse

\let\@class@option@file\@empty

\DeclareOption{book}{%
    \handoutfalse
}

\DeclareOption{handout}{%
    \handouttrue
    \PassOptionsToClass{10pt}{book}
    \def\@class@option@file{handout.opt}%
}

\DeclareOption{problem}{%
    \problemonlytrue
    \def\@class@option@file{problem.opt}%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{11pt,twoside,book}

\ProcessOptions\relax

\LoadClass{book}[2005/09/16]

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{xspace}
\RequirePackage{graphics}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage[pdflatex]{graphicx}
\RequirePackage{subfigure}
\RequirePackage{palatino}
\RequirePackage{textcomp}
\RequirePackage[
    colorlinks, bookmarksopen, bookmarksnumbered,
    pdfpagemode=UseOutlines,
    linkcolor=blue, citecolor=blue,
    urlcolor=blue, backref, pagebackref]{hyperref}

% I don't think we actually use this. [dmj]

% \RequirePackage{xmpincl}

\newcommand{\linput}{\input}

\newcommand{\pinput}[1]{%
    \IfFileExists{#1}{%
        \input{#1}%
    }{%
        \ClassWarning{mcs}{Can't find problem `#1'}%
    }%
}

%% Normally LaTeX will complain if it encounters another
%% \documentclass command after the \begin{document}, but that
%% interferes with the special processing of problems.  The following
%% code removes \documentclass from the list of commands that can only
%% appear in the preamble.

\begingroup

\def\do#1{%
    \ifx\documentclass#1\else\@onlypreamble#1\fi
}

\let\@tempa\@preamblecmds

\global\let\@preamblecmds\@empty

\@tempa

\endgroup

\renewcommand{\documentclass}[2][]{}

\newcommand{\scorestats}[3]{\textbf{Scores: --Mean #1, --Median #2, --St.dev #3}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% TEXT & MATHEMATICS
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%From Eric Lehman, Fall 04

\newcommand{\mfigure}[3]{\bigskip\centerline{\resizebox{#1}{#2}{\includegraphics{#3}}}\bigskip}

%%%from light.sty

%\newcommand{\term}[1]{\textbf{\textit{#1}}}
\newcommand{\term}[1]{\emph{#1}}
\newcommand{\true}{\textcolor{green}{\ensuremath{\mathbf{T}}}}
\newcommand{\false}{\textcolor{red}{\ensuremath{\mathbf{F}}}}

\newcommand{\edge}[2]{#1\text{---}#2}
\newcommand{\diredge}[2]{#1 \to #2}


%  text highlighting

\newcommand{\floatingtextbox}[1]{
  \begin{figure}[htbp]
  \textbox{#1}
  \end{figure}}

\newcommand{\textbox}[1]{
  \begin{center}\fbox{\begin{minipage}[t]{\textwidth}
  \setlength{\parindent}{3ex}
  \setlength{\parskip}{\medskipamount}
  \vspace{0.5ex} #1 \vspace{0.5ex}
  \end{minipage}}\end{center}}

\newcommand{\textboxtitle}[1]{
  \begin{center}
  {\textbf{\Large #1}}
  \end{center}}
 
%%% Ugly box of red text that we can't ignore for too long :) 
\newcommand{\TBA}[1]{\fbox{\textcolor{red}{\bf TBA - #1}}}


%%% Parameters/Variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\strutheight}

%%% Text --- Abbreviations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\apriori}{\textit{a~priori}\xspace~}
\newcommand{\aposter}{\textit{a~posteriori}\xspace~}
\newcommand{\etal}{\textit{et~al}.\@\xspace}
\newcommand{\ie}{\textit{i.e.}\xspace,\xspace}
\newcommand{\eg}{\textit{e.g.}\xspace,\xspace}
%\newcommand{\etc}{\textit{etc}.\@\xspace}
\newcommand{\etc}{etc.\@\xspace}
\newcommand{\cf}{\textit{cf.}\xspace,\xspace}
\newcommand{\viz}{\textit{viz.}\xspace,\xspace}

%%% Text --- Constructs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\hint}{\emph{Hint: }}
\newcommand{\brule}[1]{\underline{\hspace{#1}}}
%\newenvironment{optional}[1]{\small [Optional] #1}{}
\newenvironment{optional}[1]{\footnotesize [Optional] #1}{}
%\newenvironment{optional}{\begin{quotation}\small [Optional]}{\end{quotation}}

%%% Math --- General %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\ang}[1]{\left\langle#1\right\rangle}
\newcommand{\brac}[1]{\left[#1\right]}
\newcommand{\mean}[1]{[\![#1]\!]}
\newcommand{\subst}[3]{#1[#2 := #3]}
\newcommand{\patch}[3]{#1[#2 \leftarrow #3]}

\newcommand{\suchthat}{\mid}
\newcommand{\eqdef}{\mathbin{::=}}
\renewcommand{\bar}[1]{\overline{#1}}

\newcommand{\mop}[1]{\mathop{#1}}
\newcommand{\mbin}[1]{\mathbin{#1}}
\newcommand{\mrel}[1]{\mathrel{#1}}
\newcommand{\mopt}[1]{\mathop{\mathrm{#1}}}
\newcommand{\mbint}[1]{\mathbin{\mathrm{#1}}}
\newcommand{\mrelt}[1]{\mathrel{\mathrm{#1}}}
\newcommand{\mtt}[1]{\mathtt{#1}}

%%% Math --- Logic %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\And}{\wedge}
\newcommand{\conj}{\And}
\newcommand{\smand}{\And}
\newcommand{\AND}{\bigwedge}
\newcommand{\Land}{\AND}
\newcommand{\lgand}{\AND}

\newcommand{\Or}{\vee}
\newcommand{\disj}{\Or}
\newcommand{\smor}{\Or}
\newcommand{\OR}{\bigvee}
\newcommand{\Lor}{\OR} 
\newcommand{\lgor}{\OR}
\newcommand{\xor}{\oplus}

\renewcommand{\implies}{\longrightarrow}
\renewcommand{\iff}{\longleftrightarrow}
\newcommand{\bicond}{\longleftrightarrow}
\newcommand{\equivalent}{\Longleftrightarrow}
\newcommand{\qiff}{\quad \text{iff} \quad}
\newcommand{\qimplies}{\quad \text{implies} \quad}

\newcommand{\QOR}{\mbint{\textsc{or}}}
\newcommand{\QXOR}{\mbint{\textsc{xor}}}
\newcommand{\QAND}{\mbint{\textsc{and}}}
\newcommand{\QIMPLIES}{\mbint{\textsc{\,implies\,}}}
\newcommand{\QIMP}{\QIMPLIES}
\newcommand{\QIFF}{\mbint{\textsc{iff}}}
\newcommand{\QNOT}{\mopt{\textsc{not}}}

\newcommand{\nand}{\mathbin{\mid}}
%\newcommand{\nand}{\mid}

\newcommand{\Rule}[2] 
{\[
\begin{array}{c}
#1 \\
\hline
#2
\end{array}
\]
}

\newcommand{\LabelRule}[3]
{\[
\begin{array}{cr}
#1 \\
\hline & \text{#3}\\
#2
\end{array}
\]
}



\newcommand{\ruleref}[1]{Rule \ref{#1}}


%%% Math --- Set theory %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\card}[1]{\left|#1\right|}
\newcommand{\lnth}[1]{\left|#1\right|}
\newcommand{\ident}[1]{\text{Id}_{#1}}

\newcommand{\union}{\cup}
\newcommand{\lgunion}{\bigcup}
\newcommand{\intersect}{\cap}
\newcommand{\lgintersect}{\bigcap}
\newcommand{\cross}{\times}
\newcommand{\compose}{\circ}
\newcommand{\composition}{\circ} 
\newcommand{\power}{\mathcal{P}}
\newcommand{\restrict}{\upharpoonright}

\newcommand{\range}[1]{\mathop{\textup{range}}\nolimits\left(#1\right)}
\newcommand{\domain}[1]{\mathop{\textup{domain}}\nolimits\left(#1\right)}
\newcommand{\codomain}[1]{\mathop{\textup{codomain}}\nolimits\left(#1\right)}
\newcommand{\graph}[1]{\mathop{\textup{graph}}\nolimits\left(#1\right)}

\newcommand{\degr}[1]{\text{deg}(#1)}


%%% Math --- Languages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\emptystring}{\lambda}

%%% Math --- Famous sets %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\naturals}{\mathbb{N}}
\newcommand{\integers}{\mathbb{Z}}
\newcommand{\rationals}{\mathbb{Q}}
\newcommand{\reals}{\mathbb{R}}
\newcommand{\complexes}{\mathbb{C}}

%%% Math --- Arithmetic %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}
%\newcommand{\divides}{\mathbin{|}}
\newcommand{\divides}{\mid}

\newcommand{\rem}[2]{\operatorname{rem}(#1,#2)}
\newcommand{\remainder}{\mopt{remainder}}
\newcommand{\quotient}{\mopt{quotient}}
\newcommand{\lcm}{\mopt{lcm}}



%%%%%%%%%%%%%%%%%%%% Misc. - taken from ln and cp to avoid multiply def'd ref's
\newcommand{\corresp}{\ \longleftrightarrow\ }

\newcommand{\prq}{\rightarrow}  %prerequisite

%\newcommand{\prns}{\set{\, \mtt{)},\, \mtt{(}\,}^*}

\def\sg{\text{Sg}}

\def\GC{\mopt{GoodCount}}
\def\RM{\mopt{RecMatch}}
\def\ES{\mopt{Erasable}}

\newcommand{\prns}{\text{prns}}

\newcommand{\aexp}{\text{Aexp}}

\newcommand{\meval}{\mopt{eval}}
\newcommand{\msubst}[2]{\mopt{subst}(#1,#2)}  %#2[x \leftarrow #1]}

\newcommand{\prodsym}{\ast}
\newcommand{\minussym}{\mopt{--}}
\newcommand{\sumsym}{\mbint{+}}

\newcommand{\btg}{\text{binary-2PTG}}
\newcommand{\tg}{\text{2PTG}}
\newcommand{\ms}[1]{\mathop{\text{#1}}}

\providecommand{\sg}{\ms{sg}}
\providecommand{\ide}{\ms{id}}
\providecommand{\EF}{\ms{F18}}
\providecommand{\T}{\ms{ST}}

\def\lexle{\mathrel{\preceq_{\text{lex}}}}
\newcommand{\lexls}{\mathrel{\prec_{\text{lex}}}}
\newcommand{\lexgr}{\mathrel{\succ_{\text{lex}}}}
\def\lex<{\mathrel{\prec_{\text{lex}}}}
\def\coordle{\mathrel{\preceq_{\text{c}}}}
\def\coord<{\mathrel{\prec_{\text{c}}}}

\newcommand{\inv}[1]{#1^{-1}}

\iffalse
\newcommand{\ms}[1]{\text{#1}}
\newcommand{\tg}{\text{2PTG}}
\newcommand{\bins}{\set{0,1}*}
\newcommand{\fstlist}{\text{list-first}}
\newcommand{\rstlist}{\text{list-rest}}
\newcommand{\nillist}{\text{()}}
\newcommand{\nillistq}{\text{list-nil?}}
\newcommand{\List}{\text{List}}
\newcommand{\mklist}{\text{makelist}}

\newcommand{\mktree}{\text{maketree}}
\newcommand{\subtrees}{\text{subtrees}}
\newcommand{\mkleaf}{\text{makeleaf}}
\newcommand{\leafv}{\text{leaf-value}}
\newcommand{\leafq}{\text{leaf?}}
\fi


%%% Math --- Probability %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\sspace}{\mathcal{S}}

\newcommand{\pr}[1]{\mathop{\textup{Pr}}\nolimits\left\{#1\right\}}
\newcommand{\prob}[1]{\pr{#1}}
\newcommand{\prsub}[2]{\mathop{\textup{Pr}_{#2}}\nolimits\left\{#1\right\}}
\newcommand{\prcond}[2]{%
  \ifinner \settoheight{\strutheight}{$#1 #2$}
  \else    \settoheight{\strutheight}{$\displaystyle#1 #2$} \fi%
  \mathop{\textup{Pr}}\nolimits\left\{
    #1\,\left|\protect\rule{0cm}{\strutheight}\right.\,#2
  \right\}}

\newcommand{\Ex}{\mathop{\textup{E}}\nolimits}
\newcommand{\Var}{\mathop{\textup{Var}}\nolimits}
\newcommand{\Cov}{\mathop{\textup{Cov}}\nolimits}
\newcommand{\expect}[1]{\Ex\left[#1\right]}
\newcommand{\expectsq}[1]{{\Ex}^2\left[#1\right]}
\newcommand{\expcond}[2]{\expect{#1\mid#2}}
\newcommand{\variance}[1]{\Var\left[#1\right]}
\newcommand{\varsq}[1]{{\Var}^2\left[#1\right]}
\newcommand{\covar}[1]{\Cov\left[#1\right]}
\newcommand{\covariance}[2]{\Cov\left[#1,#2\right]}
\newcommand{\pdf}{\textsc{PDF}}
\newcommand{\cdf}{\textsc{CDF}}

%%% Math --- Theorems & Proofs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{falsethm}[theorem]{False Theorem}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{falseclm}[theorem]{False Claim}
\newtheorem{rul}[theorem]{Rule}


\newtheorem{mathrule}{Rule}
\newtheorem*{mathrule*}{Rule}


\newtheorem*{theorem*}{Theorem}
\newtheorem*{falsethm*}{False Theorem}
\newtheorem*{lemma*}{Lemma}
\newtheorem*{proposition*}{Proposition}
\newtheorem*{corollary*}{Corollary}
\newtheorem*{claim*}{Claim}
\newtheorem*{falseclm*}{False Claim}
\newtheorem*{rul*}{Rule}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{axiom}[theorem]{Axiom}

\newtheorem*{definition*}{Definition}
\newtheorem*{fact*}{Fact}
\newtheorem*{axiom*}{Axiom}

\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{example}[theorem]{Example}
\newtheorem{xample}[theorem]{Example}

\newtheorem*{remark*}{Remark}
\newtheorem*{example*}{Example}
\newtheorem*{xample*}{Example}

\newenvironment{falseproof}
{\begin{proof}[False proof]}
{\end{proof}}

\newenvironment{bogusproof}
{\begin{proof}[Bogus proof]}
{\end{proof}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% FORMATTING
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Course handouts vs. book only
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\inhandout}[1]{%
  \ifhandout#1\fi}
\newcommand{\inbook}[1]{%
  \ifhandout\else#1\fi}
\newcommand{\inmcsprob}[1]{%
 \ifproblemonly#1\fi}

%%%%%%%%%%%%
%% pcomments is an itemized list environment that shows up only when 
%%  the standalone version of the problem is compiled. 
%%
\newenvironment{pcomments}
  {{\bf COMMENTS:}\inmcsprob{\begin{itemize}}}
  {\inmcsprob{\end{itemize}}}
\newcommand{\pcomment}[1]{\inmcsprob{\item#1}}

%%%%%%%%%%%%
%% pkeywords attaches a string of whitespace-delimited (including newline) 
%%  keywords to problems and prints out the list when the standalone version 
%%  of the problem is compiled.
%%
%% Usage: \pkeywords{keyword_1 keyword_2 keyword_3}
%%
\newcommand{\pkeywords}[1]{\inmcsprob{\it {\bf keywords} = [#1]}}

\newcounter{documentdepth}

\newcommand{\ifstandalone}{\ifnum\value{documentdepth}=0}

%% executes #2 only when the documentdepth counter is equal to #1
\newcommand{\atDocDepth}[2]{\ifthenelse{\value{documentdepth}=#1}{#2}{}}

%% \examspace produces vertical space only in handouts without solutions. 
%%   If no argument is passed then it starts a new page, otherwise inserts
%%   \vspace{arg}.  e.g. \examspace{1in}
\newcommand{\examspace}[1][\newpage]{\inhandout{\instatements{
 \ifthenelse{\equal{#1}{\newpage}}
            {\newpage}
            {\vspace{#1}}}}}

%% \examrule creates a \brule only in handouts without solutions.  If
%%   no argument is passed then the default \hspace is 0.5in
\newcommand{\examrule}[1][0.5in]{\inhandout{\instatements{\brule{#1}}}}

%% \exambox{W}{H}{D} creates a \fbox having width W, height H 
%%   and at distance D from the bottom of the current line (only in 
%%   handouts without solutions). 
\newcommand{\exambox}[3]{\inhandout{\instatements{
  \fbox{\rule{#1}{0in}\rule[#3]{0in}{#2}}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Page formatting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0.125in}                     
\setlength{\parskip}{0in}            
\hoffset        = -1.0 in
\voffset        = -1.25 in
\paperheight    =  9.0 in
\paperwidth     =  7.0 in
\topmargin      = 0.375 in
\headheight     = 3\baselineskip
\headsep        = 2\baselineskip
\footskip       = 0.3 in
\textheight     = \paperheight
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\textwidth      = \paperwidth
\oddsidemargin  = 1.0 in
\evensidemargin = 1.0 in
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\linewidth      = \textwidth

\newcommand{\printlayout}{%
  \typeout{----------------------- LaTeX Page Layout Parameters}
  \typeout{\string\paperwidth\space\space\the\paperwidth}
  \typeout{\string\paperheight\space\the\paperheight}
  \typeout{\string\textwidth\space\space\the\textwidth}
  \typeout{\string\textheight\space\the\textheight}
  \typeout{\string\oddsidemargin\space\space\the\oddsidemargin}
  \typeout{\string\evensidemargin\space\the\evensidemargin}
  \typeout{\string\topmargin\space\space\the\topmargin}
  \typeout{\string\headheight\space\the\headheight}
  \typeout{\string\headsep\space\the\headsep}
  \typeout{\string\footskip\space\space\space\the\footskip}
  \typeout{\string\marginparwidth\space\the\marginparwidth}
  \typeout{\string\marginparsep\space\space\space\the\marginparsep}
  \typeout{\string\hoffset\space\the\hoffset}
  \typeout{\string\voffset\space\the\voffset}
  \typeout{(1in=72.27pt, 1cm=28.45pt)}
  \typeout{-----------------------------------------}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mini pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Generates a _framed_ minipage with its width as an optional argument.
% If the width is not specified, \linewidth is used. 
%
% Usage  :  \begin{fminibox}{width} ... \end{fminibox}
% Example:  \begin{fminibox}{3in}  blah, blah... \end{fminibox}
%
\newsavebox{\fminibox}
\newlength{\fminilength}
\newenvironment{fminipage}[1][\linewidth]%
{% begin fminipage
  \setlength{\fminilength}{#1}
  \addtolength{\fminilength}{-2\fboxsep}
  \addtolength{\fminilength}{-2\fboxrule}
  \begin{lrbox}{\fminibox}\begin{minipage}{\fminilength}}%
{% end fminipage
  \end{minipage}\end{lrbox}\noindent\fbox{\usebox{\fminibox}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Formatting the top/bottom matter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Formats the title, given the paper supertitle, paper title, and
% release date. (Typically, the only papers that have a supertitle are
% lectures notes: the _supertitle_ is something like ``Lecture Notes
% 7'', while the _title_ is the actual title of the notes, like
% ``Induction''. All other documents have no supertitle at all.)
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \formattitle[revision info]{supertitle}{title}{date out}
% Example: \formattitle[v1.1]{}{Tutorial 13}{Fri, Nov 13} 
%
%       The commands \courseinstitute, \coursetitle, \coursenumber,
% \courseprofessors are used, meant to be renewed by the user (in
% course.dat, once at the beginning of the term) to contain the
% appropriate info. The current definitions are just informative
% warnings. Here is an example of how the commands are meant to be
% renewed:  
%
% \renewcommand{\courseinstitute}{
%   \href{http://web.mit.edu/}{Massachusetts Institute of Technology}}
% \renewcommand{\coursetitle}{Mathematics for Computer Science}
% \renewcommand{\coursenumber}{
%   \href{http://theory.lcs.mit.edu/classes/6.042/spring02}
%   {6.042J/18.062J, Spring~'02}}
% \renewcommand{\courseprofessors}{
%   \href{http://theory.lcs.mit.edu/~meyer/}{Professor Albert Meyer} 
%   and
%   \href{http://www.swiss.ai.mit.edu/users/radhi/}{Dr.~Radhika Nagpal}}
%

\newcommand{\formattitle}[4][\stamp]{%
  \mbox{}\vspace*{-\headheight}\mbox{}\vspace*{-\headsep}\mbox{}\newline
  \noindent
  \parbox{\textwidth}{
    \courseinstitute             \hfill          #2 \newline%
    \coursenumber : \coursetitle \hfill          #4 \newline%
    \courseprofessors            \hfill          #1 \\[-1ex]%
    \mbox{}\hrulefill\mbox{}}
  \mbox{}                                           \newline%
  \bigskip
  \begin{center}       {\Large\textbf{#3}}  \coursecopyright      \end{center}%
%  \coursecopyright
}


\newcommand{\stamp}{%
  {\scriptsize{revised \today, \the\time\ minutes}}}

\newcommand{\Stamp}{%
  revised \today, \the\time\ minutes}

\newcommand{\courseinstitute}{%
  \href{http://web.mit.edu/}{University of Somewhere}%
  \message{^^JInstitute name/link *INCORRECT*.^^J^^J}}
\newcommand{\coursetitle}{%
  \href{http://web.mit.edu/}{Advanced Something}%
  \message{^^JCourse name/link *INCORRECT*.^^J^^J}}
\newcommand{\coursenumber}{%
  \href{http://web.mit.edu/}{B747}%
  \message{^^JCourse number/link *INCORRECT*.^^J^^J}}
\newcommand{\courseprofessors}{%
  \href{http://web.mit.edu/}{Prof.~Somebody}%
  \message{^^JProfessor name/link *INCORRECT*.^^J^^J}}



\iffalse
%%THE PROBLEM%%   \coursecopyright

\newcommand{\coursecopyright}{%
  \renewcommand{\thefootnote}{}%
  \footnotetext{%
    Copyright~\copyright~\coursecopyrightyear, 
    \coursecopyrightnames. All rights reserved.}%
  \renewcommand{\thefootnote}{\arabic{footnote}}}
\fi

\long\def\symbolfootnote[#1]#2{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnote[#1]{#2}\endgroup}

\iffalse
\newcommand{\coursecopyright}{%
\symbolfootnote[0]{Copyright~\copyright~\coursecopyrightyear, 
    \coursecopyrightnames. All rights reserved.}}
\fi

\newcommand{\coursecopyright}{%
\symbolfootnote[0]{Creative Commons
\resizebox{!}{0.15in}{\includegraphics{by-nc-sa}}~\coursecopyrightyear, 
    \coursecopyrightnames.}}

\newcommand{\coursecopyrightyear}{
  0000%
  \message{^^JCopyright year is *INCORRECT*.^^J^^J}}
\newcommand{\coursecopyrightnames}{%
  Prof.~Somebody%
  \message{^^JCopyright names are *INCORRECT*.^^J^^J}}


% Formats the top matter (title+headers), given the paper supertitle,
% paper title, and release date. 
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \formatpages[revision info]{supertitle}{title}{date out}
% Example: \formatpages[v1.1]{}{Tutorial 13}{Fri, Nov 13}
%
\newcommand{\formatpages}[4][\stamp]{%
  \thispagestyle{empty}
  \markboth{\@ifnonempty{#2}{#2: }#3}{\@ifnonempty{#2}{#2: }#3}
  \pagestyle{myheadings}
  \formattitle[#1]{#2}{#3}{#4}
}

% Formats the top matter (title+headers) appropriately for an exam
% paper, given the paper title and release date.  
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \formatexampages[rev info]{title}{date out}
% Example: \formatexampages[v1.1]{Quiz 13}{Fri, Nov 13}
%
%       The command \exampreamble is used, meant to be renewed by the
% user: it contains the introductory coments for the exam. The current
% definition is an informative warning. Here is an example of how the
% command is meant to be renewed: 
%
%\renewcommand{\exampreamble}{
%  \textbf{Circle the name of your Tutorial Instructor}:
%  \begin{center}
%  \renewcommand{\arraystretch}{1.5}
%  \begin{tabular}{llll}
%  Yu-Han    & Christos & Nikos & Ashish \\
%  Thien-Loc & Jaime    & Tina  & Tong   
%  \end{tabular}
%  \end{center}
%  \begin{itemize}
%  \item 
%  This quiz is \textbf{closed book}.  There is an Appendix giving the 
%  definitions of some standard operations on relations.
%  \item 
%  There are four (4) problems totaling 100 points.  Problems are
%  labeled with their point values.
%  \item 
%  Put your name on the top of {\bf every} page -- \emph{these
%  pages may be separated for grading}.
%  \item 
%  Write your solutions in the space provided.  If you need more
%  space, write on the back of the sheet containing the problem.
%  Please keep your entire answer to a problem on that problem's page.
%  \item 
%  You may assume any of the results presented in class or in the
%  lecture notes.
%  \item  
%  \textbf{Be neat and write legibly}.  You will be graded not only on
%  the correctness of your answer, but also on the clarity with which
%  you express it.
%  \item 
%  GOOD LUCK!
%  \end{itemize}}
%
\newcommand{\formatexampages}[3][\stamp]{%
  \thispagestyle{empty}
  \markboth{\hspace{2em}Your name:\hrulefill{}\hfill#2}
           {#2\hfill{}Your name:\hrulefill\hspace{2em}}
  \pagestyle{myheadings}
  \formattitle[#1]{}{#2}{#3}
  \bigskip\bigskip\textbf{Your name:}\hrulefill\par\bigskip
    \exampreamble
  \vfill
%    \newpage  %%inserted for F07
  \hrule\smallskip  %%commented out for F07
  \centerline{\textbf{DO NOT WRITE BELOW THIS LINE}}
  \smallskip\hrule\bigskip
    \examtable
  \clearpage}

\newcommand{\exampreamble}{
  \vfill\noindent
  You have to renew $\backslash$\texttt{exampreamble} in the preamble
  of your paper to have something printed in this space! For example, 
  \begin{center}
  \texttt{%
    $\backslash$renewcommand$\{\backslash$exampreamble$\}$
      $\{\backslash$vfill GOOD LUCK FOLKS! $\backslash$vfill$\}$}
  \end{center}
  See also \texttt{course.sty} for a longer example.%
  \message{^^JExam preamble is *INCORRECT*.^^J^^J}
  \vfill}
\newcommand{\useStandardMiniquizPreamble}{
\renewcommand{\exampreamble}{   % !! renew \exampreamble
  \textbf{Circle the name of your TA/LA}:
  \begin{center}
  \renewcommand{\arraystretch}{2.5}
  \begin{tabular}{c}
     \courseassistants
  \end{tabular}
  \end{center}
  \begin{itemize}

  \item
   This quiz is \textbf{closed book}.  Total time is 30 minutes.

  \item
   Write your solutions in the space provided.  If you need more
   space, write on the back of the sheet containing the problem.
   Please keep your entire answer to a problem on that problem's page.

  \item
   GOOD LUCK!
  \end{itemize}}}
\newcommand{\examtable}{
  \vfill
  \begin{center}
  This is where the grades table is supposed to be printed. Compile
  the paper once more to get it right. See \texttt{course.sty} for
  details.
  \end{center}%
  \message{^^JGrades table was *NOT PRINTED*.^^J^^J}
  \vfill}

% Formats the cover sheet (for the student's solutions) provided at
% the end of every problem set, given the problem set number. 
%
% Usage  : \coversheet{problem set number}
% Example: \coversheet{13}
%
%       The commands \courseassistants and \collaborationnote
% are used, meant to be renewed by the user (in course.dat, once at
% the beginning of the term) to contain the appropriate info. The
% current definitions are just informative warnings. Here is an
% example of how the commands are meant to be renewed:  
%
% \renewcommand{\courseassistants}{   
%        Ashish\hspace{.7em}    Carole\hspace{.7em} 
%        Christos\hspace{.7em}  Eric\hspace{.7em}
%        George\hspace{.7em}    Jack\hspace{.7em}   
%        Nick\hspace{.7em}      Tina }
% \renewcommand{\collaborationnote}{%
%   \textbf{Collaboration statement:} 
%   Circle one of the two choices and provide all pertinent info.
%   \begin{enumerate}
%   \item[1.] I worked alone and only with course materials.
%   \item[2.] I collaborated on this assignment with:
%   \item[]   got help from:\footnote{People other than course staff.}
%   \item[]   and referred to:\footnote{Give citations to texts and
%             material other than the class texts, handouts, and last
%             term's bible.}  
%   \end{enumerate}} 
%
\newcommand{\coversheet}[1]{%
  \cleardoublepage
  \setcounter{footnote}{0}
  \formatpages[]
    {Solutions cover sheet}
    {Student's Solutions to Problem Set~#1}
    {\releasedateofpaper{ps#1}}
  \bigskip
  \begin{fminipage}
  \vspace{.35cm}
  \begin{tabular}{rl}
    \textbf{Your name:}       &                       \\[.35cm]
    \textbf{Due date:}        & \duedateofpaper{ps#1} \\[.35cm]
    \textbf{Submission date:} &                       \\[.35cm] 
    \textbf{Circle your TA/LA}:         & \courseassistants
  \end{tabular}
  \vspace{.35cm}
  \end{fminipage}
  \bigskip\par
  \collaborationnote
  \vfill
  \bigskip\hrule\smallskip
  \centerline{\textbf{DO NOT WRITE BELOW THIS LINE}}
  \smallskip\hrule\bigskip
  \begin{center}
      \newcounter{rowcounter}
      \newcommand{\tablerows}{}
      \loop
         \ifnum\value{rowcounter}<\value{problemthm}
         \g@addto@macro\tablerows{%
             \addtocounter{rowcounter}{1}
             \therowcounter&\\\hline}
         \addtocounter{rowcounter}{1}
      \repeat 
      \setcounter{rowcounter}{0}
  \renewcommand{\arraystretch}{1.2}
  \begin{tabular}{|c|c|} \hline
    Problem &  Score \\ \hline
    \tablerows
    Total   &        \\ \hline
  \end{tabular}
  \end{center}}

\newcommand{\courseassistants}{%
  Renew $\backslash$\texttt{courseassistants} to get 
  the TAs' names here!%  
  \message{^^JCourse assistants list *INCORRECT*.^^J^^J}}
\newcommand{\collaborationnote}{%
  You have to renew $\backslash$\texttt{collaborationnote} in
  \texttt{course.dat} to have a collaboration statement form printed 
  in this space!
  \message{^^JCollaboration statement form *INCORRECT*.^^J^^J}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\keywords}[1]{\@bsphack\@esphack}

%%% Tags %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\PTAGfilename}[1]{}
\newcommand{\PTAGhistory}[1]{}
\newcommand{\PTAGkeywords}[1]{}

%%% Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\standardproblemsep}
\newlength{\standardproblempartsep}
\newlength{\problemsep}
\newlength{\problempartsep}
\setlength{\standardproblemsep}{1cm}
\setlength{\standardproblempartsep}{1ex}
\setlength{\problemsep}{\standardproblemsep}
\setlength{\problempartsep}{\standardproblempartsep}

\theoremstyle{definition}
\newtheorem{problemthm}{Problem}
\newcommand{\countersunderproblem}{
  \renewcommand{\thetheorem}{\theproblemthm.\arabic{theorem}}}
\newtheorem*{problemthm*}{Problem}

%%% Simple problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{simpleproblem}
  {\vspace{\problemsep}
   \begin{problemthm}%
   \pdfbookmark[1]{Problem~\theproblemthm}{Problem\theproblemthm}%
   \setlength{\parindent}{0pt}%
   \setcounter{outerproblempart}{0}}
  {\end{problemthm}}
\newenvironment{simpleproblem*}
  {\vspace{\problemsep}
   \begin{problemthm*}%
   \setlength{\parindent}{0pt}%
   \setcounter{outerproblempart}{0}}
  {\end{problemthm*}}

%%% Exam problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% In any of the exam papers (quiz, final, practicequiz), use
% environment ``examproblem'' to define a problem along with its grade
% points; for example:
%      \begin{examproblem}{25}
%      Prove that you are a nice guy.
%      \end{examproblem}
% prints a problem that counts for 25 points. This causes the string
% ``(25 points)'' to appear next to the problem label.  
%   In addition, the points from all examproblems are collected and
% the grading table for the front page of the exam is formatted: just
% define each problem as an examproblem along with its points, then
% compile the paper twice; the second time the correct grades table
% will appear on the front page of the exam.
%
\newcounter{examtotal}
\newcommand{\examtablecontents}{}

\newenvironment{examproblem}[1]
  {% Formatting : 
   \vspace{\problemsep}
   \begin{problemthm}[\textbf{#1 point\ifthenelse{1=#1}{}{s}}]%
   \pdfbookmark[1]{Problem~\theproblemthm}{Problem\theproblemthm}%
   \setlength{\parindent}{0pt}%
   \setcounter{outerproblempart}{0}%
   % Updating .aux file :
   \examtableupdate{#1}%
   \examtotalupdate{#1}}
  {\end{problemthm}}

\newcommand{\examtableupdate}[1]{
   \immediate\unexpandedwrite\@auxout{%
     \g@addto@macro\examtablecontents{%
       \addtocounter{problemthm}{1}\theproblemthm&#1&&\\\hline}}}
\newcommand{\examtotalupdate}[1]{
   \immediate\unexpandedwrite\@auxout{%
     \addtocounter{examtotal}{#1}}}
\newcommand{\examtableupdatefinish}{%
     \unexpandedwrite\@auxout{%
        \gdef\examtable{
          \begin{center}
          \renewcommand{\arraystretch}{1.5}
          \begin{tabular}{|c|c|c|c|}           \hline
          Problem & Points & Grade  & Grader \\\hline\hline
          \examtablecontents                   \hline
          Total   & \theexamtotal & &        \\\hline
          \end{tabular}
          \end{center}
          \setcounter{problemthm}{0}}}}
\AtEndDocument{\examtableupdatefinish}

%%% Repository problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Very similar to the ``simpleproblem'' environment.  Difference is that
% the pdf bookmarks are suppressed, so that the bookmarks created by
% the \newproblem command are effective.
%
\newenvironment{repositoryproblem}
  {\vspace{\problemsep}
   \begin{problemthm}%
   \setlength{\parindent}{0pt}%
   \setcounter{outerproblempart}{0}}
  {\end{problemthm}}

%%% Notes problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Very similar to the ``simpleproblem'' environment.  Difference is that
% the pdf bookmarks are suppressed, so that they don't mess up with
% the standard section bookmarking.  Also, there is no extra space added
% before the problem.
%
\newenvironment{notesproblem}
  {\begin{problemthm}%
   \setlength{\parindent}{0pt}%
   \setcounter{outerproblempart}{0}}
  {\end{problemthm}}

%%% Problems & problem parts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{problem}[1][0]
  {\begin{simpleproblem}}
  {\end{simpleproblem}}
\newenvironment{problem*}[1][0]
  {\begin{simpleproblem*}}
  {\end{simpleproblem*}}
\newcommand{\usesimpleproblems}{
  \renewenvironment{problem}[1][0]
    {\begin{simpleproblem}}
    {\end{simpleproblem}}
  \renewcommand{\problempart}[1][0]{\item}}
\newcommand{\usescoredproblems}{
  \renewenvironment{problem}[1][0]
    {\inhandout{\begin{examproblem}{##1}}%
     \inbook{\begin{simpleproblem}}}
    {\inhandout{\end{examproblem}}%
     \inbook{\end{simpleproblem}}}
  \renewcommand{\problempart}[1][0]{\item}}
\newcommand{\useexamproblems}{
  \renewenvironment{problem}[1][0]
    {\inhandout{\begin{examproblem}{##1}}%
     \inbook{\begin{simpleproblem}}}
    {\inhandout{\end{examproblem}}%
     \inbook{\end{simpleproblem}}}
  \renewcommand{\problempart}[1][0]{%
    \inhandout{%
    \item(##1 point\ifthenelse{1=##1}{}{s})\;%
    \problempartbookmark}%
    \inbook{\item}}}
\newcommand{\userepositoryproblems}{
  \renewenvironment{problem}[1][0]
    {\begin{repositoryproblem}}
    {\end{repositoryproblem}}}
\newcommand{\usenotesproblems}{
  \renewenvironment{problem}[1][0]
    {\begin{notesproblem}}
    {\end{notesproblem}}
  \renewcommand{\problempart}[1][0]{\item}}

\newcounter{outerproblempart}
\newcounter{problempart}
\renewcommand{\theproblempart}{\alph{problempart}}
\newenvironment{problemparts}
  {\begin{list}
         {\textbf{(\alph{problempart})}}
         {\usecounter{problempart}
          \settowidth{\labelwidth}{\textbf{(m)}}
          \setlength{\labelsep}{1ex}
          \setlength{\leftmargin}{0pt}
          \setlength{\itemindent}{\labelwidth}
            \addtolength{\itemindent}{\labelsep}
          \setlength{\rightmargin}{0pt}
          \setlength{\listparindent}{0pt}
          \setlength{\itemsep}{\problempartsep}}
   \setcounter{problempart}{\value{outerproblempart}}}
  {\setcounter{outerproblempart}{\value{problempart}}
   \end{list}}
\newcommand{\problempartbookmark}{%
  \pdfbookmark[2]{(\theproblempart)}{Problem\theproblemthm\theproblempart}}
\newcommand{\problempart}[1][0]{\item\problempartbookmark}

\newcommand{\pref}[1]{(\ref{#1})}
\newcommand{\ppref}[2]{\ref{#1}(\ref{#2})}

\newcommand{\bparts}{\begin{problemparts}}
\newcommand{\eparts}{\end{problemparts}}
\newcommand{\ppart}{\problempart}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solutions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\theoremstyle{definition}
\newtheorem*{solution*}{Solution}
\newcommand{\showsolution}[1]{%
  \begin{solution*}%
  \setlength{\parindent}{0pt}%
  #1%
  \hfill$\blacksquare$
  \end{solution*}}
\newcommand{\solution}[2][]{
  \ifshowsolutions
  \showsolution{#2}
  \else
  \inhandout{#1}
  \fi}
\newcommand{\insolutions}[1]{%
  \ifshowsolutions#1\fi}
\newcommand{\instatements}[1]{%
  \ifshowsolutions\else#1\fi}

\newcommand{\askaboutsolutions}{
  \typeout{}
  \typein[\answer]{Include solutions? (y/n) }
  \def\yes{y}
  \ifx\answer\yes
    \typeout{}
    \typeout{Solutions *INCLUDED*.} 
    \global\showsolutionstrue
  \else
    \typeout{}
    \typeout{Solutions *NOT INCLUDED*.} 
    \global\showsolutionsfalse
  \fi}
\newcommand{\decideaboutsolutions}{
  \askaboutsolutions
  \countersunderproblem
  \ifshowsolutions
    \setlength{\problemsep}{2\standardproblemsep}
    \setlength{\problempartsep}{\standardproblemsep}
  \else
    \setlength{\problemsep}{\standardproblemsep}
    \setlength{\problempartsep}{\standardproblempartsep}
  \fi}

\newcommand{\showsolutions}{
  \renewcommand{\askaboutsolutions}{\showsolutionstrue}}
\newcommand{\hidesolutions}{
  \renewcommand{\askaboutsolutions}{\showsolutionsfalse}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a paper %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts any paper (that has been defined in course.dat), given the
% paper's id, supertitle, and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \paper[revision info]{paper id}{supertitle}{title}
% Example: Assuming the definition 
%               \newpaper{ln1}{Sep 5, 2001}{}
%          in course.dat, the command
%               \paper[v1.1]{ln1}{Lecture Notes~1}{Proofs}
%          starts v1.1 of the first lecture notes, titled ``Proofs''. 
%
% [ The command is the Same as \formatpages, but the paper release
% date is communicated via the paper id. ]  
%
\newcommand{\paper}[4][\stamp]{%
  \formatpages[#1]{#3}{#4}{\releasedateofpaper{#2}}}


% Starts an exam paper (that has been defined in course.dat), given the
% paper's id and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \exam[revision info]{paper id}{paper title}
% Example: Assuming the definition 
%               \newpaper{ex1}{Sep 31, 2001}{}
%          in course.dat, the command
%               \exampaper[v1.1]{ex1}{Surprise Exam 1}
%          starts v1.1 of the first surprise exam. 
%
% [ The command is the Same as \formatexampages, but the paper's
% release is communicated via the paper id. ]  
%
\newcommand{\exampaper}[3][\stamp]{%
  \formatexampages[#1]{#3}{\releasedateofpaper{#2}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Repository %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\repositorydir}{.}                  % No trailing slash!
\newcommand{\repositoryselector}{**}

%%% In the repository %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Introduces the repository. If in ``plain repository'' mode, the
% appropriate first page title is printed; if in ``get problem''
% mode, the command is ignored. 
%       The unique argument should be the repository's name (typically
% a description of the general topic covered by the problems). 
%
% Usage  : \repositoryname{name}
% Example: \repositoryname{Logic}
%
\newcommand{\repositoryname}[1]{
  \ifthenelse{\equal{\repositoryselector}{**}}
  {\formatpages{}{Repository of Problems in #1}{}}
  {}}

% Introduces a new repository problem. If in ``plain repository''
% mode, the problem is printed after a label containing all the
% editor's information. If in ``get problem'' mode, the
% \repositoryselector is checked: if it matches the problem's label, 
% the problem is printed (without the label above); otherwise the
% problem is ignored. 
%       The arguments should be:
% 1. a unique (within the specific repository) label for the problem,  
% 2. the topic of the problem (typically something more specific than
%    the topic for the entire repository), 
% 3. the source of the problem (where did we first find it), 
% 4. the place we last used this problem (typically a term and a
%    problem set/tutorial number), 
% 5. the last author/revisor of the problem, 
% 6. the date of the last revision, 
% 7. the problem content (exactly as it would be formated in the
%    actual document it is supposed to be incorporated.
%
% Usage   : \newproblem {label}
%                       {topic}
%                       {source}
%                       {last use}
%                       {author(s)}
%                       {date}
%                       {content}
% Example : \newproblem {logic-7}
%                       {Logic} 
%                       {Velleman, Problem 6.17, p.~243}
%                       {Spring 2002, Problem Set~7}
%                       {Christos Kapoutsis}
%                       {February 9, 2002}
%                       {...}
%
%\newcommand{\newproblem}[7]{
%  \ifthenelse{\equal{\repositoryselector}{**}}
%  {\vspace{1cm}
%   \begin{fminipage}
%   \begin{tabular}{rl}
%     \textbf{Topic:}     & #2 \\
%     \textbf{Source:}    & #3 \\
%     \textbf{Last used:} & #4 \\
%     \textbf{Author:}    & #5 \\
%     \textbf{Date:}      & #6 \\
%     \textbf{Label:}     & #1
%   \end{tabular}
%   \pdfbookmark[1]{Problem~[#1]}{Problem:#1}%
%   \end{fminipage}%
%   \nopagebreak%
%   #7}
%  {\ifthenelse{\equal{\repositoryselector}{#1}}
%   {#7}
%   {}}}
\newcommand{\problemdata}[5]{
   \begin{fminipage}
   \begin{tabular}{rl}
     \textbf{Topic:}     	& #2 \\
     \textbf{Source:}    	& #3 \\
     \textbf{Usage:}     	& #4 \\
     \textbf{Last revision:}    & #5 \\
     \textbf{Label:}     	& #1
   \end{tabular}
   \end{fminipage}}



%%% In the document %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extracts a problem from a repository, for use in a document. 
%       The first argument should be the name of the file containing
% the repository. All names are supposed to hang under the path
% contained in \repositorydir; hence, the typical value of this 
% argument is just a file name, no directories in it. If the file's
% extension is ``.tex'', it may be omitted. 
%       The second argument should be the label of a problem in the
% specific repository (as defined via the first argument of the
% \newproblem command). 
%
% Usage  :  \getproblem{repository file name}{problem label}
% Example:  \getproblem{logic}{logic-7}
%
\newcommand{\getproblem}[2]{
  \renewcommand{\repositoryselector}{#2}
  \input{\repositorydir/#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting lecture notes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts lecture notes, given the lecture notes number and title. The
% corresponding paper must have been defined in course.dat, with id:
%       ln<number>
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \lecturenotes[revision info]{number}{title}
% Example: \lecturenotes[v1.1]{1}{Proofs}
%
\newcommand{\lecturenotes}[3][\stamp]{%
  \usenotesproblems
  \paper[#1]{ln#2}{Course Notes, Week~#2}{#3}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a problem list %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts a Problem Set, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in course.dat, with ids:   
%       ps<number>      (for the problem statements only), 
%       pss<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \problemset[revision info]{number}
% Example: \problemset[v1.1]{13}   % for Problem Set #13, v1.1
%
\newcommand{\problemset}[2][\stamp]{%
  \decideaboutsolutions
  \ifshowsolutions
    \paper[#1]{pss#2}{}{Solutions to Problem Set #2}
    \readingnote
  \else
    \paper[#1]{ps#2}{}{Problem Set #2}
    \centerline{\emph{Due}: \duedateofpaper{ps#2}}
    \bigskip
    \readingnote 
    \AtEndDocument{\coversheet{#2}}
  \fi}

% Prints the reading note that appears on the first page of a problem
% set, right after the title. The \reading command should be redefined
% every week, to reflect the new reading.
\newcommand{\readingnote}{\par\noindent\textbf{Reading:} \reading}
\newcommand{\reading}{%
  Redefine the $\backslash$\texttt{reading} command to get this week's 
  reading assignment here!%
  \message{^^JReading assignment *INCORRECT*.^^J^^J}}

% Starts a In-Class Problems paper, given its code (week & day). Asks 
% whether solutions should be included. If the answer is yes, the
% corresponding solutions paper is started. (Use \showsolutions or
% \hidesolutions to preselect the answer before the query ---and skip
% the query). The corresponding papers must have been defined in
% course.dat, with ids:    
%       cp<code>      (for the statements only), 
%       cps<code>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \inclassproblems[revision info]{code}
% Example: \inclassproblems[v1.1]{3W} % for Class Problems 3-W, v1.1 
%
\newcommand{\inclassproblems}[2][\stamp]{%
  \decideaboutsolutions
  \ifshowsolutions
    \paper[#1]{cps#2}{}{Solutions to In-Class Problems Week #2}
  \else
    \paper[#1]{cp#2}{}{In-Class Problems Week #2}
  \fi}


\newcommand{\recitationproblems}[2][\stamp]{%
  \decideaboutsolutions
  \ifshowsolutions
    \paper[#1]{recs#2}{}{Solutions to Recitation Problems Week #2}
  \else
    \paper[#1]{rec#2}{}{Recitation Problems Week #2}
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting an exam %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts a Quiz, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in course.dat, with ids:   
%       qu<number>      (for the problem statements only), 
%       qus<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \quiz[revision info]{number}
% Example: \quiz[v1.1]{3}   % for Quiz #3, v1.1
%
\newcommand{\quiz}[2][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{qus#2}{}{Solutions to Quiz #2}
  \else
    \exampaper[#1]{qu#2}{Quiz #2}
  \fi}

\newcommand{\miniquiz}[2][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{mqus#2}{}{Solutions to Mini-Quiz #2}
  \else
    \exampaper[#1]{mqu#2}{Mini-Quiz #2}
  \fi}

% Starts a Practice Quiz, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in course.dat, with ids:   
%       pq<number>      (for the problem statements only), 
%       pqs<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \practicequiz[revision info]{number}
% Example: \practicequiz[v1.1]{3}   % for Practice Quiz #3, v1.1
%
\newcommand{\practicequiz}[2][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{pqs#2}{}{Solutions to Practice Quiz #2}
  \else
    \exampaper[#1]{pq#2}{Practice Quiz #2}
  \fi}

% Starts a Final Exam. Asks whether solutions should be included. If
% the answer is yes, the corresponding solutions paper is
% started. (Use \showsolutions or \hidesolutions to preselect the
% answer before the query ---and skip the query). The corresponding
% papers must have been defined in course.dat, with ids:    
%       fe      (for the problem statements only), 
%       fes     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \final[revision info]
% Example: \final[v1.1]  % for v1.1 of the Final Exam
%
\newcommand{\final}[1][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{fes}{}{Solutions to the Final Examination}
  \else
    \exampaper[#1]{fe}{Final Examination}
  \fi}

\newcommand{\conflictfinal}[1][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{cfes}{}{Solutions to the Conflict Final}
  \else
    \exampaper[#1]{cfe}{Conflict Final}
  \fi}

% Starts a Practice (Final) Exam, given its number. Asks whether
% solutions should be included. If the answer is yes, the
% corresponding solutions paper is started. (Use \showsolutions or
% \hidesolutions to preselect the answer before the query ---and skip
% the query). The corresponding papers must have been defined in
% course.dat, with ids:    
%       pe<number>      (for the problem statements only), 
%       pes<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \practiceexam[revision info]{number}
% Example: \practiceexam[v1.1]{3}   % for Practice Exam #3, v1.1
%
\newcommand{\practiceexam}[2][\stamp]{%
  \decideaboutsolutions
  \useexamproblems
  \ifshowsolutions
    \paper[#1]{pes#2}{}{Solutions to Practice Exam #2}
  \else
    \exampaper[#1]{pe#2}{Practice Exam #2}
  \fi}

\newcommand{\examappendix}[2][\stamp]{%
  \ifshowsolutions
    \paper[#1]{pes#2}{}{Solutions to Practice Exam #2}
  \else
    \exampaper[#1]{pe#2}{Practice Exam #2}
  \fi}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a repository %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts a repository, given the name of the file containing it. This
% name is supposed to hang under the directory contained in
% \repositorydir. 
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \repository{repository file name}
% Example: \repository{logic}
%
\newcommand{\repository}[1]{
  \decideaboutsolutions
  \userepositoryproblems
  \setlength{\problemsep}{0pt}
  \renewcommand{\repositoryselector}{**}
  \input{\repositorydir/#1}}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% COURSE PARAMETERS (NAMES & NUMBERS)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defines a new paper, given the paper's id, release date, and due
% date (if any). That is, 
%    \newpaper{id}{release date}{due date}
% For example:
%    \newpaper{ln1}{September  5, 2001}{ }
% defines the first Lecture Notes. They are out on Sep 5, 2001. There
% is no due date. Similarly,
%    \newpaper{ps2}{September 21, 2001}{September 28, 2001} 
% defines the 2nd Problem Set, released on Sep 21, 2001, and due on
% Sep 28, 2001. 
%
\newcommand{\newpaper}[3]{
  \global\expandafter\def\csname @paper@#1@out\endcsname{#2}
  \global\expandafter\def\csname @paper@#1@due\endcsname{#3}}

% Returns the releasedate/due date of a paper, given the
% paper's id. For example, given the definitions of the examples
% above, \releasedateofpaper{ln1} returns ``September 5, 2001'', and 
% \duedateofpaper{ps2} returns ``September 28, 2001''.
%
\newcommand{\releasedateofpaper}[1]{%
    \@ifundefined{@paper@#1@out}{%
        \ClassWarning{mcs}{Undefined paper id `#1'}%
    }{%
        \@nameuse{@paper@#1@out}%
    }%
}

\newcommand{\duedateofpaper}[1]{%
    \@ifundefined{@paper@#1@due}{%
        \ClassWarning{mcs}{Undefined paper id `#1'}%
    }{%
        \@nameuse{@paper@#1@due}%
    }%
}

% Loads the definitions of all papers for the current term. This data
% file (course.dat) should be kept in the same directory as this 
% style file (course.sty).

\IfFileExists{00course.dat}{\input{00course.dat}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% BACKWARDS COMPATIBILITY            
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use this command in the preamble, if you want some of the old
% features included. Please use  `course.old'  to add material that is
% needed for backwards compatibility only.
\newcommand{\backwardscompatibility}{\input{course.old}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% DIRTY HACKING      
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use this command to write unexpanded material to a file 
% [The TeXbook, pages 376-377]. 
%
\def\\{\let\stoken= } \\
\long\def\unexpandedwrite#1#2{\def\finwrite{\write#1}%
  {\aftergroup\finwrite\aftergroup{\sanitize#2\endsanity}}}
\def\sanitize{\futurelet\next\sanswitch}
\def\sanswitch{\let\n@xt\endsanity \ifx\next\endsanity
  \else\ifcat\noexpand\next\stoken\aftergroup\space\let\n@xt=\eat
  \else\ifcat\noexpand\next\bgroup\aftergroup{\let\n@xt=\eat
  \else\ifcat\noexpand\next\egroup\aftergroup}\let\n@xt=\eat
  \else\let\n@xt=\copytok\fi\fi\fi\fi \n@xt}
\def\eat{\afterassignment\sanitize \let\next= }
\long\def\copytok#1{\ifcat\noexpand#1\relax\aftergroup\noexpand\fi
  \ifcat\noexpand#1\noexpand~\aftergroup\noexpand\fi
  \aftergroup#1\sanitize}
\def\endsanity\endsanity{}

% To do something only when an argument is nonempty & not `\empty'.
% If #1 is empty, \ifx compares \empty with \else, finds them
%   different and just gobbles up everything up to \fi, doing nothing.
% Otherwise: if #1 is the \empty command, \ifx compares it with
%   \empty, finds them identical, executes everything (nothing) upto
%   the \else command and ignores everything else upto \fi. So, in
%   total, it does nothing at all.
% Otherwise: if #1 is not the \empty command, \ifx compares \empty
%   with (the starting of) #1, finds them different, gobbles up
%   everything up to \else, and executes #2.
% Apparently, #1 shouldn't contain an unmatched \else.
\def\@ifnonempty#1#2{\ifx\empty#1\else#2\fi}

\ifx\@class@option@file\@empty\else
    \input{\@class@option@file}
\fi

%% If it exists, .solutionspolicy will contain either
%% \showsolutionstrue or \showsolutionsfalse.

\IfFileExists{.solutionspolicy}{%
    \input{.solutionspolicy}%
    \let\askaboutsolutions\@empty
}{}

\endinput
