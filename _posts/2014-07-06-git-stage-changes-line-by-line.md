---
layout: post
title: Staging changes line by line with git
---

Every day is a reminder that git is hard. I've been having trouble staging line by line changes
with git, and wanted to use this "til" opportunity to work my way through the problem.

This is the current output of `git diff`:

 <style type="text/css">
td.linenos { background-color: #f0f0f0; padding-right: 10px; }
span.lineno { background-color: #f0f0f0; padding: 0 5px 0 5px; }
pre { line-height: 125%; }
body .hll { background-color: #ffffcc }
body .c { color: #008800; font-style: italic } /* Comment */
body .err { border: 1px solid #FF0000 } /* Error */
body .k { color: #AA22FF; font-weight: bold } /* Keyword */
body .o { color: #666666 } /* Operator */
body .cm { color: #008800; font-style: italic } /* Comment.Multiline */
body .cp { color: #008800 } /* Comment.Preproc */
body .c1 { color: #008800; font-style: italic } /* Comment.Single */
body .cs { color: #008800; font-weight: bold } /* Comment.Special */
body .gd { color: #A00000 } /* Generic.Deleted */
body .ge { font-style: italic } /* Generic.Emph */
body .gr { color: #FF0000 } /* Generic.Error */
body .gh { color: #000080; font-weight: bold } /* Generic.Heading */
body .gi { color: #00A000 } /* Generic.Inserted */
body .go { color: #888888 } /* Generic.Output */
body .gp { color: #000080; font-weight: bold } /* Generic.Prompt */
body .gs { font-weight: bold } /* Generic.Strong */
body .gu { color: #800080; font-weight: bold } /* Generic.Subheading */
body .gt { color: #0044DD } /* Generic.Traceback */
body .kc { color: #AA22FF; font-weight: bold } /* Keyword.Constant */
body .kd { color: #AA22FF; font-weight: bold } /* Keyword.Declaration */
body .kn { color: #AA22FF; font-weight: bold } /* Keyword.Namespace */
body .kp { color: #AA22FF } /* Keyword.Pseudo */
body .kr { color: #AA22FF; font-weight: bold } /* Keyword.Reserved */
body .kt { color: #00BB00; font-weight: bold } /* Keyword.Type */
body .m { color: #666666 } /* Literal.Number */
body .s { color: #BB4444 } /* Literal.String */
body .na { color: #BB4444 } /* Name.Attribute */
body .nb { color: #AA22FF } /* Name.Builtin */
body .nc { color: #0000FF } /* Name.Class */
body .no { color: #880000 } /* Name.Constant */
body .nd { color: #AA22FF } /* Name.Decorator */
body .ni { color: #999999; font-weight: bold } /* Name.Entity */
body .ne { color: #D2413A; font-weight: bold } /* Name.Exception */
body .nf { color: #00A000 } /* Name.Function */
body .nl { color: #A0A000 } /* Name.Label */
body .nn { color: #0000FF; font-weight: bold } /* Name.Namespace */
body .nt { color: #008000; font-weight: bold } /* Name.Tag */
body .nv { color: #B8860B } /* Name.Variable */
body .ow { color: #AA22FF; font-weight: bold } /* Operator.Word */
body .w { color: #bbbbbb } /* Text.Whitespace */
body .mf { color: #666666 } /* Literal.Number.Float */
body .mh { color: #666666 } /* Literal.Number.Hex */
body .mi { color: #666666 } /* Literal.Number.Integer */
body .mo { color: #666666 } /* Literal.Number.Oct */
body .sb { color: #BB4444 } /* Literal.String.Backtick */
body .sc { color: #BB4444 } /* Literal.String.Char */
body .sd { color: #BB4444; font-style: italic } /* Literal.String.Doc */
body .s2 { color: #BB4444 } /* Literal.String.Double */
body .se { color: #BB6622; font-weight: bold } /* Literal.String.Escape */
body .sh { color: #BB4444 } /* Literal.String.Heredoc */
body .si { color: #BB6688; font-weight: bold } /* Literal.String.Interpol */
body .sx { color: #008000 } /* Literal.String.Other */
body .sr { color: #BB6688 } /* Literal.String.Regex */
body .s1 { color: #BB4444 } /* Literal.String.Single */
body .ss { color: #B8860B } /* Literal.String.Symbol */
body .bp { color: #AA22FF } /* Name.Builtin.Pseudo */
body .vc { color: #B8860B } /* Name.Variable.Class */
body .vg { color: #B8860B } /* Name.Variable.Global */
body .vi { color: #B8860B } /* Name.Variable.Instance */
body .il { color: #666666 } /* Literal.Number.Integer.Long */

  </style>
</head>
<body>
<h2></h2>

<div class="highlight"><pre><span class="gh">diff --git a/readme.md b/readme.md</span>
<span class="gh">index 825d8af..c72bccd 100644</span>
<span class="gd">--- a/readme.md</span>
<span class="gi">+++ b/readme.md</span>
<span class="gu">@@ -1 +1,5 @@</span>
<span class="gd">-# Lines</span>
\ No newline at end of file
<span class="gi">+# Lines</span>
<span class="gi">+</span>
<span class="gi">+- stage this line</span>
<span class="gi">+- but not this one</span>
<span class="gi">+- stage this one, too</span>
\ No newline at end of file
</pre></div>

In this case, I could just open the file and delete that line. But let's say there
are many lines, and need to be inspected one by one for the commit.

# `git add -p`

I was first given the option to add a hunk, which contained all of the lines or
to edit by entering 'e' at the console prompt. It brought up this window.

```
# Manual hunk edit mode -- see bottom for a quick guide
@@ -1 +1,5 @@
-# Lines
\ No newline at end of file
+# Lines
+
+- stage this line
+- but not this one
+- stage this one, too
\ No newline at end of file
# ---
# To remove '-' lines, make them ' ' lines (context).
# To remove '+' lines, delete them.
# Lines starting with # will be removed.
#
# If the patch applies cleanly, the edited hunk will immediately be
# marked for staging. If it does not apply cleanly, you will be given
# an opportunity to edit again. If all lines of the hunk are removed,
# then the edit is aborted and the hunk is left unchanged.
```

The `@@ -1 +1,5 @@` near the top is the range of lines changed. Well, this answer says it all!
<http://stackoverflow.com/questions/2529441/how-to-work-with-diff-representation-in-git#2530012>

to be continued...
