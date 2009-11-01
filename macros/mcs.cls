%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                        CLASS DECLARATIONS                        %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mcs}

\newif\ifshowsolutions
\showsolutionsfalse

\let\@class@option@file\@empty

\DeclareOption{book}{}

\DeclareOption{handout}{%
    \PassOptionsToClass{11pt}{book}
    \def\@class@option@file{handout}%
}

\DeclareOption{quiz}{%
    \ExecuteOptions{handout}%
    \def\@class@option@file{quiz}%
}

\DeclareOption{problem}{%
    \def\@class@option@file{problem}%
}

\DeclareOption{problems}{%
    \def\@class@option@file{problems}%
}

\DeclareOption{debug}{%
    \tracingoutput=1
    \showboxbreadth=2147483647
    \showboxdepth=\showboxbreadth
    \let\@fix@nominalspinewidth\@empty
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{11pt,twoside,book}

\ProcessOptions\relax

\LoadClass{book}[2005/09/16]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                        STANDARD PACKAGES                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage{keyval}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{subfigure}
\RequirePackage{palatino}
\RequirePackage{textcomp}
\RequirePackage{verbatim}
\RequirePackage{index}

\RequirePackage{xr-hyper}

\RequirePackage[
    colorlinks, bookmarksopen, bookmarksnumbered,
    pdfpagemode=UseOutlines,
    linkcolor=blue, citecolor=blue,
    urlcolor=blue, backref, pagebackref]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                         LOW-LEVEL MACROS                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%% Now redefine \documentclass as a no-op.

\renewcommand{\documentclass}[2][]{}

%% Keyword processing: We want to disable certain special characters
%% inside the argument of \pkeywords and related macros.  This is
%% similar to LaTeX's \@sanitize, except that (a) We don't want the
%% space character to be touched and (b) we want some characters to
%% print as themselves so they can be used in keywords.

\def\@sanitize@keywords{%
    \@makeother\\%
    \@makeother\$%
    \@makeother\&%
    \@makeother\^%
    \@makeother\~%
    \catcode`\_=\active
    \catcode`\#=\active
    \catcode`\%=\active
}

\begingroup
    \catcode`\_=\active
    \catcode`\#=\active
    \catcode`\%=\active
    \gdef%{\%}
    \gdef#{\#}
\endgroup

%% \gobble@text eats its argument in a safe way; \@bsphack and
%% \@esphack keep a use of the macro from inserting extra horizontal
%% space in certain contexts.

\newcommand{\gobble@text}{%
    \@bsphack
    \begingroup
        \@sanitize@keywords
        \@gobble@text
}

\newcommand{\@gobble@text}[1]{%
        \endgroup
    \@esphack
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                    CONDITIONAL TEXT INCLUSION                    %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\inbook\@firstofone
\let\inhandout\gobble@text
\let\inmcsprob\gobble@text

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                       EXTERNAL REFERENCES                        %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Can't use \let here because of hyperref.

\def\bref{\ref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                             INDEXING                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\idx}[1]{\index{#1}#1}

\newcommand{\printchapindex}[1]{%
    \def\@indextype{default}%
    \let\index@prologue\@empty
    \@input@{#1.ind}%
}

\renewenvironment{theindex}{%
    \edef\indexname{\the\@nameuse{idxtitle@\@indextype}}%
    \if@twocolumn
        \@restonecolfalse
    \else
        \@restonecoltrue
    \fi
    \columnseprule \z@
    \columnsep 35\p@
    \twocolumn[%
        \phantomsection
        \addcontentsline{toc}{chapter}{\indexname}%
        \@makeschapterhead{\indexname}%
        \ifx\index@prologue\@empty\else
            \index@prologue
            \bigskip
        \fi
    ]%
    \@mkboth{\MakeUppercase\indexname}%
            {\MakeUppercase\indexname}%
    \thispagestyle{plain}%
    \parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \let\item\@idxitem
}{%
    \if@restonecol
        \onecolumn
    \else
        \clearpage
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                 TEXT/MATH ALIASES AND SHORTCUTS                  %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\mfigure}[3]{%
    \bigskip
    \centerline{\resizebox{#1}{#2}{\includegraphics{#3}}}%
    \bigskip
}

%  text highlighting

\newcommand{\floatingtextbox}[1]{%
  \begin{figure}[htbp]
    \textbox{#1}
  \end{figure}%
}

\newcommand{\textbox}[1]{%
    \begin{center}
        \fbox{%
            \begin{minipage}[t]{\textwidth}
                \setlength{\parindent}{3ex}
                \setlength{\parskip}{\medskipamount}
                \vspace{0.5ex} #1 \vspace{0.5ex}%
            \end{minipage}%
        }%
    \end{center}%
}

\newcommand{\textboxtitle}[1]{%
    \begin{center}
        \textbf{\Large #1}%
    \end{center}%
}
 
%%% Ugly box of red text that we can't ignore for too long :) 

\newcommand{\TBA}[1]{\fbox{\textcolor{red}{\bf TBA - #1}}}

\newcommand{\term}{%
    \@ifstar\emph\idx@term
}

\newcommand{\idx@term}[1]{%
    \emph{\idx{#1}}%
}

\newcommand{\SET}[1]{\textsc{#1}}
\newcommand{\STR}[1]{\texttt{#1}}
\newcommand{\CMD}[1]{\textsc{\bf#1}}

\newcommand{\edge}[2]{#1\text{---}#2}
\newcommand{\diredge}[2]{#1 \to #2}

%% Text -- Abbreviations

\newcommand{\ie}{\emph{i.e.},\xspace}
\newcommand{\eg}{\emph{e.g.},\xspace}
\newcommand{\etc}{etc.\@\xspace}

\newcommand{\IQ}{\text{IQ\@\xspace}}

%% Text -- Constructs

\newcommand{\hint}{\emph{Hint: }}
\newcommand{\brule}[1]{\underline{\hspace{#1}}}
%\newenvironment{optional}[1]{\small [Optional] #1}{}
\newenvironment{optional}[1]{\footnotesize [Optional] #1}{}
%\newenvironment{optional}{\begin{quotation}\small [Optional]}{\end{quotation}}

%% Math -- General

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

%% Math -- Logic

\newcommand{\true}{\textcolor{green}{\ensuremath{\mathbf{T}}}}
\newcommand{\false}{\textcolor{red}{\ensuremath{\mathbf{F}}}}
\newcommand{\True}{\ensuremath{\mathbf{True}}}
\newcommand{\False}{\ensuremath{\mathbf{False}}}

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

\newcommand{\Rule}[2]{%
    \[
        \begin{array}{c}
            #1 \\ \hline
            #2%
        \end{array}
    \]
}

\newcommand{\LabelRule}[3]{%
    \[
        \begin{array}{cr}
              #1 \\ \hline
            & \text{#3}\\
              #2
        \end{array}
    \]
}

\newcommand{\ruleref}[1]{Rule \ref{#1}}

%% Math -- Set theory

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

%\newcommand{\degr}[1]{\text{deg}(#1)}
\newcommand{\degr}[1]{\mathop{\textup{deg}}\nolimits\left(#1\right)}

%% Math -- Languages

\newcommand{\emptystring}{\lambda}

%% Math -- Famous sets

\newcommand{\naturals}{\mathbb{N}}
\newcommand{\integers}{\mathbb{Z}}
\newcommand{\rationals}{\mathbb{Q}}
\newcommand{\reals}{\mathbb{R}}
\newcommand{\complexes}{\mathbb{C}}

%% Math -- Arithmetic

\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}
%\newcommand{\divides}{\mathbin{|}}
\newcommand{\divides}{\mid}

\newcommand{\rem}[2]{\operatorname{rem}(#1,#2)}
\newcommand{\remainder}{\mopt{remainder}}
\newcommand{\quotient}{\mopt{quotient}}
\newcommand{\lcm}{\mopt{lcm}}

%% Misc. - taken from ln and cp to avoid multiply def'd ref's

%% Ick. [dmj]

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
\newcommand{\minussym}{\mopt{-}}
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

\newcommand{\surj}{\mrelt{surj}}
\newcommand{\inj}{\mrelt{inj}}
\newcommand{\bij}{\mrelt{bij}}
\newcommand{\strict}{\mrelt{strict}}

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

%% Math -- Probability

%% Parameters/Variables

\newlength{\strutheight}

\newcommand{\sspace}{\mathcal{S}}

\newcommand{\pr}[1]{\mathop{\textup{Pr}}\nolimits\left\{#1\right\}}
\newcommand{\prob}[1]{\pr{#1}}
\newcommand{\prsub}[2]{\mathop{\textup{Pr}_{#2}}\nolimits\left\{#1\right\}}

\newcommand{\prcond}[2]{%
    \ifinner
        \settoheight{\strutheight}{$#1 #2$}%
    \else
        \settoheight{\strutheight}{$\displaystyle#1 #2$}%
     \fi
    \mathop{\textup{Pr}}\nolimits\left\{
        #1\,\left|\protect\rule{0cm}{\strutheight}\right.\,#2
    \right\}%
}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                          THEOREMS, ETC.                          %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Due to an apparent bug in amsthm.sty, something like this
%%
%%    \begin{problem}
%%        \begin{lemma}
%%        \end{lemma}
%%    \end{problem}
%%
%% where problem has a custom head specification and lemma doesn't,
%% causes lemma to inherit the custom head specification from problem.
%% This patches the three standard theorem styles to fix that problem.

\def\th@plain{%
    \let\thmhead\thmhead@plain
    \itshape % body font
}

\def\th@definition{%
    \let\thmhead\thmhead@plain
    \normalfont % body font
}

\def\th@remark{%
    \let\thmhead\thmhead@plain
    \thm@headfont{\itshape}%
    \normalfont % body font
    \thm@preskip\topsep \divide\thm@preskip\tw@
    \thm@postskip\thm@preskip
}

%% THEOREM-LIKE

\theoremstyle{plain}

\newtheorem{theorem}{Theorem}[section]
\newtheorem*{theorem*}{Theorem}

\newtheorem{falsethm}[theorem]{False Theorem}
\newtheorem*{falsethm*}{False Theorem}

\newtheorem{lemma}[theorem]{Lemma}
\newtheorem*{lemma*}{Lemma}

\newtheorem{proposition}[theorem]{Proposition}
\newtheorem*{proposition*}{Proposition}

\newtheorem{corollary}[theorem]{Corollary}
\newtheorem*{corollary*}{Corollary}

\newtheorem{claim}[theorem]{Claim}
\newtheorem*{claim*}{Claim}

\newtheorem{falseclm}[theorem]{False Claim}
\newtheorem*{falseclm*}{False Claim}

\newtheorem{rul}[theorem]{Rule}
\newtheorem*{rul*}{Rule}

\newtheorem{mathrule}{Rule}
\newtheorem*{mathrule*}{Rule}

%% DEFINITION-LIKE

\theoremstyle{definition}

\newtheorem{definition}[theorem]{Definition}
\newtheorem*{definition*}{Definition}

\newtheorem{fact}[theorem]{Fact}
\newtheorem*{fact*}{Fact}

\newtheorem{axiom}[theorem]{Axiom}
\newtheorem*{axiom*}{Axiom}

%% REMARK-LIKE

\theoremstyle{remark}

\newtheorem{remark}[theorem]{Remark}
\newtheorem*{remark*}{Remark}

\newtheorem{example}[theorem]{Example}
\newtheorem*{example*}{Example}

\newtheorem{xample}[theorem]{Example}
\newtheorem*{xample*}{Example}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                              PROOFS                              %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Copy the amsthm proof environment and add code to set the
%% \if@just@ended@proof@ flag to communicate with an enclosing
%% solution environment.

\newif\if@just@ended@proof@

\renewenvironment{proof}[1][\proofname]{%
    \par
    \pushQED{\qed}%
    \normalfont
    \topsep6\p@\@plus6\p@\relax
    \trivlist
        \item[\hskip\labelsep \itshape #1\@addpunct{.}]\ignorespaces
}{%
        \popQED
    \endtrivlist
    \global\@just@ended@proof@true
    \global\everypar{\global\@just@ended@proof@false}%
    \@endpefalse
}

\newenvironment{falseproof}{%
    \proof[False proof]%
}{%
    \endproof
}

\newenvironment{bogusproof}{%
    \proof[Bogus proof]%
}{%
    \endproof
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                             PROBLEMS                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% problem environments and section headers for use in the book
\newenvironment{problems}{%
    \subsection{Problems}%
}{}
\newcommand{\practiceproblems}{\subsubsection*{Practice Problems}}
\newcommand{\classproblems}{\subsubsection*{Class Problems}}
\newcommand{\homeworkproblems}{\subsubsection*{Homework Problems}}
\newcommand{\examproblems}{\subsubsection*{Exam Problems}}

%% pcomments is an itemized list environment that shows up only when
%% the standalone version of the problem is compiled.

\let\pcomments\comment
\let\endpcomments\endcomment

%% pkeywords attaches a string of whitespace-delimited (including newline) 
%%  keywords to problems and prints out the list when the standalone version 
%%  of the problem is compiled.
%%
%% Usage: \pkeywords{keyword_1 keyword_2 keyword_3}
%%

\newcommand{\pkeywords}{\gobble@text}

\define@key{mcsprob}{points}{\def\mcsprob@points{#1}}
\define@key{mcsprob}{title}{\def\mcsprob@title{#1}}

\def\mcsprob@points{0}
\let\mcsprob@title\@empty
\let\mcsprob@filename\@empty

\newif\if@optional@problem
\@optional@problemfalse

%% Input a problem.

\newcommand{\pinput}{%
    \begingroup
        \@optional@problemfalse
        \@ifstar{\@optional@problemtrue\@pinput}\@pinput
}

\newcommand{\@pinput}[2][]{%
        \def\mcsprob@filename{#2}%
        \let\mcsprob@points\@empty
        \let\mcsprob@title\@empty
        \setkeys{mcsprob}{#1}%
        \IfFileExists{\mcsprob@filename}{%
            \input{\mcsprob@filename}%
        }{%
            \ClassWarning{mcs}{Can't find problem `\mcsprob@filename'}%
        }%
    \endgroup
}

%% The basic problem environment.

\newlength{\standardproblemsep}
\newlength{\standardproblempartsep}

\newlength{\problemsep}
\newlength{\problempartsep}

\setlength{\standardproblemsep}{0.5cm}
\setlength{\standardproblempartsep}{1ex}

\setlength{\problemsep}{\standardproblemsep}
\setlength{\problempartsep}{\standardproblempartsep}

\newcommand{\theoremsunderproblems}{%
    \renewcommand{\thetheorem}{\theproblem.\arabic{theorem}}%
}

\def\pdf@problem@bookmark{%
    \pdfbookmark[1]{Problem~\@currentlabel}{Problem \@currentlabel}%
}

\newtheoremstyle{problem}
                {\problemsep}               % preskip
                {\problemsep}               % postskip
                {\normalfont}               % body style
                {0pt}                       % indent
                {\bfseries}                 % head style
                {.}                         % post-head punct
                {\newline}                  % post-head space
                {\mcs@problem@heading{#1}{#2}{#3}}% custom head-spec

\theoremstyle{problem}

\newtheorem{problem}{Problem}[chapter]
\newtheorem*{problem*}{Problem}

\def\problem{%
    \mcs@thm{\let\thm@swap\@gobble\th@problem}{problem}{Problem}%
}

\def\mcs@get@label#1#2\@nil{#1}

\def\mcs@thm#1#2#3{%
    \def\mcs@thm@type{#3}%
    \ifhmode\unskip\unskip\par\fi
    \normalfont
    \trivlist
    \let\thmheadnl\relax
    \let\thm@swap\@gobble
    \thm@notefont{\fontseries\mddefault\upshape}%
    \thm@headpunct{.}% add period after heading
    \thm@headsep 5\p@ plus\p@ minus\p@\relax
    \thm@space@setup
    #1% style overrides
    \@topsep \thm@preskip               % used by thm head
    \@topsepadd \thm@postskip           % used by \@endparenv
    \mcs@thm@{#2}{#3}%
}

\def\mcs@thm@#1#2{%
    \def\@tempa{#1}%
    \ifx\@empty\@tempa
        \def\@tempa{\@oparg{\mcs@begintheorem{#2}{}}[]}%
    \else
        \refstepcounter{#1}%
        \ifx\mcsprob@filename\@empty\else
            \label\mcsprob@filename
        \fi
        \def\@tempa{\@oparg{\mcs@begintheorem{#2}{\csname the#1\endcsname}}[]}%
    \fi
    \@tempa
}

\def\mcs@begintheorem#1#2[#3]{%
    \ifx\mcsprob@title\@empty
        \@begintheorem{#1}{#2}[#3]%
    \else
        \@begintheorem{#1}{#2}[\mcsprob@title]%
    \fi
}

\def\mcs@problem@heading#1#2#3{%
    \thmname{#1}%
    \thmnumber{\@ifnotempty{#1}{\pdf@problem@bookmark\space}\@upn{#2}}%
    \thmnote{ {\the\thm@notefont(#3)}}%
}

\def\print@points#1#2{%
    \begingroup
        \def\@tempa{#1}%
        \def\@tempb{#2}%
        \afterassignment\print@points@
        \@tempcnta=
}

\def\print@points@{%
        \ifnum\@tempcnta = \z@\else
            \@tempa
            \the\@tempcnta\ point\ifnum\@tempcnta=\@ne\else s\fi
            \@tempb
        \fi
    \endgroup
}

%%% Notes problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Very similar to the ``simpleproblem'' environment.  Difference is that
% the pdf bookmarks are suppressed, so that they don't mess up with
% the standard section bookmarking.  Also, there is no extra space added
% before the problem.

\newtheoremstyle{notesproblem}
                {\problemsep}               % preskip
                {\problemsep}               % postskip
                {\normalfont}               % body style
                {0pt}                       % indent
                {\bfseries}                 % head style
                {:}                         % post-head punct
                { }                         % post-head space
                {}                          % custom head-spec

\theoremstyle{notesproblem}

\newtheorem*{notesproblem}{Quick Exercise}

%% subproblems

\newcounter{problempart}[problem]
\renewcommand{\theproblempart}{\alph{problempart}}
\newcommand{\labelproblempart}{(\theproblempart)}

\newenvironment{problemparts}{%
    \list{\textbf{\labelproblempart}}{%
        \@nmbrlisttrue
        \def\@listctr{problempart}%
        \settowidth{\labelwidth}{\textbf{(m)}}%
        \setlength{\labelsep}{1ex}%
        \setlength{\leftmargin}{0pt}%
        \setlength{\itemindent}{\labelwidth}%
        \addtolength{\itemindent}{\labelsep}%
        \setlength{\rightmargin}{0pt}%
        \setlength{\listparindent}{0pt}%
        \setlength{\itemsep}{\problempartsep}%
        \topsep\z@
    }%
}{%
    \endlist
}

% \newcommand{\problempartbookmark}{%
%     \pdfbookmark[2]{(\theproblempart)}{Problem\theproblem\theproblempart}%
% }

% \newcommand{\problempart}[1][0]{\item\problempartbookmark}

\newcommand{\problempart}[1][0]{\item}%

\newcommand{\pref}[1]{(\ref{#1})}
\newcommand{\ppref}[2]{\ref{#1}(\ref{#2})}

\newcommand{\bparts}{\begin{problemparts}}
\newcommand{\eparts}{\end{problemparts}}
\newcommand{\ppart}{\problempart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                            SOLUTIONS                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Copy the amsthm proof environment, with 4 changes:
%% a) Default label is ``Solution'', not ``Proof''
%% b) label is typeset in bold, not italics
%% c) Use a black square instead of an open square for the QED symbol.
%% d) Suppress the normal QED mark if \if@just@ended@proof@ is true
%%    (see proof environment above).

\DeclareRobustCommand{\solution@qed}{%
  \ifmmode \mathqed
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\ensuremath{\blacksquare}}%
  \fi
}

\def\eatQED@elt#1#2\relax{\gdef\QED@stack{#2}}

\newenvironment{solution}[1][Solution]{%
    \par
    \global\@just@ended@proof@false
    \pushQED{\solution@qed}%
    \normalfont
    \topsep6\p@\@plus6\p@\relax
    \trivlist
        \item[\hskip\labelsep\bfseries#1\@addpunct{.}]%
        \ignorespaces
}{%
        \if@just@ended@proof@
            \let\popQED@elt\eatQED@elt
        \fi
    \popQED
    \endtrivlist
    \@endpefalse
}

\AtBeginDocument{%
    \ifshowsolutions
        \typeout{^^JSolutions *INCLUDED*.^^J}%
        \let\insolutions\@firstofone
        \let\instatements\gobble@text
        \problemsep2\standardproblemsep
    \else
        \typeout{^^JSolutions *NOT INCLUDED*.^^J}%
        \let\insolutions\gobble@text
        \let\instatements\@firstofone
        \let\solution\comment
        \let\endsolution\endcomment
    \fi
}

\newcommand{\askaboutsolutions}{%
    \typeout{}
    \typein[\answer]{Include solutions? (y/n) }%
    \if y\answer
        \global\showsolutionstrue
    \else
        \global\showsolutionsfalse
    \fi
}

\newcommand{\decideaboutsolutions}{%
    \askaboutsolutions
%    \theoremsunderproblems
}

\newcommand{\showsolutions}{%
    \showsolutionstrue
    \let\askaboutsolutions\@empty
}

\newcommand{\hidesolutions}{%
    \showsolutionsfalse
    \let\askaboutsolutions\@empty
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                              EXAMS                               %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% \examspace produces vertical space only in handouts without solutions. 
%%   If no optional argument is passed then it starts a new page,
%%   otherwise inserts \vspace{arg}.  e.g. \examspace[1in]

\newcommand{\examspace}[1][]{}

\newcommand{\@examspace}[1][]{%
    \ifshowsolutions\else
        \ifcat###1##%
            \newpage
        \else
            \vspace{#1}%
        \fi
    \fi
}

%% \examrule creates a \brule only in handouts without solutions.  If
%%   no argument is passed then the default \hspace is 0.5in
\newcommand{\examrule}[1][0.5in]{\inhandout{\instatements{\brule{#1}}}}

%% \exambox{W}{H}{D} creates a \fbox having width W, height H 
%%   and at distance D from the bottom of the current line (only in 
%%   handouts without solutions). 
\newcommand{\exambox}[3]{\inhandout{\instatements{
  \fbox{\rule{#1}{0in}\rule[#3]{0in}{#2}}}}}

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

\newenvironment{fminipage}[1][\linewidth]{%
    \setlength{\fminilength}{#1}
    \addtolength{\fminilength}{-2\fboxsep}
    \addtolength{\fminilength}{-2\fboxrule}
    \begin{lrbox}{\fminibox}\begin{minipage}{\fminilength}%
}{%
    \end{minipage}\end{lrbox}\noindent\fbox{\usebox{\fminibox}}%
}

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
% 00course.dat, once at the beginning of the term) to contain the
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
  2009%
  \message{^^JCopyright year is *INCORRECT*.^^J^^J}}
\newcommand{\coursecopyrightnames}{%
  Prof.~Albert R Meyer%
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
  \markboth{\@ifnotempty{#2}{#2: }#3}{\@ifnotempty{#2}{#2: }#3}
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
  \textbf{Circle the name of your TA}:
  \begin{center}
  \renewcommand{\arraystretch}{2.5}
  \begin{tabular}{c}
     \courseassistants
  \end{tabular}
  \end{center}
  \begin{itemize}

  \item
   This quiz is \textbf{closed book}.  Total time is 25 minutes.

  \item
   Write your solutions in the space provided.  If you need more
   space, write on the back of the sheet containing the problem.
   Please keep your entire answer to a problem on that problem's page.

  \item
   GOOD LUCK!
  \end{itemize}}}

\newcommand{\examtable}{%
    \ifx\examtablecontents\@empty
        \vfill
        \begin{center}
        This is where the grades table is supposed to be printed. Compile
        the paper once more to get it right. See \texttt{course.sty} for
        details.
        \end{center}
        \message{^^JGrades table was *NOT PRINTED*.^^J^^J}
        \vfill
    \else
        \print@examtable
    \fi
}

\def\print@exam@line#1#2{%
    \global\advance\@tempcnta #2\relax
    #1&#2&&\\\hline
}

\def\print@examtable{%
    \begin{center}
        \let\@elt\print@exam@line
        \@tempcnta\z@
        \renewcommand{\arraystretch}{1.5}
        \begin{tabular}{|c|c|c|c|}
            \hline
            Problem & Points & Grade  & Grader \\\hline\hline
            \examtablecontents                   \hline
            Total   & \the\@tempcnta & &        \\\hline
        \end{tabular}
    \end{center}
}

% Formats the cover sheet (for the student's solutions) provided at
% the end of every problem set, given the problem set number. 
%
% Usage  : \coversheet{problem set number}
% Example: \coversheet{13}
%
%       The commands \courseassistants and \collaborationnote
% are used, meant to be renewed by the user (in 00course.dat, once at
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
         \ifnum\value{rowcounter}<\value{problem}
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
  \texttt{00course.dat} to have a collaboration statement form printed 
  in this space!
  \message{^^JCollaboration statement form *INCORRECT*.^^J^^J}}

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
\let\examtablecontents\@empty

\newcommand{\examtableupdate}{%
    \begingroup
        \afterassignment\examtableupdate@
        \@tempcnta=
}

\newcommand{\examtableupdate@}{%
        \let\@elt\relax
        \protected@write\@auxout{}{%
            \protect\g@addto@macro\protect\examtablecontents{%
                 \protect\@elt{\theproblem}{\the\@tempcnta}%
             }%
         }%
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a paper %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts any paper (that has been defined in 00course.dat), given the
% paper's id, supertitle, and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \paper[revision info]{paper id}{supertitle}{title}
% Example: Assuming the definition 
%               \newpaper{ln1}{Sep 5, 2001}{}
%          in 00course.dat, the command
%               \paper[v1.1]{ln1}{Lecture Notes~1}{Proofs}
%          starts v1.1 of the first lecture notes, titled ``Proofs''. 
%
% [ The command is the Same as \formatpages, but the paper release
% date is communicated via the paper id. ]  

\newcommand{\paper}[4][\stamp]{%
  \formatpages[#1]{#3}{#4}{\releasedateofpaper{#2}}}

% Starts an exam paper (that has been defined in 00course.dat), given the
% paper's id and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \exam[revision info]{paper id}{paper title}
% Example: Assuming the definition 
%               \newpaper{ex1}{Sep 31, 2001}{}
%          in 00course.dat, the command
%               \exampaper[v1.1]{ex1}{Surprise Exam 1}
%          starts v1.1 of the first surprise exam. 
%
% [ The command is the Same as \formatexampages, but the paper's
% release is communicated via the paper id. ]  
%

\newcommand{\exampaper}[3][\stamp]{%
    \formatexampages[#1]{#3}{\releasedateofpaper{#2}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting lecture notes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts lecture notes, given the lecture notes number and title. The
% corresponding paper must have been defined in 00course.dat, with id:
%       ln<number>
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \lecturenotes[revision info]{number}{title}
% Example: \lecturenotes[v1.1]{1}{Proofs}

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
% corresponding papers must have been defined in 00course.dat, with ids:   
%       ps<number>      (for the problem statements only), 
%       pss<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \problemset[revision info]{number}
% Example: \problemset[v1.1]{13}   % for Problem Set #13, v1.1

\newcommand{\problemset}[2][\stamp]{%
    \theoremsunderproblems
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
% 00course.dat, with ids:    
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
    \theoremsunderproblems
  \ifshowsolutions
    \paper[#1]{cps#2}{}{Solutions to In-Class Problems Week #2}
  \else
    \paper[#1]{cp#2}{}{In-Class Problems Week #2}
  \fi}

\newcommand{\recitationproblems}[2][\stamp]{%
    \theoremsunderproblems
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
% corresponding papers must have been defined in 00course.dat, with ids:   
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
    \theoremsunderproblems
  %\useexamproblems
  \ifshowsolutions
    \paper[#1]{qus#2}{}{Solutions to Quiz #2}
  \else
    \exampaper[#1]{qu#2}{Quiz #2}
  \fi}

\newcommand{\miniquiz}[2][\stamp]{%
    \theoremsunderproblems
    \ifshowsolutions
        \paper[#1]{mqus#2}{}{Solutions to Mini-Quiz #2}
    \else
        \exampaper[#1]{mqu#2}{Mini-Quiz #2}
    \fi
}

% Starts a Practice Quiz, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in 00course.dat, with ids:   
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
    \theoremsunderproblems
  %\useexamproblems
  \ifshowsolutions
    \paper[#1]{pqs#2}{}{Solutions to Practice Quiz #2}
  \else
    \exampaper[#1]{pq#2}{Practice Quiz #2}
  \fi}

% Starts a Final Exam. Asks whether solutions should be included. If
% the answer is yes, the corresponding solutions paper is
% started. (Use \showsolutions or \hidesolutions to preselect the
% answer before the query ---and skip the query). The corresponding
% papers must have been defined in 00course.dat, with ids:    
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
    \theoremsunderproblems
  %\useexamproblems
  \ifshowsolutions
    \paper[#1]{fes}{}{Solutions to the Final Examination}
  \else
    \exampaper[#1]{fe}{Final Examination}
  \fi}

\newcommand{\conflictfinal}[1][\stamp]{%
    \theoremsunderproblems
  %\useexamproblems
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
% 00course.dat, with ids:    
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
    \theoremsunderproblems
  %\useexamproblems
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                           PAGE LAYOUT                            %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hoffset        = -1.0 in
\voffset        = -1.25 in

% An indent of 1/8" (9pt) is far too little.  For this textwidth, you
% want a minimum of 1em (10pt) and something approaching 2em wouldn't
% be out of the question.  The LaTeX default of 15pt is pretty good.

%\setlength{\parindent}{0.125in}
\setlength{\parskip}{0in}            
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

% Loads the definitions of all papers for the current term. This data
% file (00course.dat) should be kept in semester-specific directory.

\IfFileExists{00course.dat}{\input{00course.dat}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                      LOADING CLASS OPTIONS                       %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\@class@option@file\@empty\else
    \input{\@class@option@file.clo}
\fi

%% Sticky solutions policy: If it exists, .solutionspolicy will
%% contain either \showsolutions or \hidesolutions.

\IfFileExists{.solutionspolicy}{%
    \input{.solutionspolicy}%
}{}

\decideaboutsolutions

\endinput
